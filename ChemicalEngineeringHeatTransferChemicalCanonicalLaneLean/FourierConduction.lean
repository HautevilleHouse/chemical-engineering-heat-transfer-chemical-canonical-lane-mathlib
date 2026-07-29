import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringHeatTransferChemical

structure FourierConductionPackage where
  thermalConductivity : Type
  temperatureGradient : Type
  heatFluxDensity : Type
  fourierLawProportionality : Prop
  materialIsotropyAssumption : Prop
  transportCoefDefined : Prop

structure FourierConductionEvidence (F : FourierConductionPackage) where
  fourierLawProportionalityClosed : F.fourierLawProportionality
  materialIsotropyAssumptionClosed : F.materialIsotropyAssumption
  transportCoefDefinedClosed : F.transportCoefDefined

def FourierConductionClosed (F : FourierConductionPackage) : Prop :=
  F.fourierLawProportionality ∧ F.materialIsotropyAssumption ∧ F.transportCoefDefined

theorem fourier_conduction_closed_from_evidence
    (F : FourierConductionPackage) (E : FourierConductionEvidence F) :
    FourierConductionClosed F := by
  exact And.intro E.fourierLawProportionalityClosed
    (And.intro E.materialIsotropyAssumptionClosed E.transportCoefDefinedClosed)

end ChemicalEngineeringHeatTransferChemical
end HautevilleHouse