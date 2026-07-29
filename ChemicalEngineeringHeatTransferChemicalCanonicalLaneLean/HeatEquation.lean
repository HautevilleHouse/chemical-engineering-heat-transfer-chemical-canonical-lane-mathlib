import ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean.FourierLaw

/-!
# Heat Equation Package
-/

namespace HautevilleHouse
namespace ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean

structure HeatEquationPackage (F : FourierLawPackage) where
  temperatureField : ℝ × ℝ → ℝ
  thermalDiffusivity : ℝ
  equation : ∂/∂t temperatureField = thermalDiffusivity * Δ temperatureField
  diffusivityPositive : thermalDiffusivity > 0

structure HeatEquationEvidence {F : FourierLawPackage} (H : HeatEquationPackage F) where
  equationClosed : H.equation
  diffusivityPositiveClosed : H.diffusivityPositive

def HeatEquationClosed {F : FourierLawPackage} (H : HeatEquationPackage F) : Prop :=
  H.equation ∧ H.diffusivityPositive

theorem heat_equation_closed_from_evidence {F : FourierLawPackage} (H : HeatEquationPackage F)
    (E : HeatEquationEvidence H) : HeatEquationClosed H := by
  exact And.intro E.equationClosed E.diffusivityPositiveClosed

end ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean
end HautevilleHouse
