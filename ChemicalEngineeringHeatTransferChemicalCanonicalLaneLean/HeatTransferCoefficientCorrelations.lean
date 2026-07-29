import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean.HeatEquationPDE

namespace HautevilleHouse
namespace ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean

structure HeatTransferCorrelationPackage {A : AdmissibleClass} (H : HeatEquationPackage A) where
  reynoldsNumber : Prop
  prandtlNumber : Prop
  nusseltNumber : Prop
  grashofNumber : Prop
  rayleighNumber : Prop
  forcedConvectionCorrelation : Prop
  naturalConvectionCorrelation : Prop
  correlationApplicability : Prop

structure HeatTransferCorrelationEvidence {A : AdmissibleClass} {H : HeatEquationPackage A} (C : HeatTransferCorrelationPackage H) where
  reynoldsNumberClosed : C.reynoldsNumber
  prandtlNumberClosed : C.prandtlNumber
  nusseltNumberClosed : C.nusseltNumber
  grashofNumberClosed : C.grashofNumber
  rayleighNumberClosed : C.rayleighNumber
  forcedConvectionCorrelationClosed : C.forcedConvectionCorrelation
  naturalConvectionCorrelationClosed : C.naturalConvectionCorrelation
  correlationApplicabilityClosed : C.correlationApplicability

def HeatTransferCorrelationClosed {A : AdmissibleClass} {H : HeatEquationPackage A} (C : HeatTransferCorrelationPackage H) : Prop :=
  C.reynoldsNumber ∧ C.prandtlNumber ∧ C.nusseltNumber ∧ C.grashofNumber ∧ C.rayleighNumber ∧ C.forcedConvectionCorrelation ∧ C.naturalConvectionCorrelation ∧ C.correlationApplicability

theorem heat_transfer_correlation_closed_from_evidence {A : AdmissibleClass} {H : HeatEquationPackage A} (C : HeatTransferCorrelationPackage H) (E : HeatTransferCorrelationEvidence C) : HeatTransferCorrelationClosed C := by
  exact And.intro E.reynoldsNumberClosed
    (And.intro E.prandtlNumberClosed
      (And.intro E.nusseltNumberClosed
        (And.intro E.grashofNumberClosed
          (And.intro E.rayleighNumberClosed
            (And.intro E.forcedConvectionCorrelationClosed
              (And.intro E.naturalConvectionCorrelationClosed E.correlationApplicabilityClosed))))))

end ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean
end HautevilleHouse