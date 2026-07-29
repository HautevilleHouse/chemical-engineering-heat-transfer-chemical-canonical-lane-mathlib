import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean

structure HeatEquationPackage (A : AdmissibleClass) where
  thermalConductivity : Prop
  specificHeat : Prop
  density : Prop
  temperatureField : Prop
  heatEquation : Prop
  initialCondition : Prop
  boundaryCondition : Prop

structure HeatEquationEvidence {A : AdmissibleClass} (H : HeatEquationPackage A) where
  thermalConductivityClosed : H.thermalConductivity
  specificHeatClosed : H.specificHeat
  densityClosed : H.density
  temperatureFieldClosed : H.temperatureField
  heatEquationClosed : H.heatEquation
  initialConditionClosed : H.initialCondition
  boundaryConditionClosed : H.boundaryCondition

def HeatEquationClosed {A : AdmissibleClass} (H : HeatEquationPackage A) : Prop :=
  H.thermalConductivity ∧ H.specificHeat ∧ H.density ∧ H.temperatureField ∧ H.heatEquation ∧ H.initialCondition ∧ H.boundaryCondition

theorem heat_equation_closed_from_evidence {A : AdmissibleClass} (H : HeatEquationPackage A) (E : HeatEquationEvidence H) : HeatEquationClosed H := by
  exact And.intro E.thermalConductivityClosed
    (And.intro E.specificHeatClosed
      (And.intro E.densityClosed
        (And.intro E.temperatureFieldClosed
          (And.intro E.heatEquationClosed
            (And.intro E.initialConditionClosed E.boundaryConditionClosed)))))

end ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean
end HautevilleHouse