package A3.Auth.services;

import A3.Auth.exceptions.DatabaseException;
import A3.Auth.exceptions.ResourceNotFoundException;
import A3.Auth.model.product.Products;
import A3.Auth.model.product.ProductsDTO;
import A3.Auth.repositories.ProductsRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class ProductsService {

    @Autowired
    private ProductsRepository repository;

    public List<Products> findAll(){
        return repository.findAll();
    }

    public Products findById(UUID id){
        Optional<Products> obj = repository.findById(id);
        return obj.orElseThrow(() -> new ResourceNotFoundException(id));
    }

    public Products insert(ProductsDTO productsDTO){
        var obj = new Products(productsDTO);
        return repository.save(obj);
    }

    public void delete(UUID id){
        try{
            repository.deleteById(id);
        }catch(EmptyResultDataAccessException e){
            throw new ResourceNotFoundException(id);
        }catch(DataIntegrityViolationException e){
            throw new DatabaseException(e.getMessage());
        }
    }

    public Products update(UUID id, ProductsDTO productsData){
        try {
            Products entity = repository.getReferenceById(id);
            updateData(entity, productsData);
            return repository.save(entity);
        }catch(EntityNotFoundException e){
            throw new ResourceNotFoundException(id);
        }
    }

    public void updateData(Products entity, ProductsDTO productsDTO){
        entity.setName(productsDTO.name());
        entity.setPrice(productsDTO.price());
        entity.setQuantity(productsDTO.quantity());
        entity.setDescription(productsDTO.description());
        entity.setCategory(productsDTO.category());
    }
}
