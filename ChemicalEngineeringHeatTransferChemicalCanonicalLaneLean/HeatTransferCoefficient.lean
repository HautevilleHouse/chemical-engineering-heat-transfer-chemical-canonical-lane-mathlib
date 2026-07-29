import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean

structure HeatTransferCoefficientPackage where
  convectionCoefficient : Type u
  overallCoefficient : Type v
  foulingFactor : Type w
  naturalConvectionCorrelation : Prop
  forcedConvectionCorrelation : Prop
  foulingResistance : Prop

structure HeatTransferCoefficientEvidence (H : HeatTransferCoefficientPackage) where
  naturalConvectionCorrelationClosed : H.naturalConvectionCorrelation
  forcedConvectionCorrelationClosed : H.forcedConvectionCorrelation
  foulingResistanceClosed : H.foulingResistance

def HeatTransferCoefficientClosed (H : HeatTransferCoefficientPackage) : Prop :=
  H.naturalConvectionCorrelation ∧ H.forcedConvectionCorrelation ∧ H.foulingResistance

theorem heat_transfer_coefficient_closed_from_evidence (H : HeatTransferCoefficientPackage) (E : HeatTransferCoefficientEvidence H) : HeatTransferCoefficientClosed H :=
  And.intro E.naturalConvectionCorrelationClosed (And.intro E.forcedConvectionCorrelationClosed E.foulingResistanceClosed)

end ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean
end HautevilleHouse