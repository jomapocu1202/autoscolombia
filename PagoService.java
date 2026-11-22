// Servicio de Negocio: PagoService.java (Fragmento principal)
@Transactional
public Pago registrarPago(Pago pago, String tipoVehiculo) {
    String placaNormalizada = pago.getPlacaVehiculo().toUpperCase().trim();
    pago.setPlacaVehiculo(placaNormalizada);

    if (pagoRepository.existsByPlacaVehiculoAndPeriodoPagadoAndEstado(
            placaNormalizada, pago.getPeriodoPagado(), "ACTIVO")) {
        throw new IllegalArgumentException("Ya existe un pago activo para este periodo.");
    }

    Tarifa tarifa = tarifaRepository.findByTipoVehiculo(tipoVehiculo.toUpperCase())
            .orElseThrow(() -> new IllegalArgumentException("Tarifa no configurada."));

    pago.setMonto(tarifa.getValorMensual());
    pago.setNumeroRecibo("REC-" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
    pago.setFechaVencimiento(LocalDate.now().plusDays(30));

    return pagoRepository.save(pago);
}
