Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19BD9C2B9F7
	for <kernel-janitors@archiver.kernel.org>; Wed, 26 May 2021 08:50:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF1FC613BC
	for <kernel-janitors@archiver.kernel.org>; Wed, 26 May 2021 08:50:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233011AbhEZIw1 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 26 May 2021 04:52:27 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50918 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232617AbhEZIw0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 26 May 2021 04:52:26 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1llpFZ-0001IQ-Ir; Wed, 26 May 2021 08:50:49 +0000
From:   Colin King <colin.king@canonical.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Trent Piepho <tpiepho@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] lib/math/rational: Fix spelling mistake "demominator" -> "denominator"
Date:   Wed, 26 May 2021 09:50:49 +0100
Message-Id: <20210526085049.6393-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a literal string. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 lib/math/rational-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/math/rational-test.c b/lib/math/rational-test.c
index df6ab5f43e8c..01611ddff420 100644
--- a/lib/math/rational-test.c
+++ b/lib/math/rational-test.c
@@ -20,7 +20,7 @@ static const struct rational_test_param test_parameters[] = {
 	{ 27,32,	16, 16,		11, 13,    "Use convergent" },
 	{ 1155, 7735,	255, 255,	33, 221,   "Exact answer" },
 	{ 87, 32,	70, 32,		68, 25,    "Semiconvergent, numerator limit" },
-	{ 14533, 4626,	15000, 2400,	7433, 2366, "Semiconvergent, demominator limit" },
+	{ 14533, 4626,	15000, 2400,	7433, 2366, "Semiconvergent, denominator limit" },
 };
 
 static void get_desc(const struct rational_test_param *param, char *desc)
-- 
2.31.1

