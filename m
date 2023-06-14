Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3034DEB64DB
	for <kernel-janitors@archiver.kernel.org>; Wed, 14 Jun 2023 13:06:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244824AbjFNNG5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 14 Jun 2023 09:06:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244315AbjFNNG4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 14 Jun 2023 09:06:56 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8260E193
        for <kernel-janitors@vger.kernel.org>; Wed, 14 Jun 2023 06:06:54 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f61b45ee0dso8614048e87.0
        for <kernel-janitors@vger.kernel.org>; Wed, 14 Jun 2023 06:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686748013; x=1689340013;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YFfuOxz0aVpxNGfX5VGlWy6rfFH7wm495IfcvMn9LIA=;
        b=IjZLmnZD83bdyOsNsp6lxqbsqFl1lP2I0hpeUthIyltTZf+t+M9vmPe3Cdv/i29pxX
         h/bCZSJT21SBsXvv0d4tgcstRLqpx9S8sr+sSgvmt1rkjxqkkcrACVKXIqWqPA/3mw1v
         sAHcffpzxAw4wIrQdKYzcVZQcZXJzPOidmI+oGR5tlZxGp20gqrmX5wn8VXUIRdHIru7
         2VkPTmySQh49bZcleoEzNETQkWlnH6jT0dTJKTPFShNvduawz5hvFh65Qwqxz18O0nZM
         vwpjG4tR2x1YOVm03LXNe+KTa5LBsGibl/AtYXs22V2xYEiUVCgw2Alr8/5rAGRlloT2
         TA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686748013; x=1689340013;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YFfuOxz0aVpxNGfX5VGlWy6rfFH7wm495IfcvMn9LIA=;
        b=Vbaszrn1eqLsD9KyQ44ZiL8an5Tp060+0BzFAFXbw0PI8pGbKKYLmR2jbOHMujDQbF
         sXi+EmE+Cc0qAV7Wc9ctIOr7DdSLCpcXndmxuVdZRZwNAQqjj0jvN4gJJ8bZq28FwvVt
         di5gGIhFRAE3Uo8tGFTK1WTNy2ejhMBqA0YkM8RAamQRejk7GAqEGB/DJoZamqLxknGu
         zud/u4rOVcLUs6/AX4bqq3UD4kTsI/qSReUOGdVabaTdZcu+S4EislimcZLeTofxPVPh
         yiARmVp9IzOkOLYU6DXqtF/sQBeVCMU8x//oK46C7fVrN8KTdtfBE7GUzG7VInUUla8M
         xtbw==
X-Gm-Message-State: AC+VfDzn6eOOoYUqK0Lm5r2aZgizZkvXh0U+fw2rOjYnRc3KRO/XnXhY
        stMEWhSTmIz18Cswy17QQTl/hw==
X-Google-Smtp-Source: ACHHUZ4+8xYu0TX3myZ8dQQXDqCqdNsFL/Eth3tWWYbfOAZKae4zdc9hxMjPP1fWrusnoL7ln8frLg==
X-Received: by 2002:a19:5f19:0:b0:4f6:1433:fca0 with SMTP id t25-20020a195f19000000b004f61433fca0mr4970200lfb.0.1686748012681;
        Wed, 14 Jun 2023 06:06:52 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p18-20020a05600c205200b003f74eb308fasm17391390wmg.48.2023.06.14.06.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 06:06:51 -0700 (PDT)
Date:   Wed, 14 Jun 2023 16:06:47 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 2/4] media: mediatek: vcodec: fix resource leaks in
 vdec_msg_queue_init()
Message-ID: <b8948d9a-65bc-4f3f-aa90-60addd064819@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca491aaa-cfc4-4a84-b7fc-b64f3adc6550@moroto.mountain>
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If we encounter any error in the vdec_msg_queue_init() then we need
to set "msg_queue->wdma_addr.size = 0;".  Normally, this is done
inside the vdec_msg_queue_deinit() function.  However, if the
first call to allocate &msg_queue->wdma_addr fails, then the
vdec_msg_queue_deinit() function is a no-op.  For that situation, just
set the size to zero explicitly and return.

There were two other error paths which did not clean up before returning.
Change those error paths to goto mem_alloc_err.

Fixes: b199fe46f35c ("media: mtk-vcodec: Add msg queue feature for lat and core architecture")
Fixes: 2f5d0aef37c6 ("media: mediatek: vcodec: support stateless AV1 decoder")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
index 92ac82eb444e..be25d56712d8 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
@@ -307,6 +307,7 @@ int vdec_msg_queue_init(struct vdec_msg_queue *msg_queue,
 	err = mtk_vcodec_mem_alloc(ctx, &msg_queue->wdma_addr);
 	if (err) {
 		mtk_v4l2_err("failed to allocate wdma_addr buf");
+		msg_queue->wdma_addr.size = 0;
 		return -ENOMEM;
 	}
 	msg_queue->wdma_rptr_addr = msg_queue->wdma_addr.dma_addr;
@@ -338,14 +339,14 @@ int vdec_msg_queue_init(struct vdec_msg_queue *msg_queue,
 			err = mtk_vcodec_mem_alloc(ctx, &lat_buf->rd_mv_addr);
 			if (err) {
 				mtk_v4l2_err("failed to allocate rd_mv_addr buf[%d]", i);
-				return -ENOMEM;
+				goto mem_alloc_err;
 			}
 
 			lat_buf->tile_addr.size = VDEC_LAT_TILE_SZ;
 			err = mtk_vcodec_mem_alloc(ctx, &lat_buf->tile_addr);
 			if (err) {
 				mtk_v4l2_err("failed to allocate tile_addr buf[%d]", i);
-				return -ENOMEM;
+				goto mem_alloc_err;
 			}
 		}
 
-- 
2.39.2

