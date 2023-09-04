Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC063C83F2C
	for <kernel-janitors@archiver.kernel.org>; Mon,  4 Sep 2023 19:18:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239623AbjIDTSw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 4 Sep 2023 15:18:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbjIDTSw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 4 Sep 2023 15:18:52 -0400
Received: from smtp.smtpout.orange.fr (smtp-14.smtpout.orange.fr [80.12.242.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADB0418C
        for <kernel-janitors@vger.kernel.org>; Mon,  4 Sep 2023 12:18:47 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id dF5pqisSfrpphdF5qqmw28; Mon, 04 Sep 2023 21:18:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1693855120;
        bh=IJ6e+7Zx4V39vofq+85y5jlLYHgKa63pDRxIQQkBNeo=;
        h=From:To:Cc:Subject:Date;
        b=stflw7wrngPm23k1j/k3IOrf8dC+0fTLtV3ZRPCb6gYi7+b6tsAqanlXa2oBI8D5o
         3vPfKvWPNFl39fEdz1kGs+Yo+gdePwLBH5KGlY07d9rnkYEib7+TYap7+0o8bUi0H1
         qh0AdSjs5+Ylrl4GcvV5d0qmMfTWcezVwQk3u3XYpzxkNlUW4HErscX29tjMgOBxuz
         xOasZJpVeRrDIhkbtwRv+SUIagIJKtea6lobGm9Z+B464GNdWWHL8gFkBkY95q+bG/
         QJYniGX457kSH7/VZynexZLs3dhPX/ojuUM5Ws8eUxgsaaeqDKYZvoB7yCsCsKC5Z4
         OPmT2doe+12fA==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 04 Sep 2023 21:18:40 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Oded Gabbay <ogabbay@kernel.org>,
        Dani Liberman <dliberman@habana.ai>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/habanalabs/gaudi2: Fix incorrect string length computation in gaudi2_psoc_razwi_get_engines()
Date:   Mon,  4 Sep 2023 21:18:36 +0200
Message-Id: <d38582083ece76155dabdfd9a29d5a9dd0d6bce7.1693855091.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

snprintf() returns the "number of characters which *would* be generated for
the given input", not the size *really* generated.

In order to avoid too large values for 'str_size' (and potential negative
values for "PSOC_RAZWI_ENG_STR_SIZE - str_size") use scnprintf()
instead of snprintf().

Fixes: c0e6df916050 ("accel/habanalabs: fix address decode RAZWI handling")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index d94acec63d95..9617c062b7ca 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -8277,11 +8277,11 @@ static int gaudi2_psoc_razwi_get_engines(struct gaudi2_razwi_info *razwi_info, u
 		eng_id[num_of_eng] = razwi_info[i].eng_id;
 		base[num_of_eng] = razwi_info[i].rtr_ctrl;
 		if (!num_of_eng)
-			str_size += snprintf(eng_name + str_size,
+			str_size += scnprintf(eng_name + str_size,
 						PSOC_RAZWI_ENG_STR_SIZE - str_size, "%s",
 						razwi_info[i].eng_name);
 		else
-			str_size += snprintf(eng_name + str_size,
+			str_size += scnprintf(eng_name + str_size,
 						PSOC_RAZWI_ENG_STR_SIZE - str_size, " or %s",
 						razwi_info[i].eng_name);
 		num_of_eng++;
-- 
2.34.1

