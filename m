Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AFD9C7EE24
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Jun 2023 08:21:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235908AbjFFIVd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 6 Jun 2023 04:21:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236201AbjFFIVa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Jun 2023 04:21:30 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CB78EA
        for <kernel-janitors@vger.kernel.org>; Tue,  6 Jun 2023 01:21:28 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3063433fa66so5087630f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 06 Jun 2023 01:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686039687; x=1688631687;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dkb7K4StnKyUjyVkKmBhJSVtp9R5+nxnmnxLzZaoi6w=;
        b=rhUgvkH5GQYV1LSKhWNnnqP5gDkgzCN0Uk7ZZu1BcKEJ0r8VW/+CMtHkEnScUr5r0w
         PHxBHuJZvNz4ebw+kqDIajqx820jmkb1x+sycocmoGs2S/qNdmThLgHver2tFCwsqkHi
         5ZgCb4s6IjYhM7YBM+nv8AkyZ5C0CdDNuozNkgqzVl98vx472j28SDngUtDiOB4gUTC9
         Fam2iP0hvtVHweUYpAbf2SvJr8bp29Pmp1eCSCNtzHTd0yNyt89T52Z9xuvZl59WOQ3o
         16kPqyFLDX9iDIlKTZEny/V9tTM2OQzbwblpAVzwijWltjW1O+uKZSEiQ/rcCPwKFE7t
         xSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686039687; x=1688631687;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dkb7K4StnKyUjyVkKmBhJSVtp9R5+nxnmnxLzZaoi6w=;
        b=L8cNWJYbNt/NkZGrP7RqRr9XYEDCRTKKY2HyiV6NA5tCAZn07sJJquHCiJna25vw/1
         i76inU+4k9of6KDgnURCSJhDwN99sc8Z8335qQudobfIubRyrB/wU0v1Xhc5ggljFETA
         IGuwlkL749s+Jfvt3NYJGSVUDElAn0GJS6UFC73J3rjV9ctBMoWk1U6tH0wIp5ennCz4
         1A6tc2zsdqja4prLUo5+1JDjlc0dk1GM3DvMfLVq6+ZFTjlJzMHeAg8ujJM5v/miqOUl
         td7FUin6MEu1vEFcasoRdJ9lu5lv0TKytDc36ytKq4xpLNPT/znaKj0xd26S8IOqJZzU
         ncpg==
X-Gm-Message-State: AC+VfDxCUY4IvJhfhjKqDbUFUg2+Ox4bc+Hu1WWX/nbU0q7WrncXT18o
        udPumb+gDrbE5IMA0GD0H0RMBg==
X-Google-Smtp-Source: ACHHUZ582VJN7tt1i9t/RVdnErvIR9E3CpAbm1nOMk9BRM+6GkV31FFnhRwclGusnapEapIej4vIYA==
X-Received: by 2002:adf:e5cf:0:b0:309:33c4:52e1 with SMTP id a15-20020adfe5cf000000b0030933c452e1mr1120986wrn.64.1686039687095;
        Tue, 06 Jun 2023 01:21:27 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n2-20020a5d4c42000000b00306415ac69asm11781849wrt.15.2023.06.06.01.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 01:21:25 -0700 (PDT)
Date:   Tue, 6 Jun 2023 11:21:22 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] soc: qcom: Fix a IS_ERR() vs NULL bug in probe
Message-ID: <ZH7sgpLAN23bCz9v@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The devm_ioremap() function returns NULL on error, it never returns
error pointers.

Fixes: a77b2a0b1280 ("soc: qcom: Introduce RPM master stats driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/soc/qcom/rpm_master_stats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/rpm_master_stats.c b/drivers/soc/qcom/rpm_master_stats.c
index 6dd98b9f7129..9ca13bcf67d3 100644
--- a/drivers/soc/qcom/rpm_master_stats.c
+++ b/drivers/soc/qcom/rpm_master_stats.c
@@ -105,7 +105,7 @@ static int master_stats_probe(struct platform_device *pdev)
 		}
 
 		data[i].base = devm_ioremap(dev, res.start, resource_size(&res));
-		if (IS_ERR(data[i].base)) {
+		if (!data[i].base) {
 			debugfs_remove_recursive(root);
 			return dev_err_probe(dev, -EINVAL,
 					     "Could not map the MSG RAM slice idx %d!\n", i);
-- 
2.30.2

