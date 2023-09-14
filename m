Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A4D2EDE99F
	for <kernel-janitors@archiver.kernel.org>; Thu, 14 Sep 2023 09:47:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237471AbjINJrz (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 14 Sep 2023 05:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237244AbjINJry (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 14 Sep 2023 05:47:54 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECA5A1FC6
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Sep 2023 02:47:49 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4018af103bcso4996055e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Sep 2023 02:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694684868; x=1695289668; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RVv2qyN5sdFRwlwpjuzVY5E6Rlilp3F3k2PnFuHj5PQ=;
        b=KFGksNYMPKFEIPWwM/J09z6GZiiRRD52CXewdz0gg/hvHICiSN3R40q/xRk7Tr7QD0
         xGdqdgO81oT87Osta2DvGxoEcucN8sgYb9Hv18TfS49nYqNsciU5QJdX9FS3QNGhjq4o
         oQVbDRneBy08rktNJrJmeNgOgUbDg3736HTNh4133tfvtB2lDeoxST13D4P8nCAsGht7
         1K9vLjzA9Kq4JknwWNsq/ThU0hOWD+Sw7HuD9fpk3NxW2109U1YFP//gKUDMM/l8oaIf
         X76j0VurueHtzCcd7hkrP3AZSTeEfbVm93G2EpY7UcrFSDoOjfnatd08EQQTK2Mr9S/6
         c7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694684868; x=1695289668;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RVv2qyN5sdFRwlwpjuzVY5E6Rlilp3F3k2PnFuHj5PQ=;
        b=vILYjOjx1ruUMsYEuPfVoOGvq4Pq0iYFv1uZjD0Q+NRgLa6Vc70FF6e8qr1Cs/G7MV
         v8CdzUIrJ9mtQ40dSFVNTlAv75qbHywcr1P+u0oUTlc6RYX4TAkVRTR+ir7Qo0ya4DkP
         TiDwdBbH7UIDfuqdpKBuYPYNQuN9BdmRftD+wBwvNogO6C/+I3RozAXuxLRduq2pU/ha
         5KuqQHeGd3jMKExe96b3H5XVaNa83TSR8Po6MvAGRogUsK7kS3BfY9vdJQN/hsLHn4tt
         ikr2sxjyhCZ+tM1Hs9ie/lSz3qB11weJLt/D7WkUIU52g8YyNMLl2XpnXMvRdp93oCQC
         oi4g==
X-Gm-Message-State: AOJu0YylIoElO8wxWwBxBmgNQwxMnVThfFPSo/xp49PCgShQ37FkuQM5
        5uCE3dZsE32Wj1ow8ZvlLJHJPg==
X-Google-Smtp-Source: AGHT+IHfGvVsdkqCaGQOXysOTG6O+Cfw32wYfQp67YlQ6j7ALt/hWG1md2aqRMtYaOKY4IBqDQTVyQ==
X-Received: by 2002:a05:600c:cb:b0:3fe:4341:a5aa with SMTP id u11-20020a05600c00cb00b003fe4341a5aamr1120349wmm.8.1694684868271;
        Thu, 14 Sep 2023 02:47:48 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t7-20020a1c7707000000b003fedcd02e2asm1487902wmi.35.2023.09.14.02.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 02:47:47 -0700 (PDT)
Date:   Thu, 14 Sep 2023 12:47:44 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Kent Overstreet <kent.overstreet@linux.dev>
Cc:     Brian Foster <bfoster@redhat.com>, linux-bcachefs@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] bcachefs: fix error checking in bch2_fs_alloc()
Message-ID: <a0032f97-333a-41ec-97b0-62f0b6135d54@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There is a typo here where it uses ";" instead of "?:".  The result is
that bch2_fs_fs_io_direct_init() is called unconditionally and the errors
from it are not checked.

Fixes: 0060c68159fc ("bcachefs: Split up fs-io.[ch]")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/bcachefs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/bcachefs/super.c b/fs/bcachefs/super.c
index 29cd71445a94..4831010c0dfd 100644
--- a/fs/bcachefs/super.c
+++ b/fs/bcachefs/super.c
@@ -856,7 +856,7 @@ static struct bch_fs *bch2_fs_alloc(struct bch_sb *sb, struct bch_opts opts)
 	    bch2_fs_compress_init(c) ?:
 	    bch2_fs_ec_init(c) ?:
 	    bch2_fs_fsio_init(c) ?:
-	    bch2_fs_fs_io_buffered_init(c);
+	    bch2_fs_fs_io_buffered_init(c) ?:
 	    bch2_fs_fs_io_direct_init(c);
 	if (ret)
 		goto err;
-- 
2.39.2

