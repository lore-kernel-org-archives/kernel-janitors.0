Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C680BC64EC7
	for <kernel-janitors@archiver.kernel.org>; Sat, 25 Feb 2023 10:58:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbjBYK64 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 25 Feb 2023 05:58:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbjBYK6z (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 25 Feb 2023 05:58:55 -0500
Received: from smtp.smtpout.orange.fr (smtp-11.smtpout.orange.fr [80.12.242.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90CF712BE2
        for <kernel-janitors@vger.kernel.org>; Sat, 25 Feb 2023 02:58:53 -0800 (PST)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id VsGQpbpJVHeiPVsGRphwXq; Sat, 25 Feb 2023 11:58:51 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 25 Feb 2023 11:58:51 +0100
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Peter Huewe <peterhuewe@gmx.de>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Matthew Garrett <mjg59@srcf.ucam.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-integrity@vger.kernel.org
Subject: [PATCH] tpm_crb: Fix an error handling path in crb_acpi_add()
Date:   Sat, 25 Feb 2023 11:58:48 +0100
Message-Id: <a820eaf8c77ca4fde50fc170f535de4b28c82a2d.1677322706.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Some error paths don't call acpi_put_table() before returning.
Branch to the correct place instead of doing some direct return.

Fixes: 4d2732882703 ("tpm_crb: Add support for CRB devices based on Pluton")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/char/tpm/tpm_crb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/char/tpm/tpm_crb.c b/drivers/char/tpm/tpm_crb.c
index 99698ee1a744..f7068bd8b3d0 100644
--- a/drivers/char/tpm/tpm_crb.c
+++ b/drivers/char/tpm/tpm_crb.c
@@ -771,12 +771,13 @@ static int crb_acpi_add(struct acpi_device *device)
 				FW_BUG "TPM2 ACPI table has wrong size %u for start method type %d\n",
 				buf->header.length,
 				ACPI_TPM2_COMMAND_BUFFER_WITH_PLUTON);
-			return -EINVAL;
+			rc = -EINVAL;
+			goto out;
 		}
 		crb_pluton = ACPI_ADD_PTR(struct tpm2_crb_pluton, buf, sizeof(*buf));
 		rc = crb_map_pluton(dev, priv, buf, crb_pluton);
 		if (rc)
-			return rc;
+			goto out;
 	}
 
 	priv->sm = sm;
-- 
2.34.1

