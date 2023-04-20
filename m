Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A42BC77B7E
	for <kernel-janitors@archiver.kernel.org>; Thu, 20 Apr 2023 20:28:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232023AbjDTU2B (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 20 Apr 2023 16:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232383AbjDTU1p (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 Apr 2023 16:27:45 -0400
Received: from smtp.smtpout.orange.fr (smtp-14.smtpout.orange.fr [80.12.242.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFE6330FA
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Apr 2023 13:27:31 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id pasJp7IVs9ZjUpasKpiGJf; Thu, 20 Apr 2023 22:27:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1682022449;
        bh=NZgNRLRGgwI0RD4dEiOi7Nq+A1YJQOKy4LiUQwQNZ04=;
        h=From:To:Cc:Subject:Date;
        b=phEO4bKNTjMTviP2M/Dnkp5BsIUVZJvI10h7l5Xo8d8S/ebsHDy8CbubLApUT6T7w
         cp9Gy02sbzQtWHubZULa55OqtJzASBN2tpiKE3tDrshyN4TyqteOy6NFhz9tcYinEh
         xFRFpm29/N2t/JWzILkoQhDpDgDK4e1K9jA7rPCnjdjvwwvetmfk3ttmOOqhOJ4kA4
         oOf1ADkRQ50JCk0YHIiBa0nrGqkPjjihtiRYs2xxvvCMIfg3o8FkCJ1Z2TOtIJeVQW
         Z4AXGPeDlYdjwREaQNCOoQn4oF3eB7svDAZ70/6S1tlH5tBX0PsAnRotPsUBJ9EScS
         o1zf+nqiAKqOQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 20 Apr 2023 22:27:29 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] perf/arm-cci: Slightly optimize cci_pmu_sync_counters()
Date:   Thu, 20 Apr 2023 22:27:24 +0200
Message-Id: <88d4e20d595f771396e9d558c1587eb4494057db.1682022422.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

When the 'mask' bitmap is cleared, it is better to use its full maximum
size instead of only the needed size.
This lets the compiler optimize it because the size is now known at compile
time. HW_CNTRS_MAX is small (i.e. currently 9), so a call to memset() is
saved.

Also, as 'mask' is local to the function, the non-atomic __set_bit() can
also safely be used here.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/perf/arm-cci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm-cci.c b/drivers/perf/arm-cci.c
index 03b1309875ae..998259f1d973 100644
--- a/drivers/perf/arm-cci.c
+++ b/drivers/perf/arm-cci.c
@@ -645,7 +645,7 @@ static void cci_pmu_sync_counters(struct cci_pmu *cci_pmu)
 	struct cci_pmu_hw_events *cci_hw = &cci_pmu->hw_events;
 	DECLARE_BITMAP(mask, HW_CNTRS_MAX);
 
-	bitmap_zero(mask, cci_pmu->num_cntrs);
+	bitmap_zero(mask, HW_CNTRS_MAX);
 	for_each_set_bit(i, cci_pmu->hw_events.used_mask, cci_pmu->num_cntrs) {
 		struct perf_event *event = cci_hw->events[i];
 
@@ -656,7 +656,7 @@ static void cci_pmu_sync_counters(struct cci_pmu *cci_pmu)
 		if (event->hw.state & PERF_HES_STOPPED)
 			continue;
 		if (event->hw.state & PERF_HES_ARCH) {
-			set_bit(i, mask);
+			__set_bit(i, mask);
 			event->hw.state &= ~PERF_HES_ARCH;
 		}
 	}
-- 
2.34.1

