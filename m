Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644B1EEAA51
	for <kernel-janitors@archiver.kernel.org>; Thu, 14 Sep 2023 14:58:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240632AbjINO7A (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 14 Sep 2023 10:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240593AbjINO7A (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 14 Sep 2023 10:59:00 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 711671FD4
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Sep 2023 07:58:55 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-402cc6b8bedso12056795e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Sep 2023 07:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694703534; x=1695308334; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FNIPC3eqRaM9UUjA9jC9vZgN57C88gn3jUcVe8mp0CA=;
        b=mz3R3Gexz/IDT6QMM7MKdRE4Q+CDlLB1G1dhYSnFNrTUYL3+cha/R29z6fJi+o8HPQ
         /zZuETj/h2g4Cx2TsPMgRPNFO/cXxPYdwF2kfj34RnQqRkF3ggr1RqAB0KSyPl3G9w63
         BdqXCuZI6oIoF2xqmssFZjXDxUn4cCnQBuM03WifwiVGhWipn3IQm2nZxwnEM2pDAkF1
         ++x3II57zzrAlUN/Yu2M4eQGFdhYL52eo46Rfnvolr8lEvAfGE9J+7iWlCkmVzL6/xBm
         li6Tr5vPGfQhe/q3AteXHwENUHXv2qJm3Z8Scg6LoJ+4qoMUp/PuPNF7+9SCkrGrutRp
         FtHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703534; x=1695308334;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FNIPC3eqRaM9UUjA9jC9vZgN57C88gn3jUcVe8mp0CA=;
        b=kAXArEY69kvRMF6OGKpUsXEpXUuz+fpxVLKd/ZJNeepq8ub07o8t5AwBAePqp3i7dD
         Kkn05aBPrl/kZnVAVUEuo08Mmuf6CHAE22/dpfQwSqubzvFX2X75ZZ3ME6zxc2lzA/X6
         k/myYsOG5moI53lG6U23VaUbV1b8woj6Ud+mOObkrqipgvrtnWiKCSerhm8ZA5MjDFF3
         grc+K4w3DlMQoQjFmvb3dboD3mbva7psjWm0+tk/DNjLljPD83doJgfVAWvSRFhfP5+b
         vL6naUkoqnpLmSqtwudKtmZtw26hIqcBpwHLOU8UP2Lhk8YOdnxq1WNKocxE1ROnkCWq
         ugPw==
X-Gm-Message-State: AOJu0Yxqz3jK3qI1A1USOa+8xWVtX3QEhsJ9GQpLe9ByeCGYqM0eDl4+
        FStHP4hMnP0K3sk0VNj4DdrcTg==
X-Google-Smtp-Source: AGHT+IH/4ma7ACywAK2Zx4/cAg6qKiu7TqRpTwZ5KbxhrvecfyZ7P60C/q9X2Ek5ab315P082ZzRnA==
X-Received: by 2002:a05:600c:21ca:b0:401:5443:5598 with SMTP id x10-20020a05600c21ca00b0040154435598mr5034388wmj.25.1694703533813;
        Thu, 14 Sep 2023 07:58:53 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n4-20020a1c7204000000b00402f713c56esm2189167wmc.2.2023.09.14.07.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 07:58:53 -0700 (PDT)
Date:   Thu, 14 Sep 2023 17:58:48 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Kent Overstreet <kent.overstreet@gmail.com>
Cc:     Kent Overstreet <kent.overstreet@linux.dev>,
        Brian Foster <bfoster@redhat.com>,
        linux-bcachefs@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 2/3] bcachefs: chardev: fix NULL vs IS_ERR() checks
Message-ID: <043689fd-b686-429f-a4bb-602c37578370@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f3b0d3e-d20e-47fc-a3e5-4ad4c03d58b8@moroto.mountain>
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The strndup_user() function returns error pointers on error.  It never
returns NULL.  Fix the checks including the commented out code.

Fixes: e0750d947352 ("bcachefs: Initial commit")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/bcachefs/chardev.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/bcachefs/chardev.c b/fs/bcachefs/chardev.c
index e5e9fddddfb5..5556bb2dc539 100644
--- a/fs/bcachefs/chardev.c
+++ b/fs/bcachefs/chardev.c
@@ -86,8 +86,8 @@ static long bch2_ioctl_assemble(struct bch_ioctl_assemble __user *user_arg)
 		devs[i] = strndup_user((const char __user *)(unsigned long)
 				       user_devs[i],
 				       PATH_MAX);
-		if (!devs[i]) {
-			ret = -ENOMEM;
+		if (IS_ERR(devs[i])) {
+			ret = PTR_ERR(devs[i]);
 			goto err;
 		}
 	}
@@ -117,8 +117,8 @@ static long bch2_ioctl_incremental(struct bch_ioctl_incremental __user *user_arg
 		return -EINVAL;
 
 	path = strndup_user((const char __user *)(unsigned long) arg.dev, PATH_MAX);
-	if (!path)
-		return -ENOMEM;
+	if (IS_ERR(path))
+		return PTR_ERR(path);
 
 	err = bch2_fs_open_incremental(path);
 	kfree(path);
@@ -189,8 +189,8 @@ static long bch2_ioctl_disk_add(struct bch_fs *c, struct bch_ioctl_disk arg)
 		return -EINVAL;
 
 	path = strndup_user((const char __user *)(unsigned long) arg.dev, PATH_MAX);
-	if (!path)
-		return -ENOMEM;
+	if (IS_ERR(path))
+		return PTR_ERR(path);
 
 	ret = bch2_dev_add(c, path);
 	kfree(path);
@@ -231,8 +231,8 @@ static long bch2_ioctl_disk_online(struct bch_fs *c, struct bch_ioctl_disk arg)
 		return -EINVAL;
 
 	path = strndup_user((const char __user *)(unsigned long) arg.dev, PATH_MAX);
-	if (!path)
-		return -ENOMEM;
+	if (IS_ERR(path))
+		return PTR_ERR(path);
 
 	ret = bch2_dev_online(c, path);
 	kfree(path);
-- 
2.39.2

