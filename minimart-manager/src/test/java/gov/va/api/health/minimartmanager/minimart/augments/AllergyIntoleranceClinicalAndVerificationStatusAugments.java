package gov.va.api.health.minimartmanager.minimart.augments;

import gov.va.api.health.dataquery.service.controller.allergyintolerance.DatamartAllergyIntolerance;
import java.util.Objects;

public class AllergyIntoleranceClinicalAndVerificationStatusAugments {
  static String clinicalStatusCode(DatamartAllergyIntolerance.Status status) {
    // active | inactive | resolved
    if (status == null) {
      return null;
    }
    switch (status) {
      case active:
        return "active";
      case inactive:
        return "inactive";
      case resolved:
        return "resolved";
      case confirmed:
        return "active";
      default:
        return null;
    }
  }

  public static void main(String[] args) {
    Augmentation.forResources(DatamartAllergyIntolerance.class)
        .whenMatching(Objects::nonNull)
        .transform(AllergyIntoleranceClinicalAndVerificationStatusAugments::populateStatuses)
        .build()
        .rewriteFiles();
  }

  static DatamartAllergyIntolerance populateStatuses(
      Augmentation.Context<DatamartAllergyIntolerance> ctx) {
    // Map status to clinicalStatus and verificationStatus
    // Same logic as DQ R4AllergyIntoleranceTransformer
    ctx.resource().clinicalStatus(clinicalStatusCode(ctx.resource().status()));
    ctx.resource().verificationStatus(verificationStatusCode(ctx.resource().status()));
    return ctx.resource();
  }

  static String verificationStatusCode(DatamartAllergyIntolerance.Status status) {
    if (status == null) {
      return null;
    }
    // unconfirmed | confirmed | refuted | entered-in-error
    switch (status) {
      case unconfirmed:
        return "unconfirmed";
      case confirmed:
        return null;
      case refuted:
        return "refuted";
      case entered_in_error:
        return "entered-in-error";
      default:
        return null;
    }
  }
}
