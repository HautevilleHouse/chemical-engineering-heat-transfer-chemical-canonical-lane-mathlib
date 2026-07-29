import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringHeatTransferChemical

structure HeatExchangerDesignPackage where
  area : Float
  overallCoeff : Float
  lmtd : Float
  duty : Float
  designValid : Prop

def HeatExchangerDesignClosed (H : HeatExchangerDesignPackage) : Prop :=
  H.designValid ∧ H.area > 0 ∧ H.overallCoeff > 0

structure HeatExchangerDesignEvidence (H : HeatExchangerDesignPackage) where
  designValidClosed : H.designValid
  areaPositive : H.area > 0
  coeffPositive : H.overallCoeff > 0

theorem heat_exchanger_design_closed_from_evidence (H : HeatExchangerDesignPackage)
    (E : HeatExchangerDesignEvidence H) : HeatExchangerDesignClosed H := by
  exact And.intro E.designValidClosed (And.intro E.areaPositive E.coeffPositive)

end ChemicalEngineeringHeatTransferChemical
end HautevilleHouse
