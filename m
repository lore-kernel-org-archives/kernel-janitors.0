Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B78EC25B47
	for <kernel-janitors@archiver.kernel.org>; Wed, 25 Oct 2023 07:20:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232720AbjJYHU4 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 25 Oct 2023 03:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232584AbjJYHUy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Oct 2023 03:20:54 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25E8C90
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 00:20:52 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40907b82ab9so2735355e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 00:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698218450; x=1698823250; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NoS842zLgIKkSI8+QUqHv3sPQiEji6N4hBzkvgiFN50=;
        b=Zeb2dGp+KJVRUsNBZLnaD+cNpclZ85/aSmQM0DuC2trmexYKEWGFT601Uzo642C4Bc
         ki2zu+W/FiPOVT/ePGKtBH68cY+2+cX29BDRdXvxtgZCz2MLQveonL5uFPoh6za1h9Fg
         OclvqFWuM2NmhnbE08Zwr3WRX8a5RKaU77Mts5GbO1sqSz1aVFItNQwgOOnj9wyQqPJ7
         XN9wIc+a+8sfE1iACQxt5+6YXcnHs1lbRXL4gz7wWNuYk/gw2NvIGf+U9bQDWDLqrF5u
         4GbsumiB5hAgAxvNvwIsUDFaMFg9l9VUo4QIXEU9MagmQHQFTyvOW7u1mCA1dyg+KvFd
         4Q1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698218450; x=1698823250;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NoS842zLgIKkSI8+QUqHv3sPQiEji6N4hBzkvgiFN50=;
        b=UtmWdIVfygVk8/jit8CWTG+YxSoVt1txBd4MKTL82Pcs83/Ydjx09kOPTd9PBKwkML
         FiHGwbbCxTjRI4GN6ZA6nkmdyAwr/y8rxwlkoS0h+FNOrgNcU0n1fo1D2AJf6LdVk+yE
         OD/a28U7KIUPqE4YbPbwpnWGqiZJqK/IyHBi5yw6sdsnTjL5eyHSKYamipn7XKPaUm0O
         jMRNUaLP4h4oDGyzqZ8l3GbAh/0Ng19zD19QwkIrqhHhSDoXhCceyX4fmG+UC6ThN9xp
         +sWNsfV3hC0pFXRzun1eXKf4/ILNWjJm2ntGIoIdbkrTcKnsZ9Sw3vQvd2chdCA/VdCT
         KI7w==
X-Gm-Message-State: AOJu0Ywn9AYysTb/Hgb78zYByXryKEyV+Q6LbmFGF6tZC+OWhMTxYUq0
        mm40N6bnGoG0O70kAzUBvaPvuA==
X-Google-Smtp-Source: AGHT+IGmnYPUPc5xfkBAUX/aDYGji9jc3HoO/aGKz5O7ooj69MkfZd5JW8TMd25Bp/TNALuVjjD/tQ==
X-Received: by 2002:a5d:5911:0:b0:329:2649:ced5 with SMTP id v17-20020a5d5911000000b003292649ced5mr15232476wrd.32.1698218450519;
        Wed, 25 Oct 2023 00:20:50 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r5-20020a056000014500b0032db4825495sm11370891wrx.22.2023.10.25.00.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 00:20:50 -0700 (PDT)
Date:   Wed, 25 Oct 2023 10:20:46 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Laurent Fert <laurent.fert@intel.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        kernel-janitors@vger.kernel.org,
        Amelie Delaunay <amelie.delaunay@foss.st.com>
Subject: [PATCH v2] stm class: Fix a double free in stm_register_device()
Message-ID: <143baf7a-9d8c-471a-893a-fd827bbc7d05@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The put_device(&stm->dev) call will trigger stm_device_release() which
frees "stm" so the vfree(stm) on the next line is a double free.

Fixes: 389b6699a2aa ("stm class: Fix stm device initialization order")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2:  My first version introduced a use after free bug.  Thanks Amelie,
     for catching this.

 drivers/hwtracing/stm/core.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
index 534fbefc7f6a..20895d391562 100644
--- a/drivers/hwtracing/stm/core.c
+++ b/drivers/hwtracing/stm/core.c
@@ -868,8 +868,11 @@ int stm_register_device(struct device *parent, struct stm_data *stm_data,
 		return -ENOMEM;
 
 	stm->major = register_chrdev(0, stm_data->name, &stm_fops);
-	if (stm->major < 0)
-		goto err_free;
+	if (stm->major < 0) {
+		err = stm->major;
+		vfree(stm);
+		return err;
+	}
 
 	device_initialize(&stm->dev);
 	stm->dev.devt = MKDEV(stm->major, 0);
@@ -913,10 +916,8 @@ int stm_register_device(struct device *parent, struct stm_data *stm_data,
 err_device:
 	unregister_chrdev(stm->major, stm_data->name);
 
-	/* matches device_initialize() above */
+	/* calls stm_device_release() */
 	put_device(&stm->dev);
-err_free:
-	vfree(stm);
 
 	return err;
 }
-- 
2.42.0

