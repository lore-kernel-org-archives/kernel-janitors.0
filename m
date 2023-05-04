Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E6CC77B78
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 May 2023 14:47:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbjEDOrJ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 4 May 2023 10:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbjEDOrI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 4 May 2023 10:47:08 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 294BC2690
        for <kernel-janitors@vger.kernel.org>; Thu,  4 May 2023 07:47:06 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3063208beedso546426f8f.1
        for <kernel-janitors@vger.kernel.org>; Thu, 04 May 2023 07:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683211624; x=1685803624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C1I3DSjsSNYlsgzH11D/TTIgeogMWeLb08iBDcbJ4bw=;
        b=CuCK4JQE4rW5Ugt6OLPd4QcQkz27wftD/iFdDXPCR1mUz+fHKxrGsnWGCAIxFsGt43
         vv7YJKSU1ujJgqdCojuCleuENeeKVNPeeudh18iOgEGbGJefKWe58qg1mjcOvgwx9IHH
         KGw3TGMI9KUFmXw1D5mix3TkySM5/KEMy3oWHRT7HH7C0uaLYK9qFLWhzMesuQHGTf5+
         WNodCnGpp+Fl/3dX4plHspqFr+6mPpghaxHvUuw5G60WXwpQF4nvvBb+9D59QeIOBh6C
         2z+1UdCQ4pdfJo1oE99QIv19TtWinc3BDGJtWTLu1W/TIWk3dtcILiEB0pZkhvUqBVBV
         evnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683211624; x=1685803624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1I3DSjsSNYlsgzH11D/TTIgeogMWeLb08iBDcbJ4bw=;
        b=ReM25ASGomxXwLN51j6SkW9cjBVRVQ3OiOh5n4pkG6Xh+77dtPW3QO0iOczMuNMyi9
         VGZwdCHtL12pU9sp37/Fhd85Vs0fG8KG6o1s+h2i76WPIONyTBsjivqggVKj6ab1EAwy
         l3MLQquT5DU9B8BJbvML1PuzhEBaJnWbwOkFvYTZXU3fNHEoCsNLLN8zCBoS0HNEWJ5g
         YcopvgZ5v3xvffhsz7kZyQkgKmyCCPMpcLpP/+ipdnOY7IUZlnW05jobVELHtob134kQ
         dWwQ/sWQSYquw5l6uhtM9VjaeozHgQeTp7GLH6TMb/PuzhB2IN3PRjzRvwghHiDL8KE5
         WhfA==
X-Gm-Message-State: AC+VfDySmx4Bf29baICrybbnEJVUfnydjWm979D05z1cBgI3N7hxCrAi
        7lf32EkyPLo6qPCpr5jwFMtxPQ==
X-Google-Smtp-Source: ACHHUZ6pL/zqPTCpXpoNP47bfRVyDww7viHf5+XPXSGqCOMMxZUVK2EyHn8/VpwBDtMGA4DCf6w/PA==
X-Received: by 2002:adf:e908:0:b0:306:32be:f0fe with SMTP id f8-20020adfe908000000b0030632bef0femr2823132wrm.67.1683211624616;
        Thu, 04 May 2023 07:47:04 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e2-20020a056000120200b00306281cfa59sm13603415wrx.47.2023.05.04.07.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 07:47:03 -0700 (PDT)
Date:   Thu, 4 May 2023 17:46:31 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Kefeng Wang <wangkefeng.wang@huawei.com>
Cc:     gregkh@linuxfoundation.org, Hanjun Guo <hanjun.guo@linaro.org>,
        Ma Jun <majun258@huawei.com>,
        Ming Lei <ming.lei@canonical.com>,
        kernel-janitors@vger.kernel.org
Subject: Re: [bug report] irqchip/mbigen: move to use bus_get_dev_root()
Message-ID: <08ee85b9-67cd-485a-9f1d-61d92aad6204@kili.mountain>
References: <adb006bb-1352-4e9d-a763-66c0ac778201@kili.mountain>
 <5154e620-7638-8bdd-a261-83ee7d5adfe5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5154e620-7638-8bdd-a261-83ee7d5adfe5@huawei.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, May 04, 2023 at 07:56:07PM +0800, Kefeng Wang wrote:
> 
> 
> On 2023/5/4 15:34, Dan Carpenter wrote:
> > Hello Greg Kroah-Hartman,
> > 
> > The patch fea087fc291b: "irqchip/mbigen: move to use
> > bus_get_dev_root()" from Mar 13, 2023, leads to the following Smatch
> > static checker warning:
> > 
> > 	drivers/irqchip/irq-mbigen.c:258 mbigen_of_create_domain()
> > 	error: potentially dereferencing uninitialized 'child'.
> > 
> > drivers/irqchip/irq-mbigen.c
> >      235 static int mbigen_of_create_domain(struct platform_device *pdev,
> >      236                                    struct mbigen_device *mgn_chip)
> >      237 {
> >      238         struct device *parent;
> >      239         struct platform_device *child;
> >      240         struct irq_domain *domain;
> >      241         struct device_node *np;
> >      242         u32 num_pins;
> >      243
> >      244         for_each_child_of_node(pdev->dev.of_node, np) {
> >      245                 if (!of_property_read_bool(np, "interrupt-controller"))
> >      246                         continue;
> >      247
> >      248                 parent = bus_get_dev_root(&platform_bus_type);
> >      249                 if (parent) {
> > 
> > Smatch is concerned that "parent" can be NULL.  Probably unlikely in
> > real life.
> 
> How about move bus_get_dev_root() out of the loop.
> 

Sounds good to me, but I don't know this code at all.

regards,
dan carpenter

