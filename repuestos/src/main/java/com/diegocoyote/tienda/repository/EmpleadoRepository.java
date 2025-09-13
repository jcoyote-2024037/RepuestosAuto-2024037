package com.diegocoyote.tienda.repository;

import com.diegocoyote.tienda.model.Empleado;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EmpleadoRepository extends JpaRepository<Empleado, Integer> {
    boolean existsByEmail(String email); // Validación: evitar empleados con email repetido
}
