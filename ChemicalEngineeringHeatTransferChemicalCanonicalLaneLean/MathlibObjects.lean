import ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure HeatTransferSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure HeatTransferAdmittedObject where
  space : HeatTransferSpace
  heatEquationClosed : Prop
  boundaryConditionSatisfied : Prop
  solutionRegularity : Prop
  uniqueness : Prop
  conclusion : solutionRegularity

structure HeatTransferEndgameState where
  object : HeatTransferAdmittedObject

def HeatTransferWitnessClosed (O : HeatTransferAdmittedObject) : Prop :=
  O.solutionRegularity

end ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean
end HautevilleHouse
