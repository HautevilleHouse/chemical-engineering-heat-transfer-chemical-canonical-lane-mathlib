import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean

structure ThermalRadiationPackage where
  emissivity : Type u
  absorptivity : Type v
  viewFactor : Type w
  blackbodyRadiation : Prop
  grayBodyRadiation : Prop
  radiationExchange : Prop

structure ThermalRadiationEvidence (R : ThermalRadiationPackage) where
  blackbodyRadiationClosed : R.blackbodyRadiation
  grayBodyRadiationClosed : R.grayBodyRadiation
  radiationExchangeClosed : R.radiationExchange

def ThermalRadiationClosed (R : ThermalRadiationPackage) : Prop :=
  R.blackbodyRadiation ∧ R.grayBodyRadiation ∧ R.radiationExchange

theorem thermal_radiation_closed_from_evidence (R : ThermalRadiationPackage) (E : ThermalRadiationEvidence R) : ThermalRadiationClosed R :=
  And.intro E.blackbodyRadiationClosed (And.intro E.grayBodyRadiationClosed E.radiationExchangeClosed)

end ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean
end HautevilleHouse