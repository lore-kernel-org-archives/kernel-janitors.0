Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A43E7849A
	for <kernel-janitors@archiver.kernel.org>; Mon,  2 Oct 2023 07:04:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235683AbjJBHEV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 2 Oct 2023 03:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235661AbjJBHEU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 2 Oct 2023 03:04:20 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C80FA6
        for <kernel-janitors@vger.kernel.org>; Mon,  2 Oct 2023 00:04:17 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-32488a22810so3500341f8f.3
        for <kernel-janitors@vger.kernel.org>; Mon, 02 Oct 2023 00:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696230256; x=1696835056; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y6/vJt9ctuXTzh2TrR+gtgZxArsjz8X1YrhkfYqmY7U=;
        b=D58kjeZhGhkKH+i/XIRIlqTCOuV3CFmax+h4WVQckQnXn02zztf9OmLNCCgg3I2FPw
         nfl0pcix/oVAEC5g1pp9KbYxmIhmM+uypO0XW2TL+K/2p31xatAxaeldu/4qMGtA/skL
         De23qSeztdKWiY4jmRgIVft4pD9q9hPArX1wqW3t7V2FazYttgMyb9DTSGgHn+8IZrrB
         0qhkEUXVjC0p4sKh73Pl0WvGuELZva6yFfZl1xPBWhVUJDmobAPwZri6LDdZ7qHvMs4x
         uNGqxgRgrJWxAfjYqqfOqkWl17WHWoUYYaHhgtb2PvKeEw+ZFcNgzjLhZK/dJNEUbi70
         793w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696230256; x=1696835056;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6/vJt9ctuXTzh2TrR+gtgZxArsjz8X1YrhkfYqmY7U=;
        b=hhoc19tHzd73yLELZ3Q2go4W0he93kBJKtQk9b8eNFYGTrDY70YDd0RM2rj60uI8kU
         vWS96HwejZa4Dz0vlPtPOfjG8uzO4frqp24AUvcwp2I//YVo3HvjmALjqu645VSD7hZ7
         hTeMJm8XqO5a+w7yRSoVVSJhlGTXrldQDxkY9nM7AxuIR5mq37TdUorS/FSyK3KMsXwB
         VUhWHLIWPL+3IuO8ibTJpn1TO/ARHQWVCqeSnVi3/WdpNrQjzdzwjVYzuNFzIIQQ9r+j
         SoDyT0tUTL+K4oCW2pL5JHmM4eunHXhL4HNyZcxUfyx9R4YTtLjqw6+BnljhT2HTxvU8
         LVpA==
X-Gm-Message-State: AOJu0YwaG5TGsXNczzm0Yy9FVHrfdacnrAJIL22v+VYB4Nd/MzZ/U7Bn
        al/1hvLtQrNNv8MnKccnvyC2kQ==
X-Google-Smtp-Source: AGHT+IEyYBJJMbHZjWHeeTihAKMquhbpnNMcEirvRUurb/E/iXkqlOsL65t+QCELvd7XjCoC8de/Mg==
X-Received: by 2002:adf:edc2:0:b0:320:932:80a0 with SMTP id v2-20020adfedc2000000b00320093280a0mr9049441wro.54.1696230255722;
        Mon, 02 Oct 2023 00:04:15 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s5-20020adf9785000000b003232380ffd7sm19295168wrb.102.2023.10.02.00.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 00:04:15 -0700 (PDT)
Date:   Mon, 2 Oct 2023 10:04:12 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     John Stultz <jstultz@google.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        "T.J. Mercier" <tjmercier@google.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] dma-buf: heaps: Fix off by one in cma_heap_vm_fault()
Message-ID: <bc145167-0471-4ab3-935c-aa5dc20e342a@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The buffer->pages[] has "buffer->pagecount" elements so this > comparison
has to be changed to >= to avoid reading beyond the end of the array.
The buffer->pages[] array is allocated in cma_heap_allocate().

Fixes: a5d2d29e24be ("dma-buf: heaps: Move heap-helper logic into the cma_heap implementation")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/dma-buf/heaps/cma_heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index ee899f8e6721..bea7e574f916 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -165,7 +165,7 @@ static vm_fault_t cma_heap_vm_fault(struct vm_fault *vmf)
 	struct vm_area_struct *vma = vmf->vma;
 	struct cma_heap_buffer *buffer = vma->vm_private_data;
 
-	if (vmf->pgoff > buffer->pagecount)
+	if (vmf->pgoff >= buffer->pagecount)
 		return VM_FAULT_SIGBUS;
 
 	vmf->page = buffer->pages[vmf->pgoff];
-- 
2.39.2

