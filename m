Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B49C63797
	for <kernel-janitors@archiver.kernel.org>; Tue, 17 Jan 2023 14:18:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbjAQOSE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 17 Jan 2023 09:18:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230304AbjAQOSC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 17 Jan 2023 09:18:02 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE3DF32525
        for <kernel-janitors@vger.kernel.org>; Tue, 17 Jan 2023 06:18:01 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id q8so10554861wmo.5
        for <kernel-janitors@vger.kernel.org>; Tue, 17 Jan 2023 06:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V/31Zx3eFGec3nVJb1oXQa8scv6g71AJ2XVF1SMXsjo=;
        b=JsENXzV6Lcf38ecr6c11Q6jS0Qc0Xz4sxWJ8XXr9w+6I6yQYTFU/kD3TYBqxQ7rv7+
         PAt5XdD25KohEDXfAc3mZ9slNyHRsZLQ8xqy6sBjF1v6p85u3eg16Lu8MJzqMfU42WDB
         o6vxwbyQRB/5fGDaDckdJ6GNPSwzvBL8prscTe0JDAvHLcN/pCtmLskKBZjwYPIOCt1l
         Lmnw+kuZqIQG9nC3Elv2Ot5kC3jIs8/cunsn38HEUu4oyuSEdBKKb7WVar4L0fDhvWZa
         wsEOrNQ5b16T47/LLxgPHFFSoQAJX3KZuutYb/DCXYfmwLd1CTizC2qTbr514ZS9xC7a
         PEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V/31Zx3eFGec3nVJb1oXQa8scv6g71AJ2XVF1SMXsjo=;
        b=Vnt7AVlxX6yvsprQlDJUPSO12OT1q1KMrLD5Xhzstj7BPZqB7xW4hpI6/E9SqtGhws
         Pau7b+VZcEdKqzpGESe02fQjIkWfmMocROjElRvaC0zCPuOwajywZvpS0Q5VopOLiWf6
         qV0ReFgEO+hsq9qiuAfycLdkB3ThTmBPzCHK3TiQ2IdrbFqU3skbHDyVduW0DR3iHLxG
         8mooJdTGoXp75gmdgep5KOPaxIHqUfbghwk+Mqih24V5DnpmDFk5u2nBkmt2mKudmZEb
         mHKGEODyKRbfuCqciNLIEj8uOfFRC9QArph/EeWXyldaCIeM0ITnvpWBklKvZq9nnIBk
         y6Bw==
X-Gm-Message-State: AFqh2kruy+kShmDlywn1+a+CWZCUibg9y3yj3+jaJFnd8Yuo2tRknMGL
        ut05d3W/qUlNUEtVXJa6yGE=
X-Google-Smtp-Source: AMrXdXv13PeROVeFKbk7cnsb5gc6/H/L0Wzq8HMm9OUe+9N3rMROib28v6Y7pnDQc+irUC7Ne1v3JQ==
X-Received: by 2002:a05:600c:2d05:b0:3d0:85b5:33d3 with SMTP id x5-20020a05600c2d0500b003d085b533d3mr3164709wmf.16.1673965080509;
        Tue, 17 Jan 2023 06:18:00 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l24-20020a05600c1d1800b003daf6e3bc2fsm11093626wms.1.2023.01.17.06.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 06:18:00 -0800 (PST)
Date:   Tue, 17 Jan 2023 17:17:29 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc:     Clemens Ladisch <clemens@ladisch.de>,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] ALSA: fireface: fix locking bug in ff400_copy_msg_to_user()
Message-ID: <Y8at+W/7OGvEBY8O@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The ff400_copy_msg_to_user() function drops the spin lock to call
copy_to_user().  However, if the copy_to_user() fails, then it must
take the lock again before returning.  Failure to take the lock leads
to a double unlock in the caller, hwdep_read().

Fixes: acdebd8b4c0c ("ALSA: fireface: implement message parser for Fireface 400")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 sound/firewire/fireface/ff-protocol-former.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/firewire/fireface/ff-protocol-former.c b/sound/firewire/fireface/ff-protocol-former.c
index f58008762fe6..fa41de978756 100644
--- a/sound/firewire/fireface/ff-protocol-former.c
+++ b/sound/firewire/fireface/ff-protocol-former.c
@@ -680,28 +680,30 @@ static long ff400_copy_msg_to_user(struct snd_ff *ff, char __user *buf, long cou
 	struct ff400_msg_parser *parser = ff->msg_parser;
 	u32 type = SNDRV_FIREWIRE_EVENT_FF400_MESSAGE;
 	long consumed = 0;
+	int ret = 0;
 
 	if (count < 8)
 		return 0;
 
 	spin_unlock_irq(&ff->lock);
-
 	if (copy_to_user(buf, &type, sizeof(type)))
-		return -EFAULT;
-
+		ret = -EFAULT;
 	spin_lock_irq(&ff->lock);
+	if (ret)
+		return ret;
 
 	count -= sizeof(type);
 	consumed += sizeof(type);
 
 	while (count >= sizeof(*parser->msgs) && parser->pull_pos != parser->push_pos) {
 		spin_unlock_irq(&ff->lock);
-
 		if (copy_to_user(buf + consumed, parser->msgs + parser->pull_pos,
 				 sizeof(*parser->msgs)))
-			return -EFAULT;
-
+			ret = -EFAULT;
 		spin_lock_irq(&ff->lock);
+		if (ret)
+			return ret;
+
 		++parser->pull_pos;
 		if (parser->pull_pos >= FF400_QUEUE_SIZE)
 			parser->pull_pos = 0;
-- 
2.35.1

