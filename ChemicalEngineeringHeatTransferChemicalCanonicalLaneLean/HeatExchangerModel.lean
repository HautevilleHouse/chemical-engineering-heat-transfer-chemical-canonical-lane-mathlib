import ChemicalEngineeringHeatTransferCanonicalLaneLean.FourierEquation

namespace HautevilleHouse
namespace ChemicalEngineeringHeatTransferChemical

structure HeatExchangerPackage {ω : Type} (F : FourierEquationPackage ω) where
  hotInletTemp : ℝ
  coldInletTemp : ℝ
  heatTransferCoefficient : ℝ
  surfaceArea : ℝ
  flowConfiguration : String
  effectivenessComputed : Prop
  ntuComputed : Prop

structure HeatExchangerEvidence {ω : Type} {F : FourierEquationPackage ω} (H : HeatExchangerPackage F) where
  effectivenessComputedClosed : H.effectivenessComputed
  ntuComputedClosed : H.ntuComputed

def HeatExchangerClosed {ω : Type} {F : FourierEquationPackage ω} (H : HeatExchangerPackage F) : Prop :=
  H.effectivenessComputed ∧ H.ntuComputed

theorem heat_exchanger_closed_from_evidence {ω : Type} {F : FourierEquationPackage ω} (H : HeatExchangerPackage F) (E : HeatExchangerEvidence H) : HeatExchangerClosed H :=
  And.intro E.effectivenessComputedClosed E.ntuComputedClosed

end ChemicalEngineeringHeatTransferChemical
end HautevilleHouse