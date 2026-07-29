import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringHeatTransferChemical

structure HeatExchangerNetworkPackage where
  processStreams : Type
  utilityStreams : Type
  networkConfiguration : Type
  streamMatchingAssignment : Prop
  energyTargetMet : Prop
  minHotUtilityRequirement : Prop
  minColdUtilityRequirement : Prop
  streamTemperatureFeasibility : Prop

structure HeatExchangerNetworkEvidence (N : HeatExchangerNetworkPackage) where
  streamMatchingAssignmentClosed : N.streamMatchingAssignment
  energyTargetMetClosed : N.energyTargetMet
  minHotUtilityRequirementClosed : N.minHotUtilityRequirement
  minColdUtilityRequirementClosed : N.minColdUtilityRequirement
  streamTemperatureFeasibilityClosed : N.streamTemperatureFeasibility

def HeatExchangerNetworkClosed (N : HeatExchangerNetworkPackage) : Prop :=
  N.streamMatchingAssignment ∧ N.energyTargetMet ∧
  N.minHotUtilityRequirement ∧ N.minColdUtilityRequirement ∧
  N.streamTemperatureFeasibility

theorem heat_exchanger_network_closed_from_evidence
    (N : HeatExchangerNetworkPackage) (E : HeatExchangerNetworkEvidence N) :
    HeatExchangerNetworkClosed N := by
  exact And.intro E.streamMatchingAssignmentClosed
    (And.intro E.energyTargetMetClosed
      (And.intro E.minHotUtilityRequirementClosed
        (And.intro E.minColdUtilityRequirementClosed
          E.streamTemperatureFeasibilityClosed)))

end ChemicalEngineeringHeatTransferChemical
end HautevilleHouse