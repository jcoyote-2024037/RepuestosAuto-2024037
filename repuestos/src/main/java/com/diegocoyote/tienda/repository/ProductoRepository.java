package com.diegocoyote.tienda.repository;

import com.diegocoyote.tienda.model.Producto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductoRepository extends JpaRepository<Producto, Integer> {
    boolean existsByNombre(String nombre); // Validación: no permitir productos duplicados por nombre
}
