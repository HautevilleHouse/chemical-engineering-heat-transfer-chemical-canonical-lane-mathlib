import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringHeatTransferChemical

structure HeatExchangerNetworkPackage where
  streams : Nat
  heatCapacityRates : List Float
  terminalTemperatures : List Float
  supplyTemperatures : List Float
  targetTemperatures : List Float
  minApproachTemp : Float
  networkFeasible : Prop

structure HeatExchangerNetworkEvidence (H : HeatExchangerNetworkPackage) where
  heatBalanceClosed : H.networkFeasible
  temperatureCrossPrevented : H.minApproachTemp > 0

def HeatExchangerNetworkClosed (H : HeatExchangerNetworkPackage) : Prop :=
  H.networkFeasible ∧ H.minApproachTemp > 0

theorem heat_exchanger_network_closed_from_evidence (H : HeatExchangerNetworkPackage)
    (E : HeatExchangerNetworkEvidence H) : HeatExchangerNetworkClosed H := by
  exact And.intro E.heatBalanceClosed E.temperatureCrossPrevented

end ChemicalEngineeringHeatTransferChemical
end HautevilleHouse
