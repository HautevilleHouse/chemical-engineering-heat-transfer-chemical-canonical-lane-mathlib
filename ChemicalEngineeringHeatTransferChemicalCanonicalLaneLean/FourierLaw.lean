import ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean.AdmissibleClass

/-!
# Fourier's Law Package
-/

namespace HautevilleHouse
namespace ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean

structure FourierLawPackage where
  thermalConductivity : ℝ
  temperatureGradient : ℝ → ℝ
  heatFlux : ℝ → ℝ
  lawStatement : heatFlux = - thermalConductivity * temperatureGradient
  positivityConductivity : thermalConductivity > 0

structure FourierLawEvidence (F : FourierLawPackage) where
  lawStatementClosed : F.lawStatement
  positivityConductivityClosed : F.positivityConductivity

def FourierLawClosed (F : FourierLawPackage) : Prop :=
  F.lawStatement ∧ F.positivityConductivity

theorem fourier_law_closed_from_evidence (F : FourierLawPackage) (E : FourierLawEvidence F) :
    FourierLawClosed F := by
  exact And.intro E.lawStatementClosed E.positivityConductivityClosed

end ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean
end HautevilleHouse
