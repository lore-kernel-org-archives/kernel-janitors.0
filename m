Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A11C4EB64DD
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 Jul 2023 14:56:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231436AbjGUO4I (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 21 Jul 2023 10:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231368AbjGUO4H (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 Jul 2023 10:56:07 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1000E52
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Jul 2023 07:56:05 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fb4146e8ceso17447615e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Jul 2023 07:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689951364; x=1690556164;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PdgB/8Mdj+WMRQMTY8Eob9XO/0oySgyQa+IdB3h1SB0=;
        b=hyy0efKZNjmh8mtbP9yAWof3TUqkjzoDZJMEeE7M0L1Qd72y+7wm2fyN7RLez0blvJ
         5gwjb6VibfFVsz5w6fLFXaGqRsJGs/7pQjMlVSC4Wb0MFarZyz1+DZZKtEHDN8JO7uLL
         BXP2nygnRO9Mtfcd1RpWtq0OK+y9dMM/BEooFhEVvts+a7DjxOa4Z5vUSW5uVFA6xVSr
         nCyNz25LdjAzwqkuuodpc1zrLNW7Dg+8eiqeCwvMJGPCsVh0v9oBOW4iKY8OHPCE0aLy
         mKiEofN+1vhMtPY8VjKsY4oTmjnh8ANvhQyaY1PeqpAkrAoagH9XmWAuWM4mbGBWPNAO
         DoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689951364; x=1690556164;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PdgB/8Mdj+WMRQMTY8Eob9XO/0oySgyQa+IdB3h1SB0=;
        b=Z9994bbtvfoUGvoBRVvj2u1x6r5h+7WQtwcHfCGJXXWtHUppBcss26o7aByZszjAF1
         mI+ihmOSZvX8FNF96fVdLKIova5WwNQkNzt75V/EU9J9pWErsmIK/oulmJSeoXwMPiQd
         djlUPySDVaJfxS6m73GjPnvbTOEsV9QgEeHPjXs3LSnigva6ebBe8NOhqwqPIvtvdWJC
         I2vIYRCKsaceOctALwot6E+GMFmlf2XV7yJw8ZTBh3WSRBHyDga5n1uPijKpPq1GPvTF
         kaaaJrIW6Yb8Bcllr4nciCglGzHEl8bufHX4R4Pjeuybx+oYxq0cro3DSO1jyij0GjWZ
         7ZdQ==
X-Gm-Message-State: ABy/qLZZQWgB0LbXfaSLIGE9XVAO4i5D2p8mieHgGXnQ0ucUHBMKRnk3
        cairkohefKYq/eTWYcl1Eelm5w==
X-Google-Smtp-Source: APBJJlHlQOwCswBArcGPCGQ9TMU8WVUrxCwe5fl8xM9nz3tmgKa2XxBuN+fT94mS2sz5g7pv6dEzfA==
X-Received: by 2002:a05:600c:2158:b0:3fc:2dfb:3cd3 with SMTP id v24-20020a05600c215800b003fc2dfb3cd3mr1525256wml.41.1689951364259;
        Fri, 21 Jul 2023 07:56:04 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i7-20020a05600c290700b003fbd597bccesm6174080wmd.41.2023.07.21.07.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 07:55:45 -0700 (PDT)
Date:   Fri, 21 Jul 2023 17:55:33 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Dimitris Papastamos <dp@opensource.wolfsonmicro.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] regmap: rbtree: Use alloc_flags for memory allocations
Message-ID: <58f12a07-5f4b-4a8f-ab84-0a42d1908cb9@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The kunit tests discovered a sleeping in atomic bug.  The allocations
in the regcache-rbtree code should use the map->alloc_flags instead of
GFP_KERNEL.

[    5.005510] BUG: sleeping function called from invalid context at include/linux/sched/mm.h:306
[    5.005960] in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 117, name: kunit_try_catch
[    5.006219] preempt_count: 1, expected: 0
[    5.006414] 1 lock held by kunit_try_catch/117:
[    5.006590]  #0: 833b9010 (regmap_kunit:86:(config)->lock){....}-{2:2}, at: regmap_lock_spinlock+0x14/0x1c
[    5.007493] irq event stamp: 162
[    5.007627] hardirqs last  enabled at (161): [<80786738>] crng_make_state+0x1a0/0x294
[    5.007871] hardirqs last disabled at (162): [<80c531ec>] _raw_spin_lock_irqsave+0x7c/0x80
[    5.008119] softirqs last  enabled at (0): [<801110ac>] copy_process+0x810/0x2138
[    5.008356] softirqs last disabled at (0): [<00000000>] 0x0
[    5.008688] CPU: 0 PID: 117 Comm: kunit_try_catch Tainted: G                 N 6.4.4-rc3-g0e8d2fdfb188 #1
[    5.009011] Hardware name: Generic DT based system
[    5.009277]  unwind_backtrace from show_stack+0x18/0x1c
[    5.009497]  show_stack from dump_stack_lvl+0x38/0x5c
[    5.009676]  dump_stack_lvl from __might_resched+0x188/0x2d0
[    5.009860]  __might_resched from __kmem_cache_alloc_node+0x1dc/0x25c
[    5.010061]  __kmem_cache_alloc_node from kmalloc_trace+0x30/0xc8
[    5.010254]  kmalloc_trace from regcache_rbtree_write+0x26c/0x468
[    5.010446]  regcache_rbtree_write from _regmap_write+0x88/0x140
[    5.010634]  _regmap_write from regmap_write+0x44/0x68
[    5.010803]  regmap_write from basic_read_write+0x8c/0x270
[    5.010980]  basic_read_write from kunit_try_run_case+0x48/0xa0

Fixes: 28644c809f44 ("regmap: Add the rbtree cache support")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Closes: https://lore.kernel.org/all/ee59d128-413c-48ad-a3aa-d9d350c80042@roeck-us.net/
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This patch is similar to what I sent earlier, but I changed
regcache_rbtree_init() back to using GFP_KERNEL.

 drivers/base/regmap/regcache-rbtree.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/base/regmap/regcache-rbtree.c b/drivers/base/regmap/regcache-rbtree.c
index fabf87058d80..ae6b8788d5f3 100644
--- a/drivers/base/regmap/regcache-rbtree.c
+++ b/drivers/base/regmap/regcache-rbtree.c
@@ -277,7 +277,7 @@ static int regcache_rbtree_insert_to_block(struct regmap *map,
 
 	blk = krealloc(rbnode->block,
 		       blklen * map->cache_word_size,
-		       GFP_KERNEL);
+		       map->alloc_flags);
 	if (!blk)
 		return -ENOMEM;
 
@@ -286,7 +286,7 @@ static int regcache_rbtree_insert_to_block(struct regmap *map,
 	if (BITS_TO_LONGS(blklen) > BITS_TO_LONGS(rbnode->blklen)) {
 		present = krealloc(rbnode->cache_present,
 				   BITS_TO_LONGS(blklen) * sizeof(*present),
-				   GFP_KERNEL);
+				   map->alloc_flags);
 		if (!present)
 			return -ENOMEM;
 
@@ -320,7 +320,7 @@ regcache_rbtree_node_alloc(struct regmap *map, unsigned int reg)
 	const struct regmap_range *range;
 	int i;
 
-	rbnode = kzalloc(sizeof(*rbnode), GFP_KERNEL);
+	rbnode = kzalloc(sizeof(*rbnode), map->alloc_flags);
 	if (!rbnode)
 		return NULL;
 
@@ -346,13 +346,13 @@ regcache_rbtree_node_alloc(struct regmap *map, unsigned int reg)
 	}
 
 	rbnode->block = kmalloc_array(rbnode->blklen, map->cache_word_size,
-				      GFP_KERNEL);
+				      map->alloc_flags);
 	if (!rbnode->block)
 		goto err_free;
 
 	rbnode->cache_present = kcalloc(BITS_TO_LONGS(rbnode->blklen),
 					sizeof(*rbnode->cache_present),
-					GFP_KERNEL);
+					map->alloc_flags);
 	if (!rbnode->cache_present)
 		goto err_free_block;
 
-- 
2.39.2

