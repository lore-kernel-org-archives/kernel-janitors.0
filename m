Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C368EEB64DD
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 Jul 2023 14:57:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbjGUO5M (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 21 Jul 2023 10:57:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjGUO5L (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 Jul 2023 10:57:11 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16705F0
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Jul 2023 07:57:10 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fc0aecf107so16965615e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Jul 2023 07:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689951428; x=1690556228;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f2neACeDJ1+U5hIJSVUczEa3DOnNyGY7zXGD+yxpeF8=;
        b=QzPiB2fuOh3QbLglcuzUYmvpmwOadloHNR7KNKK4YP99C1z0LBvNqNC4tejkfjEbwF
         iQ9wuiCxVxESyxtmOyPi4jyorV8tlAaH95aMiogz4/TGd0yYFwvf3dqKpPow5DgOQEE3
         xb4cXBZoaP1waE/hWOoJPs8VS30z7Kor+mIoP1OpwyZsN31Dc8xVYSUwRNCD6tU76LiB
         sbxezuv/I5ZEjFuanb8Ek+cconJ5Rj0IrnmJqV+XeZZBZ3SdvUgYcDQUKLRcavSzXB6v
         C528YcUr3YO+1axe9o+kY7r7HGVLsu7rNnkbZjlo9kmX4w+DAvIzWAswnTKbgGi3y4Q+
         mqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689951428; x=1690556228;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f2neACeDJ1+U5hIJSVUczEa3DOnNyGY7zXGD+yxpeF8=;
        b=bzTw/qHGbJIZ/uuT6IL9+hGUwmHptJw1/gSAWkQIKML0K4KDYF1p2eexk89F1Eu3pL
         P5sGf8gc8oWQ5hdkmBJozyz+7xTYhtMg6M9TLCdfCuRmZreW17rX6UU3k0kIiGjDd8On
         kFupAy5T8Jm3z8tRvWWFu+Nc0ASP08vJE397Sgkei517IU9GFzrPb9WhDCmaiL5UrigY
         08cZHUQaqqNJI5py8kigAoWXJbhRCp6eT41PRH6xH/xrCHjTuGF/93NGPMc+F2jGJzG8
         eiucs0vt5hMeA3PL8cLIsriKMpTxJML8plgreaZYnuEGviZl3bHcdFbqlmwW5kmJV6je
         2uNQ==
X-Gm-Message-State: ABy/qLZoJthgSqVFXftdSZov55do6TpBwxTgUv1wtTKm4G+FrYPVzq1j
        j2qOewJREiOFEHOZycbq8UOSug==
X-Google-Smtp-Source: APBJJlGq/aGXjkznIOcKk++s4dtisq1UBY7w99M0yyYBzEt+liwyMDx2zN7betLEG6qstAAeZxjK1A==
X-Received: by 2002:a1c:7903:0:b0:3fb:ab7d:ad95 with SMTP id l3-20020a1c7903000000b003fbab7dad95mr1608352wme.4.1689951428639;
        Fri, 21 Jul 2023 07:57:08 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e19-20020a05600c219300b003fbe791a0e8sm3469484wme.0.2023.07.21.07.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 07:57:06 -0700 (PDT)
Date:   Fri, 21 Jul 2023 17:57:00 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Michal Hocko <mhocko@suse.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Mel Gorman <mgorman@suse.de>, Vlastimil Babka <vbabka@suse.cz>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] lib/string_helpers: Use passed in GFP_ flags
Message-ID: <df051844-0a73-4cf9-9719-a6001f1c9d5c@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This patch doesn't affect runtime because all the callers pass GFP_KERNEL
as the allocation flags.  However, it should use the passed in "gfp" as
the allocation flags.

Fixes: 0ee931c4e31a ("mm: treewide: remove GFP_TEMPORARY allocation flag")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 lib/string_helpers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/string_helpers.c b/lib/string_helpers.c
index d3b1dd718daf..be517c25737d 100644
--- a/lib/string_helpers.c
+++ b/lib/string_helpers.c
@@ -668,7 +668,7 @@ char *kstrdup_quotable_cmdline(struct task_struct *task, gfp_t gfp)
 	char *buffer, *quoted;
 	int i, res;
 
-	buffer = kmalloc(PAGE_SIZE, GFP_KERNEL);
+	buffer = kmalloc(PAGE_SIZE, gfp);
 	if (!buffer)
 		return NULL;
 
@@ -704,7 +704,7 @@ char *kstrdup_quotable_file(struct file *file, gfp_t gfp)
 		return kstrdup("<unknown>", gfp);
 
 	/* We add 11 spaces for ' (deleted)' to be appended */
-	temp = kmalloc(PATH_MAX + 11, GFP_KERNEL);
+	temp = kmalloc(PATH_MAX + 11, gfp);
 	if (!temp)
 		return kstrdup("<no_memory>", gfp);
 
-- 
2.39.2

