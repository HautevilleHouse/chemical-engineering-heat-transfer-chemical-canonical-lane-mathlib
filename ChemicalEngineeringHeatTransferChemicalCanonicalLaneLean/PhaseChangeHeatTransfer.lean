import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean.HeatEquationPDE

namespace HautevilleHouse
namespace ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean

structure PhaseChangePackage {A : AdmissibleClass} (H : HeatEquationPackage A) where
  latentHeat : Prop
  phaseTransitionTemperature : Prop
  solidFraction : Prop
  liquidFraction : Prop
  enthalpyChange : Prop
  movingBoundary : Prop
  energyBalance : Prop

structure PhaseChangeEvidence {A : AdmissibleClass} {H : HeatEquationPackage A} (P : PhaseChangePackage H) where
  latentHeatClosed : P.latentHeat
  phaseTransitionTemperatureClosed : P.phaseTransitionTemperature
  solidFractionClosed : P.solidFraction
  liquidFractionClosed : P.liquidFraction
  enthalpyChangeClosed : P.enthalpyChange
  movingBoundaryClosed : P.movingBoundary
  energyBalanceClosed : P.energyBalance

def PhaseChangeClosed {A : AdmissibleClass} {H : HeatEquationPackage A} (P : PhaseChangePackage H) : Prop :=
  P.latentHeat ∧ P.phaseTransitionTemperature ∧ P.solidFraction ∧ P.liquidFraction ∧ P.enthalpyChange ∧ P.movingBoundary ∧ P.energyBalance

theorem phase_change_closed_from_evidence {A : AdmissibleClass} {H : HeatEquationPackage A} (P : PhaseChangePackage H) (E : PhaseChangeEvidence P) : PhaseChangeClosed P := by
  exact And.intro E.latentHeatClosed
    (And.intro E.phaseTransitionTemperatureClosed
      (And.intro E.solidFractionClosed
        (And.intro E.liquidFractionClosed
          (And.intro E.enthalpyChangeClosed
            (And.intro E.movingBoundaryClosed E.energyBalanceClosed)))))

end ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean
end HautevilleHouse