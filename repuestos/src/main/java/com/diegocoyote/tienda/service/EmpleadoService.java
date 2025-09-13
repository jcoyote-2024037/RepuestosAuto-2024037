package com.diegocoyote.tienda.service;

import com.diegocoyote.tienda.model.Empleado;
import java.util.List;

public interface EmpleadoService {
    List<Empleado> getAllEmpleados();
    Empleado getEmpleadoById(Integer id);
    Empleado saveEmpleado(Empleado empleado);
    Empleado updateEmpleado(Integer id, Empleado empleado);
    void deleteEmpleado(Integer id);
}
