import ChemicalEngineeringHeatTransferCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringHeatTransferChemical

structure FourierEquationPackage (ω : Type) where
  temperature : ω → ℝ → ℝ
  thermalDiffusivity : ℝ
  initialCondition : ω → ℝ
  boundaryCondition : ω → ℝ → ℝ
  sourceTerm : ω → ℝ → ℝ
  pdeSatisfied : Prop

structure FourierEquationEvidence {ω : Type} (F : FourierEquationPackage ω) where
  pdeSatisfiedClosed : F.pdeSatisfied

def FourierEquationClosed {ω : Type} (F : FourierEquationPackage ω) : Prop :=
  F.pdeSatisfied

theorem fourier_equation_closed_from_evidence {ω : Type} (F : FourierEquationPackage ω) (E : FourierEquationEvidence F) : FourierEquationClosed F :=
  E.pdeSatisfiedClosed

end ChemicalEngineeringHeatTransferChemical
end HautevilleHouse