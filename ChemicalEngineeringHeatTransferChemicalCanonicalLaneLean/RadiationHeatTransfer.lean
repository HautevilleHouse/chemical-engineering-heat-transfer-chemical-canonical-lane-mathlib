import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean.HeatEquationPDE

namespace HautevilleHouse
namespace ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean

structure RadiationPackage {A : AdmissibleClass} (H : HeatEquationPackage A) where
  emissivity : Prop
  absorptivity : Prop
  viewFactor : Prop
  surfaceTemperature : Prop
  radiationFlux : Prop
  stefanBoltzmannConstant : Prop
  netRadiation : Prop

structure RadiationEvidence {A : AdmissibleClass} {H : HeatEquationPackage A} (R : RadiationPackage H) where
  emissivityClosed : R.emissivity
  absorptivityClosed : R.absorptivity
  viewFactorClosed : R.viewFactor
  surfaceTemperatureClosed : R.surfaceTemperature
  radiationFluxClosed : R.radiationFlux
  stefanBoltzmannConstantClosed : R.stefanBoltzmannConstant
  netRadiationClosed : R.netRadiation

def RadiationClosed {A : AdmissibleClass} {H : HeatEquationPackage A} (R : RadiationPackage H) : Prop :=
  R.emissivity ∧ R.absorptivity ∧ R.viewFactor ∧ R.surfaceTemperature ∧ R.radiationFlux ∧ R.stefanBoltzmannConstant ∧ R.netRadiation

theorem radiation_closed_from_evidence {A : AdmissibleClass} {H : HeatEquationPackage A} (R : RadiationPackage H) (E : RadiationEvidence R) : RadiationClosed R := by
  exact And.intro E.emissivityClosed
    (And.intro E.absorptivityClosed
      (And.intro E.viewFactorClosed
        (And.intro E.surfaceTemperatureClosed
          (And.intro E.radiationFluxClosed
            (And.intro E.stefanBoltzmannConstantClosed E.netRadiationClosed)))))

end ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean
end HautevilleHouse