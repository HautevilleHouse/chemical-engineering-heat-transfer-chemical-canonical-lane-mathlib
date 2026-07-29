import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringHeatTransferChemical

structure HeatTransferAdmittedObject where
  streamData : Type
  temperatureSpecification : Prop
  heatTransferCoefficient : Prop
  feasibilityCheck : Prop
  conclusion : feasibilityCheck

structure AdmissibleClass where
  object : HeatTransferAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.feasibilityCheck) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ChemicalEngineeringHeatTransferChemical
end HautevilleHouse