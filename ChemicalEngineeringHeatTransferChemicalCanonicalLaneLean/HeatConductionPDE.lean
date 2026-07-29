import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean

structure HeatConductionPackage where
  temperatureField : Type u
  thermalConductivity : Type v
  heatCapacity : Type w
  density : Type x
  heatSource : Type y
  boundaryCondition : Prop
  initialCondition : Prop
  heatEquation : Prop

structure HeatConductionEvidence (H : HeatConductionPackage) where
  boundaryConditionClosed : H.boundaryCondition
  initialConditionClosed : H.initialCondition
  heatEquationClosed : H.heatEquation

def HeatConductionClosed (H : HeatConductionPackage) : Prop :=
  H.boundaryCondition ∧ H.initialCondition ∧ H.heatEquation

theorem heat_conduction_closed_from_evidence (H : HeatConductionPackage) (E : HeatConductionEvidence H) : HeatConductionClosed H :=
  And.intro E.boundaryConditionClosed (And.intro E.initialConditionClosed E.heatEquationClosed)

end ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean
end HautevilleHouse