Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79345E810DD
	for <kernel-janitors@archiver.kernel.org>; Wed, 27 Sep 2023 12:42:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231759AbjI0Mm3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 27 Sep 2023 08:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231760AbjI0Mm0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 27 Sep 2023 08:42:26 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4881196
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Sep 2023 05:42:20 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3247d69ed2cso622013f8f.0
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Sep 2023 05:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695818539; x=1696423339; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QIBJ2QQq1jKdag1JTrnfLgP1n2EQSK0YrgWY1MtytP4=;
        b=eRX3SliQFkAEze5Si9ueWEvCnNVCy9S00b0hQ6veiOV0kNAzJtOcJLC+LaeyFT7Mnz
         XtDylqJxuBOcuWqCTMCJX4IevYXXpqXFnvOgq+NU7qTQumD1nwNsYjFhjuEfXJ4TVLO9
         +fFbUizbI4oSsfSKNvZUEm/zKULmMjRyjVz96UMnIZ/OWy/e45ro1+983eo4Fg70Xsei
         sxvciEcoUpgaupJB+ywcfjDe9fizYrW+WrdSD4fHuHNOm7UPiq1LWkSv+dHNSpe+xL6W
         aitKtI2u4VGMfgS/BgVCvhwAn/TJ4B/ErzPQBY4Gze4moyjAOIBwRbAbpreZIyRiVCKL
         29zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695818539; x=1696423339;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QIBJ2QQq1jKdag1JTrnfLgP1n2EQSK0YrgWY1MtytP4=;
        b=HJfyCZMV+VtsF92gkEMs/Z06Cc4Poe9WbSQ6bkN22bmr8gPtg2ws7+zJxNSIaCSn+b
         Xv/m6TxzNiSJHKrDQrTbz0UQ1UdY6EJsYRW0ZnCAgGQf4bLo7v4JnzelfXB2zTKBerwa
         a4prpB3XSDBrmr+Zz7wwxRE9wUInkWEgzniMCJJehMXnoTnBwkIqkVjheVUFUA4lotid
         M5cZdUtT7BZO+hHnrBdKWCiqQK+LUvrpNxvk7ANn/vVkHKqe4WaaUKFxi+SxOOurx+7h
         cY0dI0BR5ZwywhhPeVikIHvEmF33d2bgIDXNoMFrNqvPwUeJK/8uaePLqkrTEK+0cPSc
         DCjQ==
X-Gm-Message-State: AOJu0Yz+qQg4PrmYrnrIvF7Dw5r0z0yzxDRCBCebOirGRExlOGQ5M9Aq
        8blLLhuEXSwMTH85VEok/1DuzdhVXgcSeewezuM=
X-Google-Smtp-Source: AGHT+IF6HCYIioOnRjDJklrGZ4R2tHqUEH85ijuDV/4H6WZD5v/n3LbiWH4vtT6fCmOudblOntF/Fg==
X-Received: by 2002:adf:f981:0:b0:320:8e6:b0cf with SMTP id f1-20020adff981000000b0032008e6b0cfmr1583649wrr.42.1695818538810;
        Wed, 27 Sep 2023 05:42:18 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g16-20020adfa490000000b003232380ffd5sm8992279wrb.106.2023.09.27.05.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 05:42:18 -0700 (PDT)
Date:   Wed, 27 Sep 2023 15:42:14 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     neilb@suse.de
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] lib: add light-weight queuing mechanism.
Message-ID: <8e9f5845-0d9c-4d50-b2e4-5c1cd622a71c@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello NeilBrown,

The patch 16c486356b1a: "lib: add light-weight queuing mechanism."
from Sep 11, 2023 (linux-next), leads to the following Smatch static
checker warning:

	lib/lwq.c:114 lwq_test()
	error: potential null dereference 't'.  (kmalloc returns null)

lib/lwq.c
    104         struct tnode *t;
    105         struct task_struct *threads[8];
    106 
    107         printk(KERN_INFO "testing lwq....\n");
    108         lwq_init(&q);
    109         printk(KERN_INFO " lwq: run some threads\n");
    110         for (i = 0; i < ARRAY_SIZE(threads); i++)
    111                 threads[i] = kthread_run(lwq_exercise, &q, "lwq-test-%d", i);
    112         for (i = 0; i < 100; i++) {
    113                 t = kmalloc(sizeof(*t), GFP_KERNEL);
--> 114                 t->i = i;
                        ^^^^
The kmalloc() isn't checked.

    115                 t->c = 0;
    116                 if (lwq_enqueue(&t->n, &q))
    117                         wake_up_var(&q);
 
regards,
dan carpenter
