Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97FF9C636C9
	for <kernel-janitors@archiver.kernel.org>; Wed, 21 Jul 2021 10:42:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AAB46109F
	for <kernel-janitors@archiver.kernel.org>; Wed, 21 Jul 2021 10:42:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237276AbhGUJ72 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 21 Jul 2021 05:59:28 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:44274
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239311AbhGUJyQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 21 Jul 2021 05:54:16 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 970743F228;
        Wed, 21 Jul 2021 10:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1626863691;
        bh=kof4hQbIpCyinlLXysmNbWB1iLCSU1hw525MyejIWwc=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=NtLitiEPvsyIztn2Z7opEeT9N58YZTGBE8Oft2BnPF08p6u1C1HS5+fBF1PgqO3Gq
         Rl9fk5oWBJ8M37o7qYqIcFt2gjdCNOvD47tz1v9ynWpNsTkFfMxEaxpLrNfOSknPNN
         RB7v6o9zF1pOBGXG5C7DmAxWao4MHa0q3ok7hgC/cUkjXASNNsA9oUc6+T1IIb/VZP
         rtFPwTwf4KxX4YnHY1mo3axwKK2u0Z8GlS5OlTaNjTdjXToX31VOc3vQWaou5kYqeR
         GmO40VG0hvTsYKiQOLsHCJJjEaxevzEDOxUltFMxccAPovx9KeyXVdG1FeraumzfJc
         PKtIqm+G/QP8g==
From:   Colin King <colin.king@canonical.com>
To:     Evgeniy Polyakov <zbr@ioremap.net>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] w1: remove redundant initialization to variable result
Date:   Wed, 21 Jul 2021 11:34:51 +0100
Message-Id: <20210721103451.43026-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable result is being initialized with a value that is never
read, it is being updated later on. The assignment is redundant and
can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/w1/w1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
index f2ae2e563dc5..3c7817bd6744 100644
--- a/drivers/w1/w1.c
+++ b/drivers/w1/w1.c
@@ -501,7 +501,7 @@ static ssize_t w1_master_attribute_store_remove(struct device *dev,
 	struct w1_master *md = dev_to_w1_master(dev);
 	struct w1_reg_num rn;
 	struct w1_slave *sl;
-	ssize_t result = count;
+	ssize_t result;
 
 	if (w1_atoreg_num(dev, buf, count, &rn))
 		return -EINVAL;
-- 
2.31.1

