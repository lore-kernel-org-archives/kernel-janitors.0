Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A71BDC77B73
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Jun 2023 08:20:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236146AbjFFIUM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 6 Jun 2023 04:20:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230220AbjFFIUI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Jun 2023 04:20:08 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 067FBE79
        for <kernel-janitors@vger.kernel.org>; Tue,  6 Jun 2023 01:19:53 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f738f579ceso19566755e9.3
        for <kernel-janitors@vger.kernel.org>; Tue, 06 Jun 2023 01:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686039591; x=1688631591;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r7BybXB7K6At6gyQD9Ta56TpO5joEo6yFGjHkg9b930=;
        b=cqUKXeJn2Yb+7r/AvnxVNiHDs/0LwI++SJ7EoUHbfJRJAhvYoEuZQdB+kx08hCNrEh
         Qq+Qix6jpWJ8JdKulDTrl2WyjWMMTDfRt2c6RJ1rwosMHgvhOkfdfLzK0lxwUzHHiJGi
         TuoonHDnMnj6L0U49bwhK67+4Wq+bpX5Qso+4uhixG5SSyG4tdHb8BHcyLq3oHBKoUra
         PnGDgpASsMNiRkGV/Lnul4hG9vJtXsPUBPWFTKVP6XqMwfRNa5YwRr9rQxyER4c4ZaS7
         49xayyL0mA9O9aL4keqsS3FukjmFJy7+Rjxjl5heyFNrdNxigObIHEnYDHYZ6087NYho
         Sd9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686039591; x=1688631591;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r7BybXB7K6At6gyQD9Ta56TpO5joEo6yFGjHkg9b930=;
        b=bfDFtkyT7zqeYZMpi/2oyyVEt/cD4Tm8IcOz7l1mvN9JJfjtJBPQbHv2ajnVxA+4o0
         QtBb2TUdRCLRkXeQE9o/d37AuBxa2DZMkR665TjvxpLKveLT6LA6QwJOZC6ZvJj5BGHp
         xVGHpDrDFmCmMlLgVlBD4ugjmddDXAJ1aSYK2hU3zErPqZwItWtSyMQCzJrJVtjgVQma
         Fh84voqnIznNgROFymFf8226PMCub9AtzEr6rEFkmlZ8w8Adq10l6/cLIFZrs2K3eWVf
         hQ78b1ewkC+s44YzO1wQbERC2JTNZ0nEdHgW2YKM8nBoskzsa0FCGrFwYI5VrdyA8eWQ
         0Nqw==
X-Gm-Message-State: AC+VfDwbadI6BsA0KUrjo7OViGhKOzwPWVaVEOcDjbyqf9tze38CF8Bm
        xaGp6zm9L16G+eDszNRq/KwGaA==
X-Google-Smtp-Source: ACHHUZ6dWQWl42uLQJMjkBKDTwjpU9TzhB9j6pHWmYTdAZjz5jEeX6bQ7y9+P72q2wHtyYqxwM88bQ==
X-Received: by 2002:a7b:cc83:0:b0:3f6:3bb:5135 with SMTP id p3-20020a7bcc83000000b003f603bb5135mr1549539wma.14.1686039591363;
        Tue, 06 Jun 2023 01:19:51 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f4-20020a7bc8c4000000b003f7e66a51dfsm4064740wml.28.2023.06.06.01.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 01:19:50 -0700 (PDT)
Date:   Tue, 6 Jun 2023 11:19:46 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Raviteja Garimella <raviteja.garimella@broadcom.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: gadget/snps_udc_plat: Fix a signedness bug in probe
Message-ID: <ZH7sIkbSZg1rAJpJ@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The irq_of_parse_and_map() function returns negative error codes
but "udc->irq" is an unsigned int so the error handling doesn't work.

Fixes: 1b9f35adb0ff ("usb: gadget: udc: Add Synopsys UDC Platform driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/gadget/udc/snps_udc_plat.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/snps_udc_plat.c b/drivers/usb/gadget/udc/snps_udc_plat.c
index 0ed685db149d..37edd6c35077 100644
--- a/drivers/usb/gadget/udc/snps_udc_plat.c
+++ b/drivers/usb/gadget/udc/snps_udc_plat.c
@@ -103,7 +103,7 @@ static int udc_plat_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct resource *res;
 	struct udc *udc;
-	int ret;
+	int irq, ret;
 
 	udc = devm_kzalloc(dev, sizeof(*udc), GFP_KERNEL);
 	if (!udc)
@@ -132,11 +132,12 @@ static int udc_plat_probe(struct platform_device *pdev)
 
 	udc->phys_addr = (unsigned long)res->start;
 
-	udc->irq = irq_of_parse_and_map(dev->of_node, 0);
-	if (udc->irq <= 0) {
+	irq = irq_of_parse_and_map(dev->of_node, 0);
+	if (irq <= 0) {
 		dev_err(dev, "Can't parse and map interrupt\n");
 		return -EINVAL;
 	}
+	udc->irq = irq;
 
 	udc->udc_phy = devm_of_phy_get_by_index(dev, dev->of_node, 0);
 	if (IS_ERR(udc->udc_phy)) {
-- 
2.30.2

