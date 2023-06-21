Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE4FAEB64DD
	for <kernel-janitors@archiver.kernel.org>; Wed, 21 Jun 2023 07:22:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbjFUHW1 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 21 Jun 2023 03:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231252AbjFUHW0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 21 Jun 2023 03:22:26 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 575A01A1
        for <kernel-janitors@vger.kernel.org>; Wed, 21 Jun 2023 00:22:25 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f918922954so32087435e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 21 Jun 2023 00:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687332144; x=1689924144;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6LvoAnY92IhuYKxUcIFqiF0B336ukPa8jJhL/uMvwzE=;
        b=fqb+Lk5qFDdI8tsOo384wsahnjd07gLKH1f6HgdRNIZpDEu+zO/YTZuQ+XhyUm9pmz
         4wK6gc/xZRmxT+Km9H9lXKMZT2or6+NA5NV/jRz9cP6EmBe9LuOdxICsvgPUs2qXU9Uv
         C5lFzWsrnwKKWtNg0XXySJ/s4z5KGXWz9pXGESAOmufwh5ZplHXxaOjS4oO1KlEXpOy5
         RmhJ+ZatkFLeblkVSgBQwQc7S81DhxysHCXiI/Cs/wGlRSNMsNUaSRRM4/1YeJmJYQrr
         3noxF2mMjzVStM7K7wELhUlk6eCqHCXBXl2RNoiI1v4ZHKChof/0ugZk2t7Ue+bsE2N+
         6YIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687332144; x=1689924144;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6LvoAnY92IhuYKxUcIFqiF0B336ukPa8jJhL/uMvwzE=;
        b=ihEE39dLYlN1c/VV8P7+JH/aGfoWALjQaYiRCIb6EXRuBpdisgzj1gsk5piVCIy1hk
         UU9ZMPQTq0yj5GpAhSoRQ9NKJWhJJ+8tEUG2hExWmyLm/uyiqfEI7wBrwxRQLYtBYxvK
         Ji/cd7CDJIIiS0PbpTO3qP4GkMVQW9U1LKl8eLiJecmYhcoiV7wbizdOSV5JfE1uRod/
         BGqxkBGr18zrcsBO1Oyj4I0YIcIuEYATc/xPGM1CJ5uh4uyjyKhcpedmS4ZBVtNn08bL
         GS7UL9YEh+yIeK3+7u4TUuCk/pxwiDz9e9Gt3x6QTwAPbgfE+bIO2nQCufYivhL1ZJ76
         X/Pw==
X-Gm-Message-State: AC+VfDzSu/DD0Q8D7gllU6g9N9ilyjZDbsOMOqzN7/kRT2YZ//PI+6Oi
        +1CX8Gv6sntk246bb0E4t4D3xUYvJIQOM15pyTE=
X-Google-Smtp-Source: ACHHUZ4OLioLcbMLtIFKz0PjiB4ajmxMhMKaALqVWaK0zxD//PQ2N3/uhDiKEOVC0pJwRkD5gwXahA==
X-Received: by 2002:a05:600c:211a:b0:3f6:e59:c04c with SMTP id u26-20020a05600c211a00b003f60e59c04cmr10030649wml.24.1687332143848;
        Wed, 21 Jun 2023 00:22:23 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l5-20020a1ced05000000b003f70a7b4537sm15211480wmh.36.2023.06.21.00.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 00:22:22 -0700 (PDT)
Date:   Wed, 21 Jun 2023 10:22:18 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 4/5] accel/qaic: move and expand integer overflow checks for
 map_user_pages()
Message-ID: <435abccc-9251-4c27-9b35-8fdf4bbd2433@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af83549b-ccb4-4a8d-b036-9359eba9d39f@moroto.mountain>
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The integer overflow checking for find_and_map_user_pages() was done in
encode_dma().  Presumably this was to do it before the allocation.  But
it's not super important that the failure path is a fast path and it
hurts readability to put the check so far from the where the variable is
used.

Move the check to find_and_map_user_pages() instead and add some more
additional potential integer overflow checks.

Fixes: 129776ac2e38 ("accel/qaic: Add control path")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
I kind of went to town adding integer overflow checks here.  Please,
review this extra carefully.

 drivers/accel/qaic/qaic_control.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 96a26539df18..03932197f1ac 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -401,6 +401,12 @@ static int find_and_map_user_pages(struct qaic_device *qdev,
 
 	xfer_start_addr = in_trans->addr + resources->xferred_dma_size;
 
+	if (in_trans->size == 0 ||
+	    in_trans->addr + in_trans->size < in_trans->addr ||
+	    in_trans->addr + resources->xferred_dma_size < in_trans->addr ||
+	    in_trans->size + offset_in_page(xfer_start_addr) < resources->xferred_dma_size)
+		return -EINVAL;
+
 	need_pages = DIV_ROUND_UP(in_trans->size + offset_in_page(xfer_start_addr) -
 				  resources->xferred_dma_size, PAGE_SIZE);
 
@@ -563,9 +569,6 @@ static int encode_dma(struct qaic_device *qdev, void *trans, struct wrapper_list
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

