package com.diegocoyote.tienda.service;

import com.diegocoyote.tienda.model.Producto;
import com.diegocoyote.tienda.repository.ProductoRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Service
public class ProductoServiceImpl implements ProductoService {

    private final ProductoRepository productoRepository;

    public ProductoServiceImpl(ProductoRepository productoRepository) {
        this.productoRepository = productoRepository;
    }

    @Override
    public List<Producto> getAllProductos() {
        return productoRepository.findAll();
    }

    @Override
    public Producto getProductoById(Integer id) {
        return productoRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Producto no encontrado."));
    }

    @Override
    public Producto saveProducto(Producto producto) {
        if (productoRepository.existsByNombre(producto.getNombre())) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "El producto ya existe.");
        }
        return productoRepository.save(producto);
    }

    @Override
    public Producto updateProducto(Integer id, Producto producto) {
        Producto existingProducto = productoRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Producto no encontrado."));

        if (productoRepository.existsByNombre(producto.getNombre()) &&
                !existingProducto.getNombre().equals(producto.getNombre())) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "El producto ya existe.");
        }

        existingProducto.setNombre(producto.getNombre());
        existingProducto.setDescripcion(producto.getDescripcion());
        existingProducto.setPrecio(producto.getPrecio());
        existingProducto.setStock(producto.getStock());

        return productoRepository.save(existingProducto);
    }

    @Override
    public void deleteProducto(Integer id) {
        productoRepository.deleteById(id);
    }
}
