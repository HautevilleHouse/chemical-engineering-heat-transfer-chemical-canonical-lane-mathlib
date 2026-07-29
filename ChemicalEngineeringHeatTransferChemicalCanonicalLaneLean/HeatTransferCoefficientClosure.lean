import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringHeatTransferChemical

structure HeatTransferCoefficientPackage where
  nusseltNumber : Float
  reynoldsNumber : Float
  prandtlNumber : Float
  thermalConductivity : Float
  charLength : Float
  correlationValid : Prop

def HeatTransferCoefficientClosed (H : HeatTransferCoefficientPackage) : Prop :=
  H.correlationValid ∧ H.nusseltNumber = 0.023 * H.reynoldsNumber^0.8 * H.prandtlNumber^0.4

structure HeatTransferCoefficientEvidence (H : HeatTransferCoefficientPackage) where
  correlationClosed : H.correlationValid
  nusseltFormula : H.nusseltNumber = 0.023 * H.reynoldsNumber^0.8 * H.prandtlNumber^0.4

theorem heat_transfer_coefficient_closed_from_evidence (H : HeatTransferCoefficientPackage)
    (E : HeatTransferCoefficientEvidence H) : HeatTransferCoefficientClosed H := by
  exact And.intro E.correlationClosed E.nusseltFormula

end ChemicalEngineeringHeatTransferChemical
end HautevilleHouse
