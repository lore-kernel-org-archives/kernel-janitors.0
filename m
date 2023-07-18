Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5D1EB64DA
	for <kernel-janitors@archiver.kernel.org>; Tue, 18 Jul 2023 07:03:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbjGRHD5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 18 Jul 2023 03:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230095AbjGRHD4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Jul 2023 03:03:56 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D6221B5
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jul 2023 00:03:55 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fbc77e76abso48852465e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jul 2023 00:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689663834; x=1692255834;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bKhUip0PnDfA0irAdbFiKaOHVjUbRVp4s07pXzgNeRM=;
        b=IdoKdKMiMvD6TslkQXBIJ08QGkKo/w8prfMGKneCYH+NO5ZXbZ9ksBMV4URFvkdQS+
         kUR+OZhnupRenFbuOMkbfcMOPFQzhLG/k5dFSSj6VrfHI4p1neG9eyNDHvwJpQrxemMy
         jpz/C4bNm0aOFT/i5paPxrMP//mFdgXpkOYOX+dBb4/9f9TpFtEbJ/iSqyN2nxhAFqvW
         SRk6LPJJlXsIU3TcyNja5lnOqwN/pAUP7DSr0RzztuzRZpdway2LVhUbyLmVcu4u/q+J
         wdVsgu3YA0AeEy0XA+7gNZcZynRwqzkLdJkXZ/9FeeOhPNFg+eLg3jh1iPrL+FfEPMaz
         SL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689663834; x=1692255834;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bKhUip0PnDfA0irAdbFiKaOHVjUbRVp4s07pXzgNeRM=;
        b=GHB8ZdNYLPp86Yg9FytnPKxoU+d6eXXDlHv1PaC3iUSZqtGrxdy51zMUi+BBa5DYJu
         h3gWAhKNY9chxspeJyQC8I9187BRL8fEe3KtUOMZoUOdrzrfPooXs1pqvnEkYea3tJTA
         euhxnoshcAu/8IFelTa/AYcr2kZfLwgSA7N74TugFGZLuflc+qaQPOZRsWq43iFqeFLd
         dcKgaKk60tYVPoei69HDaBS4e53WZaZLFlifTRguVWLwkGp7ENScHBSzBeVFcXYopqPb
         HlOn1Ftp+YBL7HQfdsxI4XQOBCuZFkU9P7jFovWvniOi/9nRxzMydZ9uCyOykzIXMFqI
         3noQ==
X-Gm-Message-State: ABy/qLYtYY/RGzulDQjLwxpddTetb7Z8HlkG9sYp5O6ZElPAS1i0O0Ro
        zDcrSY6H5dIFUZTNVcSvDn3JIw==
X-Google-Smtp-Source: APBJJlHfvHNEoZg8IkGxubThfVC+Ptja0xZZWZ7+R5eOiDUWfpCkd0ddPHNKcaxISr0g0kVD+rRX+A==
X-Received: by 2002:a7b:c846:0:b0:3f8:fc2a:c7eb with SMTP id c6-20020a7bc846000000b003f8fc2ac7ebmr1014417wml.5.1689663833802;
        Tue, 18 Jul 2023 00:03:53 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 20-20020a05600c22d400b003fbc9d178a8sm9513810wmg.4.2023.07.18.00.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 00:03:52 -0700 (PDT)
Date:   Tue, 18 Jul 2023 10:03:49 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Alexander Duyck <alexander.h.duyck@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Chen Zhongjin <chenzhongjin@huawei.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] driver core: test_async: fix an error code
Message-ID: <1e11ed19-e1f6-43d8-b352-474134b7c008@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The test_platform_device_register_node() function should return error
pointers instead of NULL.  That is what the callers are expecting.

Fixes: 57ea974fb871 ("driver core: Rewrite test_async_driver_probe to cover serialization and NUMA affinity")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/base/test/test_async_driver_probe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/test/test_async_driver_probe.c b/drivers/base/test/test_async_driver_probe.c
index 929410d0dd6f..3465800baa6c 100644
--- a/drivers/base/test/test_async_driver_probe.c
+++ b/drivers/base/test/test_async_driver_probe.c
@@ -84,7 +84,7 @@ test_platform_device_register_node(char *name, int id, int nid)
 
 	pdev = platform_device_alloc(name, id);
 	if (!pdev)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	if (nid != NUMA_NO_NODE)
 		set_dev_node(&pdev->dev, nid);
-- 
2.39.2

