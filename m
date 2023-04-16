Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B715CC77B61
	for <kernel-janitors@archiver.kernel.org>; Sun, 16 Apr 2023 22:29:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbjDPW3n (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 16 Apr 2023 18:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjDPW3m (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 16 Apr 2023 18:29:42 -0400
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB6726A8
        for <kernel-janitors@vger.kernel.org>; Sun, 16 Apr 2023 15:29:40 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id oAsKpjB2PjYHDoAsLpkxww; Mon, 17 Apr 2023 00:29:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
        s=t20230301; t=1681684179;
        bh=8Wl/JXKwfD+OAzKNoPx7F3mXgRxtmTroNRADhZKqXe4=;
        h=From:To:Cc:Subject:Date;
        b=GibIBA27D/+YTPuxLJnn/hNkdxnNIF3BJmRdISCt+noAh0UTCAzfO3t8WfvwIb3yp
         ntquYxOsazbUzvEfjpey6c4LAou25FFuyH9s0+QKj0DMnxgy7kQJcK26g4G7+bpViR
         +YAYSVjAxfkQybX5AjeHsdW8nRJnoT/++aaOfVrClAZZpyTm5Cb/f04zm//+UPcGsI
         9tkKE4INTIHJWPGnFXf50Td+PVkYy+LKUNYp2nMnEZMf6VHfy0BgV0WgzTvrnyepMI
         /4E81MajRpVZp2CL4u3ktfjX6YnZDNlxbvxeR1iSzz03yq/laK4N6/d3a8rjy66Qtp
         gHgOv7rq3RHzA==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 17 Apr 2023 00:29:39 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] soc: qcom: ramp_controller: Fix an error handling path in qcom_ramp_controller_probe()
Date:   Mon, 17 Apr 2023 00:29:35 +0200
Message-Id: <84727a79d0261b4112411aec23b553504015c02c.1681684138.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'qrc' is known to be non-NULL at this point.
Checking for 'qrc->desc' was expected instead, so use it.

Fixes: a723c95fa137 ("soc: qcom: Add Qualcomm Ramp Controller driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/soc/qcom/ramp_controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/ramp_controller.c b/drivers/soc/qcom/ramp_controller.c
index dc74d2a19de2..5e3ba0be0903 100644
--- a/drivers/soc/qcom/ramp_controller.c
+++ b/drivers/soc/qcom/ramp_controller.c
@@ -296,7 +296,7 @@ static int qcom_ramp_controller_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	qrc->desc = device_get_match_data(&pdev->dev);
-	if (!qrc)
+	if (!qrc->desc)
 		return -EINVAL;
 
 	qrc->regmap = devm_regmap_init_mmio(&pdev->dev, base, &qrc_regmap_config);
-- 
2.34.1

