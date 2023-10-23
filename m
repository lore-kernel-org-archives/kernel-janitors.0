Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D6ECC25B46
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 Oct 2023 19:33:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbjJWTde (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 23 Oct 2023 15:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230386AbjJWTdd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Oct 2023 15:33:33 -0400
Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr [80.12.242.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71488C0
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Oct 2023 12:33:31 -0700 (PDT)
Received: from localhost.localdomain ([141.170.221.62])
        by smtp.orange.fr with ESMTPSA
        id v0fzqGEQclciav0g5qWHER; Mon, 23 Oct 2023 21:33:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1698089610;
        bh=kOczc4xzag/NnlA9XkZf9hv4EVckr0nepjgeN8+fjfE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=R+rP9eZtOV0Gu0NgUyXgpD5G0f7Mtnczfb9ANQB6jCAf4xSPtHm9RgbLkUnE2KTiG
         bMzIpIpSvRY8aVNbezdI543C0GvzU2WBn/AWvO8yTCymF+IEThHhmXyh6W2hnYgjih
         47nmsTCLNMt1SjjO/t++jo/H/DcBtu2tBh45kl+XeeoQpwnjyNt3woqlqbN//11jK6
         CtGtMniOzX2+jIp2J6vd40m9penXIjlljjSx21ozWTrFgNdliWCUSKO7hP1+Or8TDU
         LKjitwJAjSQjTlfkrtnqGvNXfrsVHmTIUD5mWrnIkAGnvWaMQn4dhqj183ecjJOEyL
         /8FbvSHUFvyOQ==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 23 Oct 2023 21:33:30 +0200
X-ME-IP: 141.170.221.62
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     rafael@kernel.org, lenb@kernel.org
Cc:     linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 4/4] ACPI: sysfs: Remove some dead code
Date:   Mon, 23 Oct 2023 21:33:18 +0200
Message-Id: <eb978f8d3141857438a134885e9c38a75bf2245c.1698081019.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1698081019.git.christophe.jaillet@wanadoo.fr>
References: <cover.1698081019.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

snprintf() never returns <0 values.
So remove some dead code.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/acpi/device_sysfs.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/acpi/device_sysfs.c b/drivers/acpi/device_sysfs.c
index 1cf6568a813f..23373faa35ec 100644
--- a/drivers/acpi/device_sysfs.c
+++ b/drivers/acpi/device_sysfs.c
@@ -168,8 +168,6 @@ static int create_pnp_modalias(const struct acpi_device *acpi_dev, char *modalia
 			continue;
 
 		count = snprintf(&modalias[len], size, "%s:", id->id);
-		if (count < 0)
-			return -EINVAL;
 
 		if (count >= size)
 			return -ENOMEM;
@@ -228,8 +226,6 @@ static int create_of_modalias(const struct acpi_device *acpi_dev, char *modalias
 	for (i = 0; i < nval; i++, obj++) {
 		count = snprintf(&modalias[len], size, "C%s",
 				 obj->string.pointer);
-		if (count < 0)
-			return -EINVAL;
 
 		if (count >= size)
 			return -ENOMEM;
-- 
2.32.0

