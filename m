Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F0CEB64D9
	for <kernel-janitors@archiver.kernel.org>; Thu, 15 Jun 2023 06:09:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237966AbjFOGJf (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 15 Jun 2023 02:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243275AbjFOGJc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 15 Jun 2023 02:09:32 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C01BA7
        for <kernel-janitors@vger.kernel.org>; Wed, 14 Jun 2023 23:09:31 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f76a223ca5so1851685e87.3
        for <kernel-janitors@vger.kernel.org>; Wed, 14 Jun 2023 23:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686809369; x=1689401369;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=26mSNpaphFv3eMUK08mrfdveKcRFHGUm7SxBgwM7wKQ=;
        b=Woo960oRlKIg2EO9OFoNW7FesqkkGf9xBhoIYZDNjt1dJxBNHuZnK+VLc/9VAKtIbB
         MIFaaMQOJpbzRMvEKHC8M53sfUbr9V0GugVDxrsUf61dadkbPdYrsY4ryYsgisavXLuq
         GVCLSVUM7A8owEn+P3cNKJj/Dp5sjsgSLfU2JQigNbfupI/XDJs7DPziKKeCBLhpnBc1
         CQ6v+/OkzDVhboP/zhMjbogBp4fx1V/gYUe6dH1X7A2ak718xx8C3vBT5lcK44FFh03C
         uB+wxQX+54xJXZHF6Gab1BN3VOHE9pRtlSwZutloZC9Yf15XqURADZgY/MMgfEyD57xV
         zrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686809369; x=1689401369;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=26mSNpaphFv3eMUK08mrfdveKcRFHGUm7SxBgwM7wKQ=;
        b=Op7oD2Y98AYlQ09aFnX+VY6CeyofJLZqsI9ay6Fd21c8vcN5n4htudiumYz6O3IRML
         EC/9AzjufXv8zcZnzzWxwcXhL/EIOeV+ute3jomyscCVQyRcyJ9lxGcsNbDR+OGe0/h6
         Kg0yN4oP0nDTcR3HovTq3Q89y22A7AsS6WI9VeDNB7sBwn0qfUCx01JuH4SBllTstGUN
         e47PL1PF2MXPwsNUsq1lV2WbMQvoYbKMA3+tVMlcSBob/DS9joWT5vp0OcpXElsuBM5P
         MV2EyBltAhPXujjDArpotGhKluc9vsoy73zJR704G4o8YvS66Dr7m4DnNF9zW/t1/13T
         kAJA==
X-Gm-Message-State: AC+VfDwTl/Utyigd12wsCmcDpMgh/jlj54oa5SLuIKho7/4K4/zkhaB+
        zNH/wvxMVCCtypjmG1G1O4AMww==
X-Google-Smtp-Source: ACHHUZ5Shvz56GbCkrxmqunekg700y5QlXwXfz9Y+4BHSqVNQbdVIZx5EZrklFNOx9V5YkOPwD3XDQ==
X-Received: by 2002:a05:6512:329c:b0:4f1:3ca4:926f with SMTP id p28-20020a056512329c00b004f13ca4926fmr9429156lfe.21.1686809369499;
        Wed, 14 Jun 2023 23:09:29 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u26-20020a05600c00da00b003eddc6aa5fasm19463608wmm.39.2023.06.14.23.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 23:09:27 -0700 (PDT)
Date:   Thu, 15 Jun 2023 09:09:20 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] mtd: otp: clean up on error in mtd_otp_nvmem_add()
Message-ID: <fe7ef901-9571-4c6e-a40e-449046efe2c6@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Smatch complains that these error paths are missing cleanup:

    drivers/mtd/mtdcore.c:983 mtd_otp_nvmem_add()
    warn: missing unwind goto?

This needs to call nvmem_unregister(mtd->otp_user_nvmem) before
returning.

Fixes: 3b270fac8443 ("mtd: otp: Put factory OTP/NVRAM into the entropy pool")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/mtd/mtdcore.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index abf4cb58a8ab..ab77f8f858f0 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -975,12 +975,14 @@ static int mtd_otp_nvmem_add(struct mtd_info *mtd)
 			void *otp;
 
 			otp = kmalloc(size, GFP_KERNEL);
-			if (!otp)
-				return -ENOMEM;
+			if (!otp) {
+				err = -ENOMEM;
+				goto err;
+			}
 			err = mtd_nvmem_fact_otp_reg_read(mtd, 0, otp, size);
 			if (err < 0) {
 				kfree(otp);
-				return err;
+				goto err;
 			}
 			add_device_randomness(otp, err);
 			kfree(otp);
-- 
2.39.2

