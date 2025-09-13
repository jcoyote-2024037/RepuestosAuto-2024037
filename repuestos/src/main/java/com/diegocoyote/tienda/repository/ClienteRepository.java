package com.diegocoyote.tienda.repository;

import com.diegocoyote.tienda.model.Cliente;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ClienteRepository extends JpaRepository<Cliente, Integer> {
    boolean existsByEmail(String email); // Validación: evitar clientes con email repetido
}
