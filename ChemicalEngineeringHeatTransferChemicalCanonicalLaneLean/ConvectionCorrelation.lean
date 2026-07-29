import ChemicalEngineeringHeatTransferCanonicalLaneLean.HeatExchangerModel

namespace HautevilleHouse
namespace ChemicalEngineeringHeatTransferChemical

structure ConvectionCorrelationPackage {ω : Type} {F : FourierEquationPackage ω} (H : HeatExchangerPackage F) where
  reynoldsNumber : ℝ
  prandtlNumber : ℝ
  nusseltNumber : ℝ
  correlationEquation : String
  correlationValidated : Prop

structure ConvectionCorrelationEvidence {ω : Type} {F : FourierEquationPackage ω} {H : HeatExchangerPackage F} (C : ConvectionCorrelationPackage H) where
  correlationValidatedClosed : C.correlationValidated

def ConvectionCorrelationClosed {ω : Type} {F : FourierEquationPackage ω} {H : HeatExchangerPackage F} (C : ConvectionCorrelationPackage H) : Prop :=
  C.correlationValidated

theorem convection_correlation_closed_from_evidence {ω : Type} {F : FourierEquationPackage ω} {H : HeatExchangerPackage F} (C : ConvectionCorrelationPackage H) (E : ConvectionCorrelationEvidence C) : ConvectionCorrelationClosed C :=
  E.correlationValidatedClosed

end ChemicalEngineeringHeatTransferChemical
end HautevilleHouse