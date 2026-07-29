import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean

structure ConvectivePackage where
  velocityField : Type u
  temperatureField : Type v
  thermalDiffusivity : Type w
  forcedConvection : Prop
  naturalConvection : Prop
  boundaryLayer : Prop

structure ConvectiveEvidence (C : ConvectivePackage) where
  forcedConvectionClosed : C.forcedConvection
  naturalConvectionClosed : C.naturalConvection
  boundaryLayerClosed : C.boundaryLayer

def ConvectiveClosed (C : ConvectivePackage) : Prop :=
  C.forcedConvection ∧ C.naturalConvection ∧ C.boundaryLayer

theorem convective_closed_from_evidence (C : ConvectivePackage) (E : ConvectiveEvidence C) : ConvectiveClosed C :=
  And.intro E.forcedConvectionClosed (And.intro E.naturalConvectionClosed E.boundaryLayerClosed)

end ChemicalEngineeringHeatTransferChemicalCanonicalLaneLean
end HautevilleHouse