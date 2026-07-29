import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringHeatTransferChemical

structure FourierConductionPackage where
  thermalConductivity : Float → Float
  temperatureGrad : Float → Float
  heatFlux : Float
  thermalConductivityPositive : Prop

def FourierConductionClosed (F : FourierConductionPackage) : Prop :=
  F.heatFlux = -F.thermalConductivity 0 * F.temperatureGrad 0 ∧ F.thermalConductivityPositive

structure FourierConductionEvidence (F : FourierConductionPackage) where
  fluxClosed : F.heatFlux = -F.thermalConductivity 0 * F.temperatureGrad 0
  conductivityClosed : F.thermalConductivityPositive

theorem fourier_conduction_closed_from_evidence (F : FourierConductionPackage)
    (E : FourierConductionEvidence F) : FourierConductionClosed F := by
  exact And.intro E.fluxClosed E.conductivityClosed

end ChemicalEngineeringHeatTransferChemical
end HautevilleHouse
