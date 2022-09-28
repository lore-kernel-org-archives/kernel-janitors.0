Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F5F2C32771
	for <kernel-janitors@archiver.kernel.org>; Wed, 28 Sep 2022 21:36:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233015AbiI1Vgb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 28 Sep 2022 17:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232784AbiI1Vga (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 28 Sep 2022 17:36:30 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 754377CAA3
        for <kernel-janitors@vger.kernel.org>; Wed, 28 Sep 2022 14:36:28 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id z2so18986897edi.1
        for <kernel-janitors@vger.kernel.org>; Wed, 28 Sep 2022 14:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=yZ5jnLcw8peGxM/ajQkPwsoRi6wSNXlV4d95WWjjKSI=;
        b=TJaiQudU7/UflGcgNFkElAzy5NaII8aqcOvSKlM3QPc3JD3sHlVC9GnC7AmpJtjVgb
         9ALliWWYbFKfMTq1cHIWzsM5lM6OA5zDUWm6qe4W4ojkv2QpLlG9C5YOi1bTdGKh3h4c
         D59OHEElOb4hqta8NzMy4IgCapYg9aL/IoMjW3I9ujlLQPRDjY2zdz7JsOKgbEi821rI
         +O+BD23GvWh9OTBWN77GW7wSx1863ci69fKF4CpxA2QF1RdOv+5/3a8oihqEZQf8nyI1
         BbOK7sEKvAGZJENgupIqJWzReM0hL+0ZfRgaDNB0iM8f6N9pEkoLcGkkBfc9Igrv1g4p
         nq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=yZ5jnLcw8peGxM/ajQkPwsoRi6wSNXlV4d95WWjjKSI=;
        b=2iN0ZU3a/eohBCUCYodkor8xUYHC1NulTGFnjPNv8J3kTHSw+K/irLEkdsF4p1RHGw
         U93HXvpNYoDrBaCkM1tY3UY7wvG24dtzi2BF/q7gDf5WP8Ss9iclSnzcboWeMNPsKtCg
         lu9kZqkkmGhMTpWHhmYFNxAPTOMT4sbVhplH3yz1kXBZXR9XZ4b2Ebsgvf4eAj5Ht7wC
         +wP3C2G4no1KzOeWy0axsmaZkV38JF6g5zVkNxhe0LAYUHmXXW5VsRb83GgbCJnkCGt3
         /viJeFrgTCl+NSNCwqhBwmcwXMps4sstIsvZQoNXDhd4ssB3+t9quuLwPsCICh9LJEuR
         sz6w==
X-Gm-Message-State: ACrzQf3rszMsX+JbGS+pQsfPqKUWwYlfCWbwBONi9f5+XXdwEemmHoKl
        4d2kYcxzDy2NroZd0DHvW/FbAo7g908=
X-Google-Smtp-Source: AMsMyM4GU9aiGpg8t0NzuAr5Uoimx8jONs+vsZ3iZqLaG1IsrRFmOVQgXHw8b/Z7o9Q+halHW2vzuA==
X-Received: by 2002:aa7:d3d9:0:b0:458:16a9:5811 with SMTP id o25-20020aa7d3d9000000b0045816a95811mr33725edr.286.1664400986991;
        Wed, 28 Sep 2022 14:36:26 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810d:6e40:e18:7e7c:1993:f196:df58])
        by smtp.gmail.com with ESMTPSA id ty27-20020a170907c71b00b0074ae59d85a4sm2828715ejc.20.2022.09.28.14.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 14:36:26 -0700 (PDT)
From:   Markus Fuchs <mklntf@gmail.com>
To:     kernel-janitors@vger.kernel.org
Cc:     Markus Fuchs <mklntf@gmail.com>
Subject: [PATCH] scsi: ufs: Remove unneeded casts from void *
Date:   Wed, 28 Sep 2022 23:36:16 +0200
Message-Id: <20220928213616.127269-1-mklntf@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The end_io_data member of the "struct request" type has type "void *", so no
cast is necessary.

Signed-off-by: Markus Fuchs <mklntf@gmail.com>
---
Hello,

I try to follow the guide on https://kernelnewbies.org/KernelJanitors/Todo and
therefor send this patch.

Regards,
Markus

 drivers/ufs/core/ufshpb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/core/ufshpb.c b/drivers/ufs/core/ufshpb.c
index a1a7a1175a5a..0ce5063bedc5 100644
--- a/drivers/ufs/core/ufshpb.c
+++ b/drivers/ufs/core/ufshpb.c
@@ -615,14 +615,14 @@ static void ufshpb_activate_subregion(struct ufshpb_lu *hpb,
 
 static void ufshpb_umap_req_compl_fn(struct request *req, blk_status_t error)
 {
-	struct ufshpb_req *umap_req = (struct ufshpb_req *)req->end_io_data;
+	struct ufshpb_req *umap_req = req->end_io_data;
 
 	ufshpb_put_req(umap_req->hpb, umap_req);
 }
 
 static void ufshpb_map_req_compl_fn(struct request *req, blk_status_t error)
 {
-	struct ufshpb_req *map_req = (struct ufshpb_req *) req->end_io_data;
+	struct ufshpb_req *map_req = req->end_io_data;
 	struct ufshpb_lu *hpb = map_req->hpb;
 	struct ufshpb_subregion *srgn;
 	unsigned long flags;
-- 
2.37.3

