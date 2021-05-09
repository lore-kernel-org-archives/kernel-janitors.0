Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEDD4C433B4
	for <kernel-janitors@archiver.kernel.org>; Sun,  9 May 2021 00:42:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8857661400
	for <kernel-janitors@archiver.kernel.org>; Sun,  9 May 2021 00:42:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbhEIAnd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 8 May 2021 20:43:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbhEIAnd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 8 May 2021 20:43:33 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90127C061573
        for <kernel-janitors@vger.kernel.org>; Sat,  8 May 2021 17:42:30 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id c11so9381845qth.2
        for <kernel-janitors@vger.kernel.org>; Sat, 08 May 2021 17:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C07YwASl0zpqDQVX+5JFG3kpJXKlR71QBAMY+k9JQdM=;
        b=PVKKvcu95u+XCSkInv8gyZUxsnu7lPFEE1dqPXXMd+4EJmzME0jajgY7D/4hu1TzlV
         jaPSNoEzRY0VHgaqz0Zcp2CUDldGikO87t6qhm1/eRTIQZNm8VsqAgQKq7QR9X7bfKCl
         QgkWnAnP5ZpyiuIy89uedu0XZW2do4KERn6uR9/s1NgiesQs7fxWNl7r5a4x7lkz+/wW
         4GJJzwS06Y9HXjRdQTXwX/mJs6XZYqITaGLbwtRZojFSL+O5DxUFRHbVbx6qixoRiq0y
         rM87YOvcxMhSIPF2l1OmZgKhWy9VJR2qUITTwRjbSmhNxgEI4jW1L2CYmudAYbbeUpwO
         9tZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C07YwASl0zpqDQVX+5JFG3kpJXKlR71QBAMY+k9JQdM=;
        b=DglzxbvRMSWaa/ouRWgKxsA0EtBXl1HbZQWUxmF+nRqx16feHBiecUuUlptDvUnF/d
         wcGcsNyrghwvPX3jJ4qtXzYhYTzXmj/a1tFXj6WyMtkpycVfb5m0gcGe2Bipi2iqCc+s
         M/+Jc/OfW/nXWUE2DaMaMYSCqUpohicGEtFsL72jc5lBz4sOGoax+TtBMUV8ACi0vapk
         iAiu9iS6D9yuZcXDCXjGZz7LJEQ6qfl3BFt8HwIw7SygRpCjrerUn5CHe4wmcpr+ZhMt
         NiCBEF03mpcWKJf77qg86mifTFzvnZHdJSwmOiL056lLDuz3x7K4UDq/shhBqYJxcK/I
         gvQQ==
X-Gm-Message-State: AOAM533RFfH6A4GMsJwChN+PiU27+FEGUTPmHBn4fzB5iUD8TSULSUNK
        KsXKnxwKq5KmphIVZ8GDbVo=
X-Google-Smtp-Source: ABdhPJzt50rF+xK22UPqdTAr2UU+kox9t2h6kivkm8j1fJJfuJNrsWgqNY1l7X+a9wn7z1GXj6I6UA==
X-Received: by 2002:ac8:5e0b:: with SMTP id h11mr16107664qtx.194.1620520949895;
        Sat, 08 May 2021 17:42:29 -0700 (PDT)
Received: from linuxerio.localdomain ([186.32.194.42])
        by smtp.gmail.com with ESMTPSA id r81sm8440750qka.82.2021.05.08.17.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 17:42:29 -0700 (PDT)
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
To:     christophe.jaillet@wanadoo.fr, dan.carpenter@oracle.com
Cc:     kernel-janitors@vger.kernel.org,
        Edmundo Carmona Antoranz <eantoranz@gmail.com>
Subject: [RFC 1/2] rtc: max77686: use symbolic error messages
Date:   Sat,  8 May 2021 18:41:11 -0600
Message-Id: <20210509004112.421100-1-eantoranz@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Modify some error messages so that the symbolic error value be
printed instead of a numeric value.
---
 drivers/rtc/rtc-max77686.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index ce089ed934ad..470260478752 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -711,7 +711,8 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 						info->drv_data->regmap_config);
 	if (IS_ERR(info->rtc_regmap)) {
 		ret = PTR_ERR(info->rtc_regmap);
-		dev_err(info->dev, "Failed to allocate RTC regmap: %d\n", ret);
+		dev_err(info->dev, "Failed to allocate RTC regmap: %pe\n",
+			info->rtc_regmap);
 		return ret;
 	}
 
@@ -763,7 +764,8 @@ static int max77686_rtc_probe(struct platform_device *pdev)
 
 	if (IS_ERR(info->rtc_dev)) {
 		ret = PTR_ERR(info->rtc_dev);
-		dev_err(&pdev->dev, "Failed to register RTC device: %d\n", ret);
+		dev_err(&pdev->dev, "Failed to register RTC device: %pe\n",
+			info->rtc_dev);
 		goto err_rtc;
 	}
 
-- 
2.30.2

