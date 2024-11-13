package A3.Auth.services;

import A3.Auth.exceptions.ResourceNotFoundException;
import A3.Auth.model.product.Products;
import A3.Auth.model.product.ProductsDTO;
import A3.Auth.repositories.ProductsRepository;
import jakarta.persistence.EntityNotFoundException;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.*;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class ProductsServiceTest {

    @InjectMocks
    private ProductsService service;

    @Mock
    private ProductsRepository repository;

    @BeforeEach
    public void setUp(){
        UUID id1 = UUID.fromString("123e4567-e89b-12d3-a456-426614174000");
        UUID id2 = UUID.fromString("222e4569-f89b-15d3-c456-626614174111");
        Products product1 = new Products(id1, "Disco de vinil Sour - Olivia Rodrigo", 22.70, 13, "Disco de vinil da para melhorar seu dia com boas musicas", "POP");
        Products product2 = new Products(id2, "Disco de vinil (weverse Ver.) Newjeans New Jeans 1º Álbum Ep", 29.50, 19, "Disco de vinil da para melhorar seu dia com boas musicas", "K-POP");
        List<Products> listProducts = Arrays.asList(product1, product2);
        lenient().when(repository.findById(id1)).thenReturn(Optional.of(product1));
        lenient().when(repository.findAll()).thenReturn(listProducts);
    }

    @Test
    @DisplayName("Deve retornar uma lista com 1 produto")
    public void findAllCase1(){
        List<Products> list = service.findAll();

        assertEquals(2, list.size());

        verify(repository).findAll();
        verifyNoMoreInteractions(repository);
    }

    @Test
    @DisplayName("Deve retornar um produto pelo seu ID")
    public void findByIdCase1(){
        Products product = service.findById(UUID.fromString("123e4567-e89b-12d3-a456-426614174000"));

        assertNotNull(product);
    }

    @Test
    @DisplayName("Deve inserir um produto")
    public void insertCase1(){
        ProductsDTO productData = new ProductsDTO("Disco de vinil Sour - Olivia Rodrigo", 22.70, 13, "Disco de vinil da para melhorar seu dia com boas musicas", "POP");
        var product = new Products(productData);

        when(repository.save(product)).thenReturn(product);

        Products savedProduct = service.insert(productData);

        verify(repository, times(1)).save(product);

        assertEquals("Disco de vinil Sour - Olivia Rodrigo", savedProduct.getName());
        assertEquals(22.70, savedProduct.getPrice());
        assertEquals(13, savedProduct.getQuantity());
        assertEquals("Disco de vinil da para melhorar seu dia com boas musicas", savedProduct.getDescription());
        assertEquals( "POP", savedProduct.getCategory());
    }

    @Test
    @DisplayName("Deve deletar um produto pelo ID")
    public void deleteCase1(){

        UUID id = UUID.randomUUID();

        service.delete(id);

        verify(repository, times(1)).deleteById(id);
    }

    @Test
    @DisplayName("Deve lançar uma exceção ao tentar deletar um produto inexistente")
    public void deleteCase2(){

        UUID id = UUID.randomUUID();

        doThrow(new EntityNotFoundException("Produto não encontrado")).when(repository).deleteById(id);

        assertThrows(EntityNotFoundException.class, () -> service.delete(id));

        verify(repository, times(1)).deleteById(id);
    }

    @Test
    @DisplayName("Deve atualizar um produto pelo ID")
    public void updateCase1(){
        UUID id = UUID.randomUUID();

        ProductsDTO productsData = new ProductsDTO("Disco de vinil Sour - Olivia Rodrigo", 22.70, 13, "Disco de vinil da para melhorar seu dia com boas musicas", "POP");

        Products products = new Products(productsData);

        when(repository.getReferenceById(id)).thenReturn(products);
        when(repository.save(any(Products.class))).thenReturn(products);

        Products updateProduct = service.update(id, productsData);

        verify(repository).save(products);

        assertEquals(products, updateProduct);

    }

    @Test
    @DisplayName("Deve lançar exceção ao tentar atualizar um produto inexistente")
    public void updateCase2(){
        UUID id = UUID.randomUUID();

        ProductsDTO productData = new ProductsDTO("Produto não existente", 19.99, 5, "Descrição", "Categoria");

        when(repository.getReferenceById(id)).thenThrow(new ResourceNotFoundException(id));

        assertThrows(ResourceNotFoundException.class, () -> service.update(id, productData));

        verify(repository, never()).save(any(Products.class));

    }
}
