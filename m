Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE98C77B7E
	for <kernel-janitors@archiver.kernel.org>; Thu, 25 May 2023 15:38:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241556AbjEYPis (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 25 May 2023 11:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241327AbjEYPir (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 25 May 2023 11:38:47 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1406899
        for <kernel-janitors@vger.kernel.org>; Thu, 25 May 2023 08:38:45 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f6a6b9c079so5762875e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 25 May 2023 08:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685029123; x=1687621123;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ViAjcjtsfDoFKXKSJ3cJEJ7NDXZzNYfQtt5Kb/3P/+w=;
        b=CgoK4GviG131uj619Y9xyuXh0pQZFPhsIXacQP0MxCDyMKE1/ms0lv237rN/rNyKv3
         N2SSP6ijMSj3O1x9YL1yZ9hw4HyQupnF8RBg1eYPEU2dQHI93gF8h0oJe6eduzH/AnF4
         oN0kJb+890cfo2qhWvPuGeL90XvanWMarQA8DXPJHZddx52rohzYCYeklsiCis9noHr7
         PiNUhNVj+t0WZ2hdrcAdPfo+pKPBi5ZjDoaMayGVkKxL/p4Hjq3N/TPcvoTyDfLZ9cIv
         v9nF8NJoobbNfbo+sjaejTrAIbH4wZPOhsqVV9SL1C1yKXTgcHIxK+g8CVEef7Xzi9FU
         aQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685029123; x=1687621123;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ViAjcjtsfDoFKXKSJ3cJEJ7NDXZzNYfQtt5Kb/3P/+w=;
        b=RD3/ovtfE4h2vIYDfmjyLdr1qwSXEPJYig2wDMow3h9XBXHon75dS2ADrIsoz6DQ1D
         bLrJxfp8g5qzfq6ftTBLVdDQik8MIY1b6zmtccggwo9nl7Cn8Zndq4eqx7SJKLxeQeBg
         Ewe7nBXa2EBBKlK6eUgppjrH5KdCgFiElz2zQV20mH7YA8LoRBERuIJZ+6uN4YOQ8NNu
         HRgKnMXBdVKCJ6nOVNCgZmL7rxZA9iBMp/+TBQgLrlu+SmT8oMo2zaFTuzQ6HXQf7MoQ
         6lJhPbcr5UWDZAhfY0PTkuDkmfH7h8RpjOzP1JlpWAi+NggEfWDIrlHPynDf8EOt6iWL
         xI6w==
X-Gm-Message-State: AC+VfDz/U3IpotTj+/sYrx0z77n8dMsr3vRbNwGZx5+FYjOJvk4/A7Vt
        r5Zog2iLUo6MVs1ekOkp0vx/Hw==
X-Google-Smtp-Source: ACHHUZ4T02fMIl2HNUangLGDmcFcniOBW7c472wfdeCybtytDzrlfTCgWO2oLCOLi39BEq6NomkBbw==
X-Received: by 2002:a05:600c:224d:b0:3f6:ad84:e603 with SMTP id a13-20020a05600c224d00b003f6ad84e603mr2926993wmm.28.1685029123569;
        Thu, 25 May 2023 08:38:43 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u20-20020a05600c211400b003f4ebeaa970sm2465178wml.25.2023.05.25.08.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 08:38:42 -0700 (PDT)
Date:   Thu, 25 May 2023 18:38:37 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: gadget: udc: fix NULL dereference in remove()
Message-ID: <ZG+A/dNpFWAlCChk@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "udc" pointer was never set in the probe() function so it will
lead to a NULL dereference in udc_pci_remove() when we do:

	usb_del_gadget_udc(&udc->gadget);

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/gadget/udc/amd5536udc_pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/udc/amd5536udc_pci.c b/drivers/usb/gadget/udc/amd5536udc_pci.c
index c80f9bd51b75..a36913ae31f9 100644
--- a/drivers/usb/gadget/udc/amd5536udc_pci.c
+++ b/drivers/usb/gadget/udc/amd5536udc_pci.c
@@ -170,6 +170,9 @@ static int udc_pci_probe(
 		retval = -ENODEV;
 		goto err_probe;
 	}
+
+	udc = dev;
+
 	return 0;
 
 err_probe:
-- 
2.34.1

