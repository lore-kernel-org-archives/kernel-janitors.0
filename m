Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA35EB64DD
	for <kernel-janitors@archiver.kernel.org>; Tue, 18 Jul 2023 07:02:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbjGRHCb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 18 Jul 2023 03:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbjGRHCZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Jul 2023 03:02:25 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1E7A1A2
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jul 2023 00:02:24 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3128fcd58f3so5608111f8f.1
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jul 2023 00:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689663743; x=1692255743;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tUtxeuLt0e5A/vNPcKykxiuourGN5YeLLNebzm+n1sU=;
        b=TOs7k2d04sr+qWEDqUtONZhsoBUX/flJaH4UWkpVCxKRqBhMaKcTfnmKXH/4u0sYYS
         H/CREjvmulvazWdjr6ahFRsZaE65BT4qx39R7nVf1tpGkjxv+ikCVXuCz/ZV/0R66EdP
         SBmyC5Nr5SLyNqYfvnbngzFiK/PobHcisMxOgCSXBle0kJfoarTMkExOTMv0TuW1Hj1X
         PQMCyJag9msU83ANeKTfZQWp+YgaYCkuu6Xq/zCb8253z80h4xXt53o1Mc1cmXUQWVCO
         7hgBOaZZ3QwivDz2coA2eoa+YpC1aYnFogIj88f/RbkepHJ/02d3wyiw0y2HuDuF9w3L
         VeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689663743; x=1692255743;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tUtxeuLt0e5A/vNPcKykxiuourGN5YeLLNebzm+n1sU=;
        b=BKFqZU+PFF149lVXBZsfMOpjLxSL51zuNgaPe/2hK6Uf+J3wCfT9NCW1aPWa6WC2Qi
         hNoJBrT+5byZZmOm48z3zS45x6rlBEB7XFKoLSWVUjoKNnwr6C0Ymlca/C3ifVEIZPcn
         lDrQTayr3N7E/ivpnLI4dOB4Yq8KaaGQRsHzsFMjKqP+Ct17Y302D0Mn88Wz/qf1r0J6
         ojrDOp5m9CBKaGpUFE0FC1hDh1Fxl7VyyqxS46GINN69fZW+xxe3e7IEDIZTGWzDT9pX
         sjwJ3J4s+GSDduw35vvNWYAZw3lD3bJlvPqoB2Uo+zl9vgfB/Ki689sP6wGZLiPdjRlb
         K6yQ==
X-Gm-Message-State: ABy/qLbQciI/hhf1psx4+EyKF0wUW6Rk5DFz9bcEM+r5uT9jNLig8jLE
        yC4nY4/u6V45pokgoB81n0U57Q==
X-Google-Smtp-Source: APBJJlHsNFO6IgYs1oo9PUaJA0ZMqdBAII53HOqi4Mhilr81K3eJKjnldbggMFwbAFxy3k039OP8cQ==
X-Received: by 2002:adf:ce88:0:b0:313:f957:fc0c with SMTP id r8-20020adfce88000000b00313f957fc0cmr12215967wrn.47.1689663743342;
        Tue, 18 Jul 2023 00:02:23 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i3-20020adfe483000000b00313f61889ecsm1448445wrm.66.2023.07.18.00.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 00:02:22 -0700 (PDT)
Date:   Tue, 18 Jul 2023 10:02:18 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc:     Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] iio: frequency: admv1013: propagate errors from
 regulator_get_voltage()
Message-ID: <ce75aac3-2aba-4435-8419-02e59fdd862b@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The regulator_get_voltage() function returns negative error codes.
This function saves it to an unsigned int and then does some range
checking and, since the error code falls outside the correct range,
it returns -EINVAL.

Beyond the messiness, this is bad because the regulator_get_voltage()
function can return -EPROBE_DEFER and it's important to propagate that
back properly so it can be handled.

Fixes: da35a7b526d9 ("iio: frequency: admv1013: add support for ADMV1013")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/iio/frequency/admv1013.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/frequency/admv1013.c b/drivers/iio/frequency/admv1013.c
index 9bf8337806fc..8c8e0bbfc99f 100644
--- a/drivers/iio/frequency/admv1013.c
+++ b/drivers/iio/frequency/admv1013.c
@@ -344,9 +344,12 @@ static int admv1013_update_quad_filters(struct admv1013_state *st)
 
 static int admv1013_update_mixer_vgate(struct admv1013_state *st)
 {
-	unsigned int vcm, mixer_vgate;
+	unsigned int mixer_vgate;
+	int vcm;
 
 	vcm = regulator_get_voltage(st->reg);
+	if (vcm < 0)
+		return vcm;
 
 	if (vcm < 1800000)
 		mixer_vgate = (2389 * vcm / 1000000 + 8100) / 100;
-- 
2.39.2

