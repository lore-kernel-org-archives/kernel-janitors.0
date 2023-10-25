Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 330D5C0032E
	for <kernel-janitors@archiver.kernel.org>; Wed, 25 Oct 2023 11:57:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234957AbjJYL5f (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 25 Oct 2023 07:57:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234943AbjJYL5d (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Oct 2023 07:57:33 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E72B137
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 04:57:29 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c518a1d83fso88929361fa.3
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 04:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698235048; x=1698839848; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FLjK8RH2hQrcnxdXwxL9ujbIfgaQvug2oCqsCmeP5e0=;
        b=XzEv5su2C+jLr2qHcY4g+0bw4W8dYoIlhyPUNa3nexL3RJNr/sMvkVOKrMLXk51keZ
         cc6zVSpwZxB3V2KFxAM2mcL18PpacTmXF2meYmSUTKLy8iXGRSRTGg/7IMI2A/jSUb2A
         GGd9Se+gaXwu5+5k6eIvrr29I5dna89nAOd25Y1d59IOGBaI+a1xKEXRKjrWWKpgTjSc
         uZaVMmv308yF1OwLLfZ0bTp47Fs/UMo4t7JwyhThGkUqYpdJfiG0wJIVybv7IRkkoppG
         3rCvielW3RLqKAVpVo/VJ+bdz7r3w4WHJRa6C77xWVNr434HTrJ575hsQR5lqWHI1oJN
         szhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698235048; x=1698839848;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FLjK8RH2hQrcnxdXwxL9ujbIfgaQvug2oCqsCmeP5e0=;
        b=eME1gHSBzJSbmEtwD6zx1KtE3dU6FYcxc8YU1YYBrVGWica/JL1hPMbOFmpVh1sVEm
         S+u7wqkVglCSnWFRwMTH7XkfQdPDtm75L3USKXOcLai93Qi5to26tc94N0d+j4Xc5X+k
         FvUcwAKuQE1zLT8e+w0ngDUImQYZ7kaH5vNhL2l1i5cD9LoFWA1bI+AAC+ppr848xkSF
         l70D8JEQP5ScaL/gpx6HBmcOWTrIwyPsAY0xorNN2BjyMulC83zl1Y+IO11xrZb446tW
         e3QntRRXKQPg6UShE6FpbIWa7Pq31ejnRjUSSz4We7SWdugvOoFkqGNZUwJOUPFZ7hec
         kxGA==
X-Gm-Message-State: AOJu0YyYsZjYGDGzk+UtpjTfwDBWi3EcN2EIRJsq4xIBQeOuWHfT77SF
        wDrgIgfCA44/x3fj9j0LvpX8VA==
X-Google-Smtp-Source: AGHT+IHt+ZHyJntfYE7bZiBPM7m3Mw4gV60PtPFa/Z1UEb1CDLD4v0EPRaFHGozSPydq2e9pVmKjpA==
X-Received: by 2002:a05:651c:152:b0:2b9:ecab:d924 with SMTP id c18-20020a05651c015200b002b9ecabd924mr11483741ljd.18.1698235047783;
        Wed, 25 Oct 2023 04:57:27 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c358c00b00401b242e2e6sm19359165wmq.47.2023.10.25.04.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 04:57:27 -0700 (PDT)
Date:   Wed, 25 Oct 2023 14:57:23 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] PCI: endpoint: Fix double free in __pci_epc_create()
Message-ID: <2ce68694-87a7-4c06-b8a4-9870c891b580@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The pci_epc_release() function frees "epc" so the kfree() on the next
line is a double free.

Fixes: 7711cbb4862a ("PCI: endpoint: Fix WARN() when an endpoint driver is removed")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pci/endpoint/pci-epc-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
index fe421d46a8a4..56e1184bc6c2 100644
--- a/drivers/pci/endpoint/pci-epc-core.c
+++ b/drivers/pci/endpoint/pci-epc-core.c
@@ -869,7 +869,6 @@ __pci_epc_create(struct device *dev, const struct pci_epc_ops *ops,
 
 put_dev:
 	put_device(&epc->dev);
-	kfree(epc);
 
 err_ret:
 	return ERR_PTR(ret);
-- 
2.42.0

