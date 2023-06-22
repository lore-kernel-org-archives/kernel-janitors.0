Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C558BEB64DA
	for <kernel-janitors@archiver.kernel.org>; Thu, 22 Jun 2023 13:08:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbjFVNIR (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 22 Jun 2023 09:08:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231458AbjFVNIO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 22 Jun 2023 09:08:14 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 829D31BF5
        for <kernel-janitors@vger.kernel.org>; Thu, 22 Jun 2023 06:08:05 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-31297125334so659891f8f.0
        for <kernel-janitors@vger.kernel.org>; Thu, 22 Jun 2023 06:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687439284; x=1690031284;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=02UJ5L0OwLnnFcq67XEfE9W+7rh1Z6rTXpFA6U118CI=;
        b=TTy5/wULSnwjeWmDfmT0POo4Y9DjNbxtc6Mc1wuc7rv9Zr7a5ItTfYOh6lfmk8kiUj
         Z7WlfCBxMjM5WcodnCwGViVz8rvx44KBmqRTP9AlSEOdK3Xlfd/siOWagAehB+yiVY5M
         Qk7e4x4sEXoHg7Qyc52M2A6H+p5LETTxQaZTrdHy5e+YoFK5tk9AlVuWwM9s2GNzPm7W
         XucxsbwOWYoziro6Zmx4VEKUva02jW9B0fnQt3SQ0s3EDRrnYhFhAOufp9dmdOQY0K2W
         Sriw+miK2f5SXougqKeLRi0yrX08paOgWBZqFvrU17SRA3stHXLX81VV/EcA7GX8ux4M
         jVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687439284; x=1690031284;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=02UJ5L0OwLnnFcq67XEfE9W+7rh1Z6rTXpFA6U118CI=;
        b=A/fpBJb4mbU09FEjxsvoa86UeBlylFLXvrFJq/x3vrGz6dNiOOzC+xuh/PnLyvjQLD
         SUtOzk92Wghoc0DJkPlkAR2V9OPcYdBCRse5W0Z7ChDI6Gz3o1g5ENNTvgRN5S1jUO1x
         97uTDXJ08yGjcqR0RRgU1kxXdaQVyH8v/azZAEI93yZT7Dj+OktD4hHlGxLJb2iyd3+e
         8wmNYM9t/17tjhyJI0/wL4sSH71a7Y0uHChknfq02qwG8WWFRkkUKWWoj19KmLqXTVe3
         7ULSPbiGLMf4ZJOijqFmRg6qlk0f6CmNbih209jnhUlejd/OyuUFhjC//9vM6LCFV51U
         lPTA==
X-Gm-Message-State: AC+VfDxMIgveYaZzA7w0RBcksFMmCpTF0QnwmJuEqY4RnYhhsCNqj2My
        qZTOWhfaEPM7w8rIbRsHx4u5H5QSmE4yJ5aAeVM=
X-Google-Smtp-Source: ACHHUZ6oGux1tA/SsAglPOxgcegTU4ZUI4UzICK3TsAN976GuuSCXYlQTIpN2XsLnYyM9Eew3VnGMw==
X-Received: by 2002:a5d:630c:0:b0:311:3554:bec9 with SMTP id i12-20020a5d630c000000b003113554bec9mr12946713wru.21.1687439283996;
        Thu, 22 Jun 2023 06:08:03 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z2-20020adfd0c2000000b003062ad45243sm7071564wrh.14.2023.06.22.06.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 06:08:02 -0700 (PDT)
Date:   Thu, 22 Jun 2023 16:07:57 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     christophe.jaillet@wanadoo.fr
Cc:     Dinh Nguyen <dinguyen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-janitors@vger.kernel.org
Subject: [bug report] firmware: stratix10-svc: Fix a potential resource leak
 in svc_create_memory_pool()
Message-ID: <cc42b74a-2503-461b-82f9-05d035980619@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Christophe JAILLET,

The patch 1995f15590ca: "firmware: stratix10-svc: Fix a potential
resource leak in svc_create_memory_pool()" from Jun 13, 2023, leads
to the following Smatch static checker warning:

	drivers/firmware/stratix10-svc.c:759 svc_create_memory_pool()
	warn: 'va' is an error pointer or valid

drivers/firmware/stratix10-svc.c
    738 static struct gen_pool *
    739 svc_create_memory_pool(struct platform_device *pdev,
    740                        struct stratix10_svc_sh_memory *sh_memory)
    741 {
    742         struct device *dev = &pdev->dev;
    743         struct gen_pool *genpool;
    744         unsigned long vaddr;
    745         phys_addr_t paddr;
    746         size_t size;
    747         phys_addr_t begin;
    748         phys_addr_t end;
    749         void *va;
    750         size_t page_mask = PAGE_SIZE - 1;
    751         int min_alloc_order = 3;
    752         int ret;
    753 
    754         begin = roundup(sh_memory->addr, PAGE_SIZE);
    755         end = rounddown(sh_memory->addr + sh_memory->size, PAGE_SIZE);
    756         paddr = begin;
    757         size = end - begin;
    758         va = devm_memremap(dev, paddr, size, MEMREMAP_WC);
--> 759         if (!va) {

This should be IS_ERR().

    760                 dev_err(dev, "fail to remap shared memory\n");
    761                 return ERR_PTR(-EINVAL);
    762         }

Older warnings to consider:

drivers/firmware/stratix10-svc.c:956 stratix10_svc_send() warn: inconsistent indenting
drivers/firmware/stratix10-svc.c:1233 stratix10_svc_drv_probe() warn: devm_ variable is still on list 'controller' (see line 1231)
    (use after free)

regards,
dan carpenter
