# The LocomotiveEngineer class provides methods for generating a list of wagons, fixing the order of
# wagons, adding missing stops to a routing, and extending route information.
class LocomotiveEngineer
  # Usar variável de classe para armazenar IDs de vagões
  @@wagon_ids = []

  # Gerar uma lista de vagões
  def self.generate_list_of_wagons(*wagon_ids)
    @@wagon_ids = wagon_ids
  end

  # Corrigir a ordem dos vagões
  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    first_loco = each_wagons_id.index(1)
    [1] + missing_wagons + each_wagons_id[(first_loco+1)..-1] + each_wagons_id[0...first_loco]
  end

  # Adicionar paradas faltantes
  def self.add_missing_stops(routing, **stops)
    # Filtrar as paradas, ordenar por seus números e mapear apenas a cidade
    added_stops = stops.sort_by { |k, _| k.to_s.split('_').last.to_i }.map { |_, v| v }
    routing[:stops] = added_stops
    routing
  end

  # Estender as informações da rota
  def self.extend_route_information(route, more_route_information)
    route.merge(more_route_information)
  end
end
