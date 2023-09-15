Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41804EE6457
	for <kernel-janitors@archiver.kernel.org>; Fri, 15 Sep 2023 12:55:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235149AbjIOMzf (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 15 Sep 2023 08:55:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235141AbjIOMze (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 15 Sep 2023 08:55:34 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 328FF1FDF
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Sep 2023 05:55:29 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-401d10e3e54so22725455e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Sep 2023 05:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694782527; x=1695387327; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S7Zk0Gm209+6RrjbQIUExPCmrAt7uj3y+xSnarg23mk=;
        b=lGL/RO0XpI6Pa6It9mcMLn/5M7Zg0oxLsu+3rnYX/yCsAophBvL4sc3f2W3CRIECPO
         3skGOoR+y7geHiEi4MhOn98aZKcNIgCAWiluvj23Bj5oPHA5U+eRoM5a0fF9518GkXpM
         CvUdJ1pmpEBkyr0zFqBa9oR62nRw1O+3DMN8qzNel7jLzvR44nBBSwj+WDWWlJW29vhJ
         z+qQNXvAc5XY1tC3vJhlNedVt/dCYz/m0ZgO3PYY/QsNZJOkCXc9vsH4YWcvrnxJ1Bis
         Ley4z42qgRkiZMoGb6b92KHZCSsE7KOeu9ZMwaDNmVa7wKZMKVBTqLfOPvaiXA2FRzmp
         pCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694782527; x=1695387327;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S7Zk0Gm209+6RrjbQIUExPCmrAt7uj3y+xSnarg23mk=;
        b=TT3hU7/OtCNUxkZt/ZDwEleEOvy3fIR5dPyHC/QJ6+P18B1UNIy9zhoXikod3TSo9d
         bqJCd4BA6YxhU/noEddwbwH6EFPJ3p715nRQJMEMR5hgr7WWj5cG478rsh2LOHAhOepm
         EkoWTyd72DcC2i9UPlq5YK12Hl34twI17fJI4KFNM1zCC8QM1nUGGnjAN8+DEz4IkaB1
         Z5+aRpvz/wrXOBrhJ9Xg3PbMD7Ae+SFNoiyiCjWEZ2pUqoRPNnY4kLRBNglxLV/UkuXh
         ejvNm0HO2EsoEt32A0qHTgnUkXS1YvIGSFqNAuEOOzyACVN1mTyc3/W6e4thU6n08+LT
         uS8A==
X-Gm-Message-State: AOJu0Yw+abV//L3mgdXrx2ISZQ/4pjz/I+47vX1r1zYoKc+GMPUADtbC
        eVw3qEsBYK6roe+5eaLPFaEI5w==
X-Google-Smtp-Source: AGHT+IG/tN7gjJvVGYKIy2itP3CefBo8PdIZcNB8sjtzmU6IpMAA16WeDTYKtiiqelAJ01erpHd1wg==
X-Received: by 2002:a05:600c:225a:b0:401:2ee0:7558 with SMTP id a26-20020a05600c225a00b004012ee07558mr1320284wmm.32.1694782527457;
        Fri, 15 Sep 2023 05:55:27 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f13-20020a05600c4e8d00b003fef5e76f2csm3225732wmq.0.2023.09.15.05.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 05:55:26 -0700 (PDT)
Date:   Fri, 15 Sep 2023 15:55:23 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Kent Overstreet <kent.overstreet@gmail.com>
Cc:     Kent Overstreet <kent.overstreet@linux.dev>,
        linux-bcachefs@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] bcachefs:  fs-ioctl: Fix copy_to_user() error code
Message-ID: <90f0388a-ea0d-47d3-bbbd-efb38fd96d2c@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The copy_to_user() function returns the number of bytes that it wasn't
able to copy but we want to return -EFAULT to the user.

Fixes: e0750d947352 ("bcachefs: Initial commit")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/bcachefs/fs-ioctl.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/bcachefs/fs-ioctl.c b/fs/bcachefs/fs-ioctl.c
index 141bcced031e..0679b2f79fd6 100644
--- a/fs/bcachefs/fs-ioctl.c
+++ b/fs/bcachefs/fs-ioctl.c
@@ -122,7 +122,10 @@ static int bch2_ioc_fsgetxattr(struct bch_inode_info *inode,
 
 	fa.fsx_projid = inode->ei_qid.q[QTYP_PRJ];
 
-	return copy_to_user(arg, &fa, sizeof(fa));
+	if (copy_to_user(arg, &fa, sizeof(fa)))
+		return -EFAULT;
+
+	return 0;
 }
 
 static int fssetxattr_inode_update_fn(struct btree_trans *trans,
-- 
2.39.2

