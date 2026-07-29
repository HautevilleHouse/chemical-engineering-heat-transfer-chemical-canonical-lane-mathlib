import ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean.HeatEquation

/-!
# Convection-Diffusion Package
-/

namespace HautevilleHouse
namespace ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean

structure ConvectionDiffusionPackage {F : FourierLawPackage} (H : HeatEquationPackage F) where
  velocityField : ℝ × ℝ → ℝ × ℝ
  massFlux : ℝ × ℝ → ℝ × ℝ
  equation : ∂/∂t massFlux + velocityField · ∇ massFlux = H.thermalDiffusivity * Δ massFlux
  velocityBounded : ∃ M : ℝ, ∀ x, ‖velocityField x‖ ≤ M

structure ConvectionDiffusionEvidence {F : FourierLawPackage} {H : HeatEquationPackage F}
    (C : ConvectionDiffusionPackage H) where
  equationClosed : C.equation
  velocityBoundedClosed : C.velocityBounded

def ConvectionDiffusionClosed {F : FourierLawPackage} {H : HeatEquationPackage F}
    (C : ConvectionDiffusionPackage H) : Prop :=
  C.equation ∧ C.velocityBounded

theorem convection_diffusion_closed_from_evidence {F : FourierLawPackage} {H : HeatEquationPackage F}
    (C : ConvectionDiffusionPackage H) (E : ConvectionDiffusionEvidence C) :
    ConvectionDiffusionClosed C := by
  exact And.intro E.equationClosed E.velocityBoundedClosed

end ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean
end HautevilleHouse
