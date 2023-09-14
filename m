Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1487EEAA51
	for <kernel-janitors@archiver.kernel.org>; Thu, 14 Sep 2023 14:58:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240548AbjINO6S (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 14 Sep 2023 10:58:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240511AbjINO6R (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 14 Sep 2023 10:58:17 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A596F1FC7
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Sep 2023 07:58:13 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-404573e6c8fso7954665e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Sep 2023 07:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694703492; x=1695308292; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2iEXUo7L1L2P5qy8PSDyYpoZnAf2eRJf6as5S4xiefk=;
        b=y1snU6aU/DKFHF2N4+VZGpfqrZXfABHvndo5U5ckD7XOf/C7656klYza9k0L5ouAva
         mG1rQAvkIW2+L0Zig2im1S9eYm107WQmMfSJTHfZ6mWhYQwC8hI01qAeiRi969beVzz6
         QzqY2COJv3geJ0b7kjY/x+JArhnGs0DDT4OzleqD+P1/cq20CE7TqpYg8o6gjhAw1OGy
         vtUaVyhGo6L5oMXFRLpJ7NykMgrGE6tY88j/UU8HL9480IGne4qwvbS3Oe+EnboCQZ6f
         1EmO1tcz5ogfgg1l4nItpfe8+uVRiulP75e4XGD4bZE8mzZxDaHfaGWKvpV0gyMSbpFr
         s2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703492; x=1695308292;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2iEXUo7L1L2P5qy8PSDyYpoZnAf2eRJf6as5S4xiefk=;
        b=wRzZjRti8EJLi8IN/rJgUPVsJXWZrEQmJS8jE0CX+Ai1y1z6i100PgYfdbtp20VAQ4
         e4aRojDLRjGTwGbFY+ZAecF1gWf2Evl9cIqdy3cp+icmSvX8AuAWed9zqd4wupcKhkky
         g1Pv8aYn/UT9OiYxZeI+x/oePctXIMkFCec7DEGHi2z0LAsfc+y2zDVasARzqJyQ6vt1
         bkeOWw4SyxKvS7prhgs+aCU5MrSt7R40PNdZD9pUFARna0gqQgezP4/mgteHWztAlIyl
         0MIb3gupT/03mhrvHAa6oGoVFais8k/EZzYJ/pX1nc+qQfI9KGuRsqrJejjmkWHuXLOb
         Cepw==
X-Gm-Message-State: AOJu0YytlueNX6pZjIOGBZw14E3r3DhCSDoN+WTPNQoKmNOtlJ6kEeNa
        h0269TLTEwsqrXOxbYkqz8Ct7w==
X-Google-Smtp-Source: AGHT+IHrKtZ/aOiKDcUl1rJlvHU7nquOrPU1iyyQ8f7xYdDQH6xtSAmCVhQ6eMtaVRQwlG7SjR7yag==
X-Received: by 2002:a05:600c:3006:b0:404:34d3:6110 with SMTP id j6-20020a05600c300600b0040434d36110mr1938927wmh.0.1694703492065;
        Thu, 14 Sep 2023 07:58:12 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y6-20020a7bcd86000000b003fee6e170f9sm2183869wmj.45.2023.09.14.07.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 07:58:11 -0700 (PDT)
Date:   Thu, 14 Sep 2023 17:58:07 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Kent Overstreet <kent.overstreet@gmail.com>
Cc:     Kent Overstreet <kent.overstreet@linux.dev>,
        Brian Foster <bfoster@redhat.com>,
        linux-bcachefs@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 1/3] bcachefs: chardev: return -EFAULT if copy_to_user() fails
Message-ID: <6f3b0d3e-d20e-47fc-a3e5-4ad4c03d58b8@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The copy_to_user() function returns the number of bytes remaining but
we want to return -EFAULT to the user.

Fixes: e0750d947352 ("bcachefs: Initial commit")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/bcachefs/chardev.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/fs/bcachefs/chardev.c b/fs/bcachefs/chardev.c
index fb603df099a5..e5e9fddddfb5 100644
--- a/fs/bcachefs/chardev.c
+++ b/fs/bcachefs/chardev.c
@@ -149,9 +149,10 @@ static long bch2_global_ioctl(unsigned cmd, void __user *arg)
 static long bch2_ioctl_query_uuid(struct bch_fs *c,
 			struct bch_ioctl_query_uuid __user *user_arg)
 {
-	return copy_to_user(&user_arg->uuid,
-			    &c->sb.user_uuid,
-			    sizeof(c->sb.user_uuid));
+	if (copy_to_user(&user_arg->uuid, &c->sb.user_uuid,
+			 sizeof(c->sb.user_uuid)))
+		return -EFAULT;
+	return 0;
 }
 
 #if 0
@@ -338,7 +339,10 @@ static ssize_t bch2_data_job_read(struct file *file, char __user *buf,
 	if (len < sizeof(e))
 		return -EINVAL;
 
-	return copy_to_user(buf, &e, sizeof(e)) ?: sizeof(e);
+	if (copy_to_user(buf, &e, sizeof(e)))
+		return -EFAULT;
+
+	return sizeof(e);
 }
 
 static const struct file_operations bcachefs_data_ops = {
@@ -466,9 +470,11 @@ static long bch2_ioctl_fs_usage(struct bch_fs *c,
 	percpu_up_read(&c->mark_lock);
 	kfree(src);
 
-	if (!ret)
-		ret = copy_to_user(user_arg, arg,
-			sizeof(*arg) + arg->replica_entries_bytes);
+	if (ret)
+		goto err;
+	if (copy_to_user(user_arg, arg,
+			 sizeof(*arg) + arg->replica_entries_bytes))
+		ret = -EFAULT;
 err:
 	kfree(arg);
 	return ret;
@@ -513,7 +519,10 @@ static long bch2_ioctl_dev_usage(struct bch_fs *c,
 
 	percpu_ref_put(&ca->ref);
 
-	return copy_to_user(user_arg, &arg, sizeof(arg));
+	if (copy_to_user(user_arg, &arg, sizeof(arg)))
+		return -EFAULT;
+
+	return 0;
 }
 
 static long bch2_ioctl_read_super(struct bch_fs *c,
@@ -550,8 +559,9 @@ static long bch2_ioctl_read_super(struct bch_fs *c,
 		goto err;
 	}
 
-	ret = copy_to_user((void __user *)(unsigned long)arg.sb,
-			   sb, vstruct_bytes(sb));
+	if (copy_to_user((void __user *)(unsigned long)arg.sb, sb,
+			 vstruct_bytes(sb)))
+		ret = -EFAULT;
 err:
 	if (!IS_ERR_OR_NULL(ca))
 		percpu_ref_put(&ca->ref);
-- 
2.39.2

