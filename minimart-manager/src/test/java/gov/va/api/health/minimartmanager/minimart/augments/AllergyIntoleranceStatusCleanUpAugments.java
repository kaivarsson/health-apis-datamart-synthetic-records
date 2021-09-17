package gov.va.api.health.minimartmanager.minimart.augments;

import static com.google.common.base.Preconditions.checkState;

import gov.va.api.health.dataquery.service.controller.allergyintolerance.DatamartAllergyIntolerance;
import java.util.Objects;

public class AllergyIntoleranceStatusCleanUpAugments {
  public static void main(String[] args) {
    Augmentation.forResources(DatamartAllergyIntolerance.class)
        .whenMatching(Objects::nonNull)
        .transform(AllergyIntoleranceStatusCleanUpAugments::removeStatus)
        .build()
        .rewriteFiles();
  }

  static DatamartAllergyIntolerance removeStatus(
      Augmentation.Context<DatamartAllergyIntolerance> ctx) {
    checkState(
        ctx.resource().clinicalStatus() != null || ctx.resource().verificationStatus() != null);
    ctx.resource().status(null);
    return ctx.resource();
  }
}
