import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringHeatTransferChemical

structure ReactorHeatBalancePackage where
  heatGeneration : Float
  heatRemoved : Float
  feedTemp : Float
  outletTemp : Float
  heatCapacity : Float
  massFlow : Float
  balanceValid : Prop

def ReactorHeatBalanceClosed (R : ReactorHeatBalancePackage) : Prop :=
  R.balanceValid ∧ R.heatRemoved = R.massFlow * R.heatCapacity * (R.outletTemp - R.feedTemp) + R.heatGeneration

structure ReactorHeatBalanceEvidence (R : ReactorHeatBalancePackage) where
  balanceClosed : R.balanceValid
  equationClosed : R.heatRemoved = R.massFlow * R.heatCapacity * (R.outletTemp - R.feedTemp) + R.heatGeneration

theorem reactor_heat_balance_closed_from_evidence (R : ReactorHeatBalancePackage)
    (E : ReactorHeatBalanceEvidence R) : ReactorHeatBalanceClosed R := by
  exact And.intro E.balanceClosed E.equationClosed

end ChemicalEngineeringHeatTransferChemical
end HautevilleHouse
