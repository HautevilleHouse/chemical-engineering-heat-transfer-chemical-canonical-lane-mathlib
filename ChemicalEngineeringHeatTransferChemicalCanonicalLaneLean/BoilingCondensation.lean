import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean

structure BoilingCondensationPackage where
  nucleateBoiling : Type u
  filmBoiling : Type v
  dropwiseCondensation : Type w
  filmwiseCondensation : Type x
  criticalHeatFlux : Prop
  boilingCurve : Prop
  condensationHeatTransfer : Prop

structure BoilingCondensationEvidence (B : BoilingCondensationPackage) where
  criticalHeatFluxClosed : B.criticalHeatFlux
  boilingCurveClosed : B.boilingCurve
  condensationHeatTransferClosed : B.condensationHeatTransfer

def BoilingCondensationClosed (B : BoilingCondensationPackage) : Prop :=
  B.criticalHeatFlux ∧ B.boilingCurve ∧ B.condensationHeatTransfer

theorem boiling_condensation_closed_from_evidence (B : BoilingCondensationPackage) (E : BoilingCondensationEvidence B) : BoilingCondensationClosed B :=
  And.intro E.criticalHeatFluxClosed (And.intro E.boilingCurveClosed E.condensationHeatTransferClosed)

end ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean
end HautevilleHouse