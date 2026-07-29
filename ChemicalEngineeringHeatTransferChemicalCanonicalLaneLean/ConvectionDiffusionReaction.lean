import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean.HeatEquationPDE

namespace HautevilleHouse
namespace ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean

structure ConvectionDiffusionReactionPackage {A : AdmissibleClass} (H : HeatEquationPackage A) where
  velocityField : Prop
  diffusionCoefficient : Prop
  reactionRate : Prop
  convectionTerm : Prop
  diffusionTerm : Prop
  reactionTerm : Prop
  sourceTerm : Prop
  totalEquation : Prop

structure ConvectionDiffusionReactionEvidence {A : AdmissibleClass} {H : HeatEquationPackage A} (C : ConvectionDiffusionReactionPackage H) where
  velocityFieldClosed : C.velocityField
  diffusionCoefficientClosed : C.diffusionCoefficient
  reactionRateClosed : C.reactionRate
  convectionTermClosed : C.convectionTerm
  diffusionTermClosed : C.diffusionTerm
  reactionTermClosed : C.reactionTerm
  sourceTermClosed : C.sourceTerm
  totalEquationClosed : C.totalEquation

def ConvectionDiffusionReactionClosed {A : AdmissibleClass} {H : HeatEquationPackage A} (C : ConvectionDiffusionReactionPackage H) : Prop :=
  C.velocityField ∧ C.diffusionCoefficient ∧ C.reactionRate ∧ C.convectionTerm ∧ C.diffusionTerm ∧ C.reactionTerm ∧ C.sourceTerm ∧ C.totalEquation

theorem convection_diffusion_reaction_closed_from_evidence {A : AdmissibleClass} {H : HeatEquationPackage A} (C : ConvectionDiffusionReactionPackage H) (E : ConvectionDiffusionReactionEvidence C) : ConvectionDiffusionReactionClosed C := by
  exact And.intro E.velocityFieldClosed
    (And.intro E.diffusionCoefficientClosed
      (And.intro E.reactionRateClosed
        (And.intro E.convectionTermClosed
          (And.intro E.diffusionTermClosed
            (And.intro E.reactionTermClosed
              (And.intro E.sourceTermClosed E.totalEquationClosed))))))

end ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean
end HautevilleHouse