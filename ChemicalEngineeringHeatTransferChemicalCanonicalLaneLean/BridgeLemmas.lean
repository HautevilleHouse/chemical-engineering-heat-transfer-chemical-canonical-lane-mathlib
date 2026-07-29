import ChemicalEngineeringHeatTransferCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace ChemicalEngineeringHeatTransferChemical

structure HeatTransferSolutionClosed (O : HeatTransferAdmittedObject) : Prop where
  boundaryConditionMatched : Prop
  temperatureProfileUnique : Prop
  energyConservationHolds : Prop

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  (A.object.solutionTerm : _)

def bridgeClosed (A : AdmissibleClass) : Prop :=
  HeatTransferSolutionClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.solutionTerm

end ChemicalEngineeringHeatTransferChemical
end HautevilleHouse