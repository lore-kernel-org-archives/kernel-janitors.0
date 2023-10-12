Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD305CDB46E
	for <kernel-janitors@archiver.kernel.org>; Thu, 12 Oct 2023 09:41:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235399AbjJLJlV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 12 Oct 2023 05:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbjJLJlT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 12 Oct 2023 05:41:19 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFFDC9D
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Oct 2023 02:41:17 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2bb9a063f26so9455991fa.2
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Oct 2023 02:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697103676; x=1697708476; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V9Ha1tPoh6dVTvqYgTNLLl69UYatye7Ch50vBppvcQw=;
        b=JbWIv1g0Tn+3K0Xbkoi7GjbG/lR5KSDYwXkMitrkcwMFLukuWJplaRYeEGYBuQyjWa
         D0umqMEgMDeAJuLCAv0NhARqQ8HO/hRHeiNFG6Y1VRPFtZlcueJMMOhQ/BIYmQrFsvMn
         cg6y8vD4++ukECKrEjCYwZaxiWGkBAPIzX42A9KNUO69rHi6oL3sRtFOxGa14WV+q2Ic
         erSlUBT9l9Q7T90fhBCQz4btXQR9A1EydNaM35tGQC3W/ac2ax3+eGD5vTHakDc9Ehlt
         cw2ij2XBrEd87WOZDlsANIlFtxnPGNAq1ok8ujMMPXYvtEYWKfVWgS3fSdaplnRev2au
         nOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697103676; x=1697708476;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V9Ha1tPoh6dVTvqYgTNLLl69UYatye7Ch50vBppvcQw=;
        b=hMVOV/HfqfvCMav8ji6a259sA8BRB6GsjLvWw31vuU69tjqesQZ2eF4oTApYESMZo5
         Oly6e3k5wtKCi/kgilDvoHScCy1dAHLtFHv75MlIFvpNcnkagD9tKuamKQEDAPLOPBrO
         knoBEWnAQn29tiSTq4Nkv7RnehIg4kYCwvVjubSwPyu8yDdL/AumHuRpv0/cOmSWPTC9
         Fe2c33O3E7OPEy+iZE4qkc3UGqcomUr8iNuUzL3AnZ4t/CQWuiRG+xnw6sXfxRihE2SR
         FkizQo4QkoCXxf39Held4Fz2uU8xa2/FSEPoxVv0MkZiHRA0yWsPy1N7V3LP0YJoC+Mb
         I/6w==
X-Gm-Message-State: AOJu0Yy89xr+Qjq0HwOyfpnQeiDpts5g8CSPXsO7lretjN7pW5uayuQt
        Hj+MJ7xPbbPxhO9H3Fw6OklYEg==
X-Google-Smtp-Source: AGHT+IEaL1Aj5cIMJu9KIjuRu/rF5MoFIOwR2MxjF+RWVDhV2KmCzFNegrVLqtcs2W2wfLtFgVf2RA==
X-Received: by 2002:a05:6512:3d15:b0:505:6ede:20a8 with SMTP id d21-20020a0565123d1500b005056ede20a8mr26060481lfv.42.1697103675962;
        Thu, 12 Oct 2023 02:41:15 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q5-20020a7bce85000000b0040596352951sm21495929wmj.5.2023.10.12.02.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 02:41:15 -0700 (PDT)
Date:   Thu, 12 Oct 2023 12:41:12 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Mark Tseng <chun-jen.tseng@mediatek.com>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] PM / devfreq: mediatek: unlock on error in
 mtk_ccifreq_target()
Message-ID: <1bada9b2-d276-4123-bfdf-03d165569543@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Call mutex_unlock(&drv->reg_lock) before returning the error code.

Fixes: d2805601988f ("PM / devfreq: mediatek: protect oop in critical session")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/devfreq/mtk-cci-devfreq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-cci-devfreq.c
index b0ed25e33f2b..11bc3d03494c 100644
--- a/drivers/devfreq/mtk-cci-devfreq.c
+++ b/drivers/devfreq/mtk-cci-devfreq.c
@@ -146,7 +146,8 @@ static int mtk_ccifreq_target(struct device *dev, unsigned long *freq,
 	opp = devfreq_recommended_opp(dev, &opp_rate, 1);
 	if (IS_ERR(opp)) {
 		dev_err(dev, "failed to find opp for freq: %ld\n", opp_rate);
-		return PTR_ERR(opp);
+		ret = PTR_ERR(opp);
+		goto out_unlock;
 	}
 
 	voltage = dev_pm_opp_get_voltage(opp);
-- 
2.39.2

