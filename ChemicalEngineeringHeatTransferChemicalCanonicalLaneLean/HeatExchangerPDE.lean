import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringHeatTransferChemical

structure HeatExchangerFlowPackage where
  fluidStreams : Type
  temperatureField : Type
  heatFlux : Type
  energyConservationLaw : Prop
  temperatureContinuity : Prop
  thermalBoundaryConditions : Prop

structure HeatExchangerFlowEvidence (H : HeatExchangerFlowPackage) where
  energyConservationLawClosed : H.energyConservationLaw
  temperatureContinuityClosed : H.temperatureContinuity
  thermalBoundaryConditionsClosed : H.thermalBoundaryConditions

def HeatExchangerFlowClosed (H : HeatExchangerFlowPackage) : Prop :=
  H.energyConservationLaw ∧ H.temperatureContinuity ∧ H.thermalBoundaryConditions

theorem heat_exchanger_flow_closed_from_evidence
    (H : HeatExchangerFlowPackage) (E : HeatExchangerFlowEvidence H) :
    HeatExchangerFlowClosed H := by
  exact And.intro E.energyConservationLawClosed
    (And.intro E.temperatureContinuityClosed E.thermalBoundaryConditionsClosed)

end ChemicalEngineeringHeatTransferChemical
end HautevilleHouse