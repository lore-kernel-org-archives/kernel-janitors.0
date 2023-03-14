Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40624C6FD1F
	for <kernel-janitors@archiver.kernel.org>; Tue, 14 Mar 2023 08:19:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbjCNITO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 14 Mar 2023 04:19:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbjCNISr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Mar 2023 04:18:47 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 287DB8DCE0
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Mar 2023 01:18:16 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id o7so4080724wrg.5
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Mar 2023 01:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678781894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2214dcZRNnFFU9/Etuq7BnZaeDVA1LLzT7N7JzpJVnM=;
        b=A5j3q9dJ2yC101SHzOx+ouKXXw2OXhxVZbUgszPQ0lwmy6tvtDFY7fsvg6bmpfVvK0
         ewiepno8BqXtp+uqpPKC4jFD6gAyinz4sKNMjmA59+bJ5C0SfChfpgHfS/0Vpfl7oj7d
         4Y4xeBXQTU78clGG8QD9xOwHlqNGPsLNTCyZOfZz/Xbf5hn0F0xD+NBLW8yR5AL6fkNj
         yhQOSsSWOLBx99YrD8tB4vTDc/Q04vtcDCtQIcKsCUNd4s7qgH+r2rz/NNBIMR5RpoT/
         ZfTymqsA8qB4Ca07KVX8Tw2/mI6mqq5e3GVUovSnoZEbPOutOHmO0b+OPbu8n0Sr+dkY
         xFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678781894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2214dcZRNnFFU9/Etuq7BnZaeDVA1LLzT7N7JzpJVnM=;
        b=WpVy6jRWOqsAC4hJ03dnhCkXiAQfxzC/5/WF6GAIDjAa6WR3gMvMbm+38rjuP1/JNI
         US8QLaWfvF6jzOs6FiCi2uZe22+7QJLE8NGROl7kMmSvHs/SLcr4Csuq0SAv92X29aCY
         cyCHiIrAKqcaKXa4YuoTjRSYjvARN5sv/wIu6UFBVZq+3jy80QsuKDQUHrtuPWrpezjU
         BO1qwIst7qWBD7pW6a9jVpKng5y3kkgnc5PAd5cVbJdaiKEf5XbqsfOulUc/pLY119x0
         HfaXN2c9li0B9B6hJIW30OzmvVnp9fhZrVC/nN51BPM/XzuTh0r5KgoEGxwJ+A56Q/tu
         RmjA==
X-Gm-Message-State: AO0yUKUVxgWkU/lh6KNBLYmTpgbZMONUblIqTuS0KcJGHD20HrSqvl8l
        CiwJXyD/GoMTFlnZpG3B8+4=
X-Google-Smtp-Source: AK7set9iRHCKWKPm+mnreWBZ1a1d7cE4kIhCrdrICssPEdiPtuBsjjhazUr3f1fAUw3y2IGFlhP5iw==
X-Received: by 2002:a05:6000:1004:b0:2cf:e517:c138 with SMTP id a4-20020a056000100400b002cfe517c138mr2828443wrx.66.1678781894551;
        Tue, 14 Mar 2023 01:18:14 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id t2-20020a5d49c2000000b002ce72cff2ecsm1416846wrs.72.2023.03.14.01.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 01:18:13 -0700 (PDT)
From:   Colin Ian King <colin.i.king@gmail.com>
To:     Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
        Yuri Nudelman <ynudelman@habana.ai>
Cc:     kernel-janitors@vger.kernel.org
Subject: [PATCH][next] habanalabs: Fix spelling mistake "maped" -> "mapped"
Date:   Tue, 14 Mar 2023 08:18:12 +0000
Message-Id: <20230314081812.26065-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/accel/habanalabs/common/memory_mgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/memory_mgr.c b/drivers/accel/habanalabs/common/memory_mgr.c
index 30f8059f28c2..c4d84df355b0 100644
--- a/drivers/accel/habanalabs/common/memory_mgr.c
+++ b/drivers/accel/habanalabs/common/memory_mgr.c
@@ -275,7 +275,7 @@ int hl_mem_mgr_mmap(struct hl_mem_mgr *mmg, struct vm_area_struct *vma,
 
 	if (atomic_cmpxchg(&buf->mmap, 0, 1)) {
 		dev_err(mmg->dev,
-			"%s, Memory mmap failed, already maped to user\n",
+			"%s, Memory mmap failed, already mapped to user\n",
 			buf->behavior->topic);
 		rc = -EINVAL;
 		goto put_mem;
-- 
2.30.2

