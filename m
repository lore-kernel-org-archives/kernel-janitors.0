Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B7EC4332F
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Nov 2022 13:18:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231179AbiKONSD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Nov 2022 08:18:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbiKONSC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Nov 2022 08:18:02 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88F2ABA
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 05:18:01 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id d9so19497519wrm.13
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 05:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=32WBdWindzYkRQPyKNqul2HsVZ2WHHBBZ42i1GfzKfg=;
        b=Uk5AIJ2jGutEfsCFFipQ0TeMHtnly4OV7G++5S4n1ekM616a0eHAiWRfGNJ9L1CXQI
         474pLCydb4/m9SpkjgbO/FUmR8X8qM8bpKP8GUN1scyd7w5gP5+XSDNMrLm+nyor7YyJ
         ThjC5OBKKYpHfSGfK+/MwlvEMyKqs18EBDrVAJLlW7xb66qV4N1QhnkCWhIVA36THT3T
         m53EuVTQ28dfYWzEyfO0KUv28aFPRtr0a/hrAHHlBf5JYLOvEbzA9TygVtNk1sU1kFny
         bnOJnqnp2QO+WClpPy9omnJz7NllNu2sqKRP3rkxxMa+oQ4PaZDXqjhhCYRj9zsDk4bm
         AlmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=32WBdWindzYkRQPyKNqul2HsVZ2WHHBBZ42i1GfzKfg=;
        b=pWKJHMXG1TL6R/WFg0p297R2qIIxE2Nx+C9Hun74bfs2fZ0wsAK4V7TIrHy3lUH0Cd
         rk6/lBf1SjN+m2lun3urIlvHAqFLDq/WKTpkjDCnRx9zc9FPjHtJnJVIy94OxHET7OrE
         T3OqpJ6YwsyN+46OXO0FsmkRhTKb9YKTBGTPyKsGrSLKJMSNitsIX35bme91PrRz7go1
         /J6wbF4FcjTGGQRKUnnin5ieOCMM7OeenoB3S707WhV11LTb0T0SeSEUv2r+FOyqUYhn
         7ERzp1Tr96EYbI7AyRr+rir4L1YeXbgoeRHbxIhFJg4PHneOIf2lGTmusfOj3c7WWzvt
         GCZw==
X-Gm-Message-State: ANoB5pnErCLBq3B5pqMvRu28rMkZ2l069UeIE6TwG0G2sKbgFtjJP7CO
        vZcswISjudZCe49aN0wOVg4=
X-Google-Smtp-Source: AA0mqf6EIhSWqOEQIeGuql5Cx1k3ZnPQKFm4EsFzP6T2DmbYB0hDfW3jXzOtU31zizcdJJJnVx6slA==
X-Received: by 2002:adf:f009:0:b0:236:657e:757e with SMTP id j9-20020adff009000000b00236657e757emr10793278wro.350.1668518280018;
        Tue, 15 Nov 2022 05:18:00 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bv13-20020a0560001f0d00b0022cce7689d3sm9008646wrb.36.2022.11.15.05.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 05:17:59 -0800 (PST)
Date:   Tue, 15 Nov 2022 16:17:56 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Matt Porter <mporter@kernel.crashing.org>,
        Alexandre Bounine <alex.bou9@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] rapidio: add mport char device driver
Message-ID: <Y3N/EaYqACc7bPCc@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Alexandre Bounine,

The patch e8de370188d0: "rapidio: add mport char device driver" from
Mar 22, 2016, leads to the following Smatch static checker warning:

	drivers/rapidio/devices/rio_mport_cdev.c:2185 mport_mm_close()
	error: dereferencing freed memory 'map'

drivers/rapidio/devices/rio_mport_cdev.c
    2178 static void mport_mm_close(struct vm_area_struct *vma)
    2179 {
    2180         struct rio_mport_mapping *map = vma->vm_private_data;
    2181 
    2182         rmcd_debug(MMAP, "%pad", &map->phys_addr);
    2183         mutex_lock(&map->md->buf_mutex);
    2184         kref_put(&map->ref, mport_release_mapping);
                                     ^^^^^^^^^^^^^^^^^^^^^
The mport_release_mapping() function frees "map".

--> 2185         mutex_unlock(&map->md->buf_mutex);
                               ^^^
Use after free.

    2186 }

regards,
dan carpenter

