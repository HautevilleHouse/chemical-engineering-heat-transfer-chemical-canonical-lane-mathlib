import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean

structure HeatExchangerPackage where
  overallHeatTransferCoefficient : Type u
  logMeanTemperatureDifference : Type v
  effectiveness : Type w
  NTU : Type x
  counterFlow : Prop
  parallelFlow : Prop
  shellAndTube : Prop

structure HeatExchangerEvidence (H : HeatExchangerPackage) where
  counterFlowClosed : H.counterFlow
  parallelFlowClosed : H.parallelFlow
  shellAndTubeClosed : H.shellAndTube

def HeatExchangerClosed (H : HeatExchangerPackage) : Prop :=
  H.counterFlow ∧ H.parallelFlow ∧ H.shellAndTube

theorem heat_exchanger_closed_from_evidence (H : HeatExchangerPackage) (E : HeatExchangerEvidence H) : HeatExchangerClosed H :=
  And.intro E.counterFlowClosed (And.intro E.parallelFlowClosed E.shellAndTubeClosed)

end ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean
end HautevilleHouse