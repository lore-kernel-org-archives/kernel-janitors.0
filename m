Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFFE5C04A94
	for <kernel-janitors@archiver.kernel.org>; Thu, 10 Aug 2023 12:23:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235084AbjHJMXS (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 10 Aug 2023 08:23:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234919AbjHJMXN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 10 Aug 2023 08:23:13 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDFBB212B
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Aug 2023 05:23:11 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fe79b170e2so5696425e9.2
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Aug 2023 05:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691670190; x=1692274990;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zr/Mhw5ILyK63+MjSQ6uC1kOGczJiabTmNqreNeP1g8=;
        b=a733kCJZWdgy8S7SLUwWDixfAOOrZUbYpqO8z29w0ie5I7U490jMLttJrXPGbc2pnT
         1Zrx4FSgC4TuIO6UVsyBRcDmaRNK5rj6wwHBMp9J62hIRTEEc9W9OuJMahon+VAs93Tn
         Yt5WsEK5+EwDWInCqcZOFFpDoAOUF0bj6xaurNkbi7CkNPWArDnxuQACNRpGkGHoBM3Q
         hQMih1T77HUb9IezaYkynEgMNkn9RbRkBdudKWGXEH3ekhXIrojRZA2/w8zblDddVsCc
         pT4G8jinfS5CnsCDnyoGXzoiYr9pGy930Pp4d1hWoYr1vnYYdBJw3MasaWom5fg+b2kA
         EM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691670190; x=1692274990;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zr/Mhw5ILyK63+MjSQ6uC1kOGczJiabTmNqreNeP1g8=;
        b=RdqyJ/n1o85HcqKWK5r7sZLt+NoO+z+AmxI7MRA3N17gI0IgtGkNCmGrWsrFgYOOcm
         edbhw8b3fNIgURqlIh8q5puDOriunFQpJdPrzvXX7AmrBCkocZYIIAEjr0khj9qYPMXF
         IF2wapM9MPt7XwYZ/cbO+bGAUQ0hINm5tEmkSbCSacVAVKqaQGTteX9Z+ucl8AfxOGzK
         mE0TaLcn5rjBI6dkJbwhS+lhyB02pMf/IJ7+iY54oJnG/ut50i2bC27Q6uV6vTr0+XvH
         PzEToZBfmS3LSU8vfCfxMDpM85y7WHZbA2rdy2CM83rRjMcdsSxLScPwvgzqkMh4IrpO
         Irvw==
X-Gm-Message-State: AOJu0YxIzZCBFwwO2wMsMJHxir03Z7JAlcZ5vNTBCdJH8tm6aprjMr9j
        eO/rZ2mhsszn9vjKHIOzx79qvdRD1Xe0huigIKk=
X-Google-Smtp-Source: AGHT+IGXYtn2GpsCxrnbibEKzmgQkNNcdoFU2U3Bo5Oti8uDK9Ygc+2fIlj12Rg8GpXrcTsnR2aDOA==
X-Received: by 2002:a05:600c:2288:b0:3fe:1deb:82 with SMTP id 8-20020a05600c228800b003fe1deb0082mr1917714wmf.7.1691670190436;
        Thu, 10 Aug 2023 05:23:10 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u16-20020a5d4690000000b00313de682eb3sm2003995wrq.65.2023.08.10.05.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 05:23:10 -0700 (PDT)
Date:   Thu, 10 Aug 2023 15:23:06 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] accel/qaic: Clean up integer overflow checking in
 map_user_pages()
Message-ID: <24d3348b-25ac-4c1b-b171-9dae7c43e4e0@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The encode_dma() function has some validation on in_trans->size but it
would be more clear to move those checks to find_and_map_user_pages().

The encode_dma() had two checks:

	if (in_trans->addr + in_trans->size < in_trans->addr || !in_trans->size)
		return -EINVAL;

The in_trans->addr variable is the starting address.  The in_trans->size
variable is the total size of the transfer.  The transfer can occur in
parts and the resources->xferred_dma_size tracks how many bytes we have
already transferred.

This patch introduces a new variable "remaining" which represents the
amount we want to transfer (in_trans->size) minus the amount we have
already transferred (resources->xferred_dma_size).

I have modified the check for if in_trans->size is zero to instead check
if in_trans->size is less than resources->xferred_dma_size.  If we have
already transferred more bytes than in_trans->size then there are negative
bytes remaining which doesn't make sense.  If there are zero bytes
remaining to be copied, just return success.

The check in encode_dma() checked that "addr + size" could not overflow
and barring a driver bug that should work, but it's easier to check if
we do this in parts.  First check that "in_trans->addr +
resources->xferred_dma_size" is safe.  Then check that "xfer_start_addr +
remaining" is safe.

My final concern was that we are dealing with u64 values but on 32bit
systems the kmalloc() function will truncate the sizes to 32 bits.  So
I calculated "total = in_trans->size + offset_in_page(xfer_start_addr);"
and returned -EINVAL if it were >= SIZE_MAX.  This will not affect 64bit
systems.

Fixes: 129776ac2e38 ("accel/qaic: Add control path")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v6: it turns out this patch is mostly a clean up instead of a bug fix.
    The only real issue is the 32bit truncation bug, and no one is going to
    be using this driver on 32bit.

    This patch does change the behavior to return 0 for
    in_trans->size == 0 as discussed earlier.

v5: re-write
---
 drivers/accel/qaic/qaic_control.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index cfbc92da426f..388abd40024b 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -392,18 +392,31 @@ static int find_and_map_user_pages(struct qaic_device *qdev,
 				   struct qaic_manage_trans_dma_xfer *in_trans,
 				   struct ioctl_resources *resources, struct dma_xfer *xfer)
 {
+	u64 xfer_start_addr, remaining, end, total;
 	unsigned long need_pages;
 	struct page **page_list;
 	unsigned long nr_pages;
 	struct sg_table *sgt;
-	u64 xfer_start_addr;
 	int ret;
 	int i;
 
-	xfer_start_addr = in_trans->addr + resources->xferred_dma_size;
+	if (check_add_overflow(in_trans->addr, resources->xferred_dma_size, &xfer_start_addr))
+		return -EINVAL;
 
-	need_pages = DIV_ROUND_UP(in_trans->size + offset_in_page(xfer_start_addr) -
-				  resources->xferred_dma_size, PAGE_SIZE);
+	if (in_trans->size < resources->xferred_dma_size)
+		return -EINVAL;
+	remaining = in_trans->size - resources->xferred_dma_size;
+	if (remaining == 0)
+		return 0;
+
+	if (check_add_overflow(xfer_start_addr, remaining, &end))
+		return -EINVAL;
+
+	total = remaining + offset_in_page(xfer_start_addr);
+	if (total >= SIZE_MAX)
+		return -EINVAL;
+
+	need_pages = DIV_ROUND_UP(total, PAGE_SIZE);
 
 	nr_pages = need_pages;
 
@@ -435,7 +448,7 @@ static int find_and_map_user_pages(struct qaic_device *qdev,
 
 	ret = sg_alloc_table_from_pages(sgt, page_list, nr_pages,
 					offset_in_page(xfer_start_addr),
-					in_trans->size - resources->xferred_dma_size, GFP_KERNEL);
+					remaining, GFP_KERNEL);
 	if (ret) {
 		ret = -ENOMEM;
 		goto free_sgt;
@@ -566,9 +579,6 @@ static int encode_dma(struct qaic_device *qdev, void *trans, struct wrapper_list
 	    QAIC_MANAGE_EXT_MSG_LENGTH)
 		return -ENOMEM;
 
-	if (in_trans->addr + in_trans->size < in_trans->addr || !in_trans->size)
-		return -EINVAL;
-
 	xfer = kmalloc(sizeof(*xfer), GFP_KERNEL);
 	if (!xfer)
 		return -ENOMEM;
-- 
2.39.2

