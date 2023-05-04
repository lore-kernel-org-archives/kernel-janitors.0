Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A647AC77B7C
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 May 2023 07:35:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230112AbjEDHfa (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 4 May 2023 03:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbjEDHfE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 4 May 2023 03:35:04 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 105DEA9
        for <kernel-janitors@vger.kernel.org>; Thu,  4 May 2023 00:34:52 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f19afc4fbfso1130905e9.2
        for <kernel-janitors@vger.kernel.org>; Thu, 04 May 2023 00:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683185688; x=1685777688;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Za+jysiocl3gVmRTjG+aEvTv3Xef3mrr/GUrOSxgNFQ=;
        b=UA+1uagHCa2dUxEAngNnr9PBevBl9xnEFXiyojr+4xb2NzG+HqjvPB+pY8EMCaNuoC
         ILChyffJcUTMPrzYZkC6uQpFi8XiFhYTJ4JnODDnvXSuAsvXVc3iWDc/RCNAGsnPL5Ht
         1IAs13MCroOBTDOJKITc4di5afYGVkzBE9jmMoL1/B6wvHO+m6J6KG04yRWA4WTaXxBz
         MqIsChGwVBiaQuJxQ3RbG7ZgUietadBh0+k/2oV6HJ3f86+wjEcLS1MSSYubdHONYcYu
         xnM3QKP2BBdOsEioOAYKq/1+VnQD1Ayv/iExlD/wnhupEJSthTeczZUxontw7BrCfzx0
         oK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683185688; x=1685777688;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Za+jysiocl3gVmRTjG+aEvTv3Xef3mrr/GUrOSxgNFQ=;
        b=i89/9V+R6zEsuuuI6XouwYLNUgRP/at3QvbYXPpqO62HvIuM6Ff3DQ3voT3BqYq1qK
         XKloFsJJvXMEeymlXcOiNZ9L9zXzIOumR+yLUe9OWi/ND4RVm5jx8qLtOCSBofdcZAIw
         r34s3Vtm6mkqY6T1+0x8ViZQxL19w/STHkJyP5Ye2yh3dkIxuATXROfZ9fjFaDiJprAm
         N2Fa63XePX5Li34iEmR3u2M0+zI5SqPJ6aSSCzNTjwnxrFieweEhfajw25MvHHZkakvn
         f3IDTs5DqZEJ4SXI++fUnHaIzo4kZaRv+yxWYn/gATNiCphVg5OmuE9ZcEwQ9iGhF/et
         rHqg==
X-Gm-Message-State: AC+VfDx+e9Hl1aOa344Q/uUHsfVoSURMqw9XvwT4IcyaFpFiCp+0qCTI
        avBg2XdaE/CxlVAXla6OQGoJBQ==
X-Google-Smtp-Source: ACHHUZ7IG60nK06WtdV7ny6cSZssVT0FLQ0wkqxxlBboPx7IS4Js7H8Gcbv2gbzBStRg0C6b9o32FQ==
X-Received: by 2002:a1c:7203:0:b0:3f1:7b8d:38ec with SMTP id n3-20020a1c7203000000b003f17b8d38ecmr15861433wmc.35.1683185687734;
        Thu, 04 May 2023 00:34:47 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j37-20020a05600c1c2500b003f173be2ccfsm2105697wms.2.2023.05.04.00.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 00:34:45 -0700 (PDT)
Date:   Thu, 4 May 2023 10:34:25 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     Kefeng Wang <wangkefeng.wang@huawei.com>,
        Hanjun Guo <hanjun.guo@linaro.org>,
        Ma Jun <majun258@huawei.com>,
        Ming Lei <ming.lei@canonical.com>,
        kernel-janitors@vger.kernel.org
Subject: [bug report] irqchip/mbigen: move to use bus_get_dev_root()
Message-ID: <adb006bb-1352-4e9d-a763-66c0ac778201@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Greg Kroah-Hartman,

The patch fea087fc291b: "irqchip/mbigen: move to use
bus_get_dev_root()" from Mar 13, 2023, leads to the following Smatch
static checker warning:

	drivers/irqchip/irq-mbigen.c:258 mbigen_of_create_domain()
	error: potentially dereferencing uninitialized 'child'.

drivers/irqchip/irq-mbigen.c
    235 static int mbigen_of_create_domain(struct platform_device *pdev,
    236                                    struct mbigen_device *mgn_chip)
    237 {
    238         struct device *parent;
    239         struct platform_device *child;
    240         struct irq_domain *domain;
    241         struct device_node *np;
    242         u32 num_pins;
    243 
    244         for_each_child_of_node(pdev->dev.of_node, np) {
    245                 if (!of_property_read_bool(np, "interrupt-controller"))
    246                         continue;
    247 
    248                 parent = bus_get_dev_root(&platform_bus_type);
    249                 if (parent) {

Smatch is concerned that "parent" can be NULL.  Probably unlikely in
real life.

    250                         child = of_platform_device_create(np, NULL, parent);
    251                         put_device(parent);
    252                         if (!child) {
    253                                 of_node_put(np);
    254                                 return -ENOMEM;
    255                         }
    256                 }
    257 
--> 258                 if (of_property_read_u32(child->dev.of_node, "num-pins",
    259                                          &num_pins) < 0) {
    260                         dev_err(&pdev->dev, "No num-pins property\n");
    261                         of_node_put(np);
    262                         return -EINVAL;
    263                 }
    264 
    265                 domain = platform_msi_create_device_domain(&child->dev, num_pins,
    266                                                            mbigen_write_msg,
    267                                                            &mbigen_domain_ops,
    268                                                            mgn_chip);
    269                 if (!domain) {
    270                         of_node_put(np);
    271                         return -ENOMEM;
    272                 }
    273         }
    274 
    275         return 0;
    276 }

regards,
dan carpenter
