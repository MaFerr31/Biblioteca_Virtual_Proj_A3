package A3.Auth.controllers;

import A3.Auth.model.product.Products;
import A3.Auth.model.product.ProductsDTO;
import A3.Auth.services.ProductsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/products")
public class ProductsController {

    @Autowired
    private ProductsService service;

    @GetMapping
    public ResponseEntity<List<Products>> findAll(){
        List<Products> list = service.findAll();
        return ResponseEntity.ok().body(list);
    }

    @GetMapping(value = "/{id}")
    public ResponseEntity<Products> findById(@PathVariable UUID id){
       Products obj = service.findById(id);
       return ResponseEntity.ok().body(obj);
    }

    @PostMapping
    public ResponseEntity<Products> insert(@RequestBody ProductsDTO productsData){
        Products obj = service.insert(productsData);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(obj.getId()).toUri();
        return ResponseEntity.created(uri).body(obj);
    }

    @DeleteMapping(value = "/{id}")
    public ResponseEntity<Void> delete(@PathVariable UUID id){
        service.delete(id);
        return ResponseEntity.noContent().build();
    }

    @PutMapping(value = "/{id}")
    public ResponseEntity<Products> update(@PathVariable UUID id, @RequestBody ProductsDTO productsData){
        Products obj = service.update(id, productsData);
        return ResponseEntity.ok().body(obj);
    }
}
