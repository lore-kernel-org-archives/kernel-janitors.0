Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC13C77B75
	for <kernel-janitors@archiver.kernel.org>; Wed, 19 Apr 2023 14:24:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232613AbjDSOYy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 19 Apr 2023 10:24:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232727AbjDSOYn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 Apr 2023 10:24:43 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F1BC83E2
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Apr 2023 07:24:08 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-2f4c431f69cso2067619f8f.0
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Apr 2023 07:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681914239; x=1684506239;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k375mImuFX7RvFPMD+W8Uv0GumlkBkCMlh4NRkIhfPo=;
        b=DhmzPMlsp3UGY7lGuPlcLaKkdspjY3pqaGycQ91WQuLnd9Zh3QyQrPh1HE0qRVoWID
         J9mKGxoCpEQeO/HEHsEAU1KgUcpA8qtqOW+5QzDiALWN0JI371bWxhQU3DI688oveOMi
         g7EuWiLzsTTzjqCz3a7GFVSrPElx4Vc/YVpAhHqv6r8k7gFkhzd4NMzhOJk+SYAAb243
         piNFgkxAYviXg3EOPHz7yuzbq5QFIH+ARXNEgqGelW/Z7LoZlVtIDnTze3uROLELqmtF
         NuYEdPNQAMi1wdrqEUBTFRUs7RJS/HVgj/HRe7l742p67coHYbnn/5yvWJY5c+sKxcgY
         tt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681914239; x=1684506239;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k375mImuFX7RvFPMD+W8Uv0GumlkBkCMlh4NRkIhfPo=;
        b=jow5pursi7tuDh7vtUEwLg82CLqykkgvKRUhTepiOyb0hK/DIo5EeajLO6/GsxFDzX
         6gWjntTLDIdgudvr+5V/HDp+sqQAPxVhIjRYxLmLLOH5JHAY4EdLltFyc9sTt5AIqS97
         l/ObQ6N2lHwIQ4coCVThkBWgDEN6q+YjpOINLOY7Lg0Tng3A4pP5L6WqjFzd8i23ON1m
         08H0yyWvubKjH2eSQXVbk2ja9u9nuNpoX6h4bCTNXmSfoiQzQmVadKeVX7+X0awSGZs9
         oYZWZMFuMOsEnWgQVpobo8BQNM8/TGIfPl2NniikrcnXRoNtCgDFHrUTP+IVimCNfeJp
         84Dw==
X-Gm-Message-State: AAQBX9fq6wdDeBOD6BKQqOdU0CBkRqFeRMjZAoipECxMrWJwnOw+nQT8
        9Y/iVREraEmeQLFoo/+D7XgpZvflRUTojb/v1hp4t/Ng
X-Google-Smtp-Source: AKy350ZMasfAd3+9m6Eg8aPN0o0uc3rX9l2h6oIk4fFVRJGRU1cw/FsFe2xAlFYTC9Z3gBxoCsSFYQ==
X-Received: by 2002:a05:6000:18c6:b0:2fe:d6a1:f377 with SMTP id w6-20020a05600018c600b002fed6a1f377mr2181013wrq.33.1681914239396;
        Wed, 19 Apr 2023 07:23:59 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z14-20020adff1ce000000b002f28de9f73bsm15890106wro.55.2023.04.19.07.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 07:23:58 -0700 (PDT)
Date:   Wed, 19 Apr 2023 17:23:55 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     William Breathitt Gray <william.gray@linaro.org>,
        Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] counter: rz-mtu3-cnt: Unlock on error in
 rz_mtu3_count_write()
Message-ID: <93ec19d1-3b74-4644-9f67-b88c08e79752@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The return -ERANGE error paths need to call mutex_unlock(&priv->lock);
before returning.

Fixes: 25d21447d896 ("counter: Add Renesas RZ/G2L MTU3a counter driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/counter/rz-mtu3-cnt.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/counter/rz-mtu3-cnt.c b/drivers/counter/rz-mtu3-cnt.c
index a371bab68499..aeadce5e2853 100644
--- a/drivers/counter/rz-mtu3-cnt.c
+++ b/drivers/counter/rz-mtu3-cnt.c
@@ -358,19 +358,23 @@ static int rz_mtu3_count_ceiling_write(struct counter_device *counter,
 	switch (count->id) {
 	case RZ_MTU3_16_BIT_MTU1_CH:
 	case RZ_MTU3_16_BIT_MTU2_CH:
-		if (ceiling > U16_MAX)
-			return -ERANGE;
+		if (ceiling > U16_MAX) {
+			ret = -ERANGE;
+			goto unlock;
+		}
 		priv->mtu_16bit_max[ch_id] = ceiling;
 		break;
 	case RZ_MTU3_32_BIT_CH:
-		if (ceiling > U32_MAX)
-			return -ERANGE;
+		if (ceiling > U32_MAX) {
+			ret = -ERANGE;
+			goto unlock;
+		}
 		priv->mtu_32bit_max = ceiling;
 		break;
 	default:
 		/* should never reach this path */
-		mutex_unlock(&priv->lock);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto unlock;
 	}
 
 	pm_runtime_get_sync(ch->dev);
@@ -381,9 +385,9 @@ static int rz_mtu3_count_ceiling_write(struct counter_device *counter,
 
 	rz_mtu3_8bit_ch_write(ch, RZ_MTU3_TCR, RZ_MTU3_TCR_CCLR_TGRA);
 	pm_runtime_put(ch->dev);
+unlock:
 	mutex_unlock(&priv->lock);
-
-	return 0;
+	return ret;
 }
 
 static void rz_mtu3_32bit_cnt_setting(struct counter_device *counter)
-- 
2.39.2

