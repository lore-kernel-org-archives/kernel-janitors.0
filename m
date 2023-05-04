Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F2FC7EE23
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 May 2023 11:56:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbjEDL4P (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 4 May 2023 07:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbjEDL4O (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 4 May 2023 07:56:14 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 589525BB3
        for <kernel-janitors@vger.kernel.org>; Thu,  4 May 2023 04:56:11 -0700 (PDT)
Received: from dggpemm500001.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4QBsbv4rKkzTk7V;
        Thu,  4 May 2023 19:51:39 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 19:56:08 +0800
Message-ID: <5154e620-7638-8bdd-a261-83ee7d5adfe5@huawei.com>
Date:   Thu, 4 May 2023 19:56:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [bug report] irqchip/mbigen: move to use bus_get_dev_root()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        <gregkh@linuxfoundation.org>
CC:     Hanjun Guo <hanjun.guo@linaro.org>, Ma Jun <majun258@huawei.com>,
        Ming Lei <ming.lei@canonical.com>,
        <kernel-janitors@vger.kernel.org>
References: <adb006bb-1352-4e9d-a763-66c0ac778201@kili.mountain>
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <adb006bb-1352-4e9d-a763-66c0ac778201@kili.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 2023/5/4 15:34, Dan Carpenter wrote:
> Hello Greg Kroah-Hartman,
> 
> The patch fea087fc291b: "irqchip/mbigen: move to use
> bus_get_dev_root()" from Mar 13, 2023, leads to the following Smatch
> static checker warning:
> 
> 	drivers/irqchip/irq-mbigen.c:258 mbigen_of_create_domain()
> 	error: potentially dereferencing uninitialized 'child'.
> 
> drivers/irqchip/irq-mbigen.c
>      235 static int mbigen_of_create_domain(struct platform_device *pdev,
>      236                                    struct mbigen_device *mgn_chip)
>      237 {
>      238         struct device *parent;
>      239         struct platform_device *child;
>      240         struct irq_domain *domain;
>      241         struct device_node *np;
>      242         u32 num_pins;
>      243
>      244         for_each_child_of_node(pdev->dev.of_node, np) {
>      245                 if (!of_property_read_bool(np, "interrupt-controller"))
>      246                         continue;
>      247
>      248                 parent = bus_get_dev_root(&platform_bus_type);
>      249                 if (parent) {
> 
> Smatch is concerned that "parent" can be NULL.  Probably unlikely in
> real life.

How about move bus_get_dev_root() out of the loop.

diff --git a/drivers/irqchip/irq-mbigen.c b/drivers/irqchip/irq-mbigen.c
index eada5e0e3eb9..954a55ed1f2b 100644
--- a/drivers/irqchip/irq-mbigen.c
+++ b/drivers/irqchip/irq-mbigen.c
@@ -240,26 +240,25 @@ static int mbigen_of_create_domain(struct 
platform_device *pdev,
  	struct irq_domain *domain;
  	struct device_node *np;
  	u32 num_pins;
+	int ret = -ENODEV;
+
+	parent = bus_get_dev_root(&platform_bus_type);
+	if (!parent)
+		return ret;

  	for_each_child_of_node(pdev->dev.of_node, np) {
  		if (!of_property_read_bool(np, "interrupt-controller"))
  			continue;

-		parent = bus_get_dev_root(&platform_bus_type);
-		if (parent) {
-			child = of_platform_device_create(np, NULL, parent);
-			put_device(parent);
-			if (!child) {
-				of_node_put(np);
-				return -ENOMEM;
-			}
-		}
+		child = of_platform_device_create(np, NULL, parent);
+		if (!child)
+			goto out_put;

  		if (of_property_read_u32(child->dev.of_node, "num-pins",
  					 &num_pins) < 0) {
  			dev_err(&pdev->dev, "No num-pins property\n");
-			of_node_put(np);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto out_put;
  		}

  		domain = platform_msi_create_device_domain(&child->dev, num_pins,
@@ -267,12 +266,17 @@ static int mbigen_of_create_domain(struct 
platform_device *pdev,
  							   &mbigen_domain_ops,
  							   mgn_chip);
  		if (!domain) {
-			of_node_put(np);
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto out_put;
  		}
  	}

  	return 0;
+
+out_put:
+	of_node_put(np);
+	put_device(parent);
+	return ret;
  }




> 
> regards,
> dan carpenter
