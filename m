Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D43ECC678D5
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Mar 2023 16:06:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231551AbjCGQGL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 7 Mar 2023 11:06:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231936AbjCGQF0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Mar 2023 11:05:26 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C18468EA1A
        for <kernel-janitors@vger.kernel.org>; Tue,  7 Mar 2023 08:03:45 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id da10so54342559edb.3
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Mar 2023 08:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678205024;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VZAm6ydS7TXil5LlGwkdeGZUIC50GZnaw8yGS7Nv6zM=;
        b=aR6h5ZHSTbUDCvnC9HUACvvGE2dfGtPxZwV4tUAHBKePaM+QUBLu2sHBtiGN8By5G+
         3m5xl23JZx2JXpDBkjCjz4V1XoHNdXudwYwv4x/NvnkRLE0ONvTDhBZww6uwoeEyWJ2J
         LoWDcSg7sbH6eFqG55Ilaxi0LwaKxUyZ/u7EB81XAhBdwOZ8QNxB6L4/woZF/9axxDhV
         moDEAXX+ClkPSycbtrBq8lZHpN5GslQwJ8D+ifThRu6hHigl7J7ursc8EqBFxwoiAzEL
         I/E39xe8L6lPS8Aq0lpyl0d1kC16mtx7FCc2nuuDgiipAmr8rqfMu4M6pkbsawVJO5PB
         GE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678205024;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VZAm6ydS7TXil5LlGwkdeGZUIC50GZnaw8yGS7Nv6zM=;
        b=it3iUBjUkD8Xh5yZRd+7IUbOz0Ql3YcLdwRbXDDEFnQVgrbURtYEsSx0B78O0+61F3
         2PL+pejUgsCgdQVdGkiy5twFyoSGd4kQeVSa6AuYUN3aYk4H5ajMJz4Wt2Y56BkiWDTd
         nTQ5Xmb4S45ZL4KTwmG1YoGTKgc/g5SRT9YhELq5zmHUnpaEB9e0VBVYWSqCa9ZUAIbk
         1M3s3lMPj8GNUrQ+G39qXIlUHM9+8VgbU/7IPPCywm1S0RFMwUFnP8YhR8ICn0dNOVjO
         be7E4FT64yLtiZdGnLnrs6UyRDIW47vPqM5KLm9B2WX92YrKD87uij+P/Lu+Z1tgFShn
         9POQ==
X-Gm-Message-State: AO0yUKWbWnY2vb9ZhxJRRGxo9ULaKEbj148W/swvxHkTEW4LqL0/qjd/
        xPNMqRYYTxMNra8pWBki0Dgayghf9b0=
X-Google-Smtp-Source: AK7set9G/+gkZb7DIMSLZenJL7LTJeQk53LJfoOmy37vzHkxL8PL9v0rqOoSvqOsazCLP6O3WZ8I+w==
X-Received: by 2002:a17:906:edb3:b0:907:80e6:f8af with SMTP id sa19-20020a170906edb300b0090780e6f8afmr14501393ejb.67.1678205024310;
        Tue, 07 Mar 2023 08:03:44 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i9-20020a1709063c4900b008d427df3245sm6321231ejg.58.2023.03.07.08.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 08:03:43 -0800 (PST)
Date:   Tue, 7 Mar 2023 19:03:40 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     shayd@nvidia.com
Cc:     kernel-janitors@vger.kernel.org, Saeed Mahameed <saeedm@nvidia.com>
Subject: [bug report] net/mlx5: Change IRQ storage logic from static to
 dynamic
Message-ID: <025ad61d-9b88-4d52-9615-b22d439a2c57@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Shay Drory,

The patch fc63dd2a85be: "net/mlx5: Change IRQ storage logic from
static to dynamic" from Feb 23, 2021, leads to the following Smatch
static checker warning:

	drivers/net/ethernet/mellanox/mlx5/core/eq.c:1010 mlx5_comp_irq_get_affinity_mask()
	warn: iterator used outside loop: 'eq'

drivers/net/ethernet/mellanox/mlx5/core/eq.c
    1000 {
    1001         struct mlx5_eq_table *table = dev->priv.eq_table;
    1002         struct mlx5_eq_comp *eq;
    1003         int i = 0;
    1004 
    1005         list_for_each_entry(eq, &table->comp_eqs_list, list) {
                                     ^^^
    1006                 if (i++ == vector)
    1007                         break;
    1008         }
    1009 
--> 1010         return mlx5_irq_get_affinity_mask(eq->core.irq);
                                                   ^^^^

I mean probably this function can never fail to find the appropriate
vector and all but generally we are trying to get rid of this business
of using the iterator outside the loop.  Eventually we'll create a
list_for_each_entry() which will not compile with this kind of code.

    1011 }

regards,
dan carpenter
