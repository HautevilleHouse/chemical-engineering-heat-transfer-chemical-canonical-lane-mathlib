import ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def heatTransferProjection : Projection HeatTransferEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem heat_transfer_projection_idempotent (x : HeatTransferEndgameState) :
    heatTransferProjection.toFun (heatTransferProjection.toFun x) = heatTransferProjection.toFun x := by
  exact heatTransferProjection.idempotent x

end ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean
end HautevilleHouse
