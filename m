Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D369AEE6457
	for <kernel-janitors@archiver.kernel.org>; Fri, 15 Sep 2023 12:56:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235143AbjIOM4X (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 15 Sep 2023 08:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235200AbjIOM4R (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 15 Sep 2023 08:56:17 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 510BD1BEB
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Sep 2023 05:56:12 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-403004a96eeso22719655e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Sep 2023 05:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694782571; x=1695387371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yA+w/ciu0yFLGeghcbeKoBUWv1gFjly6/fhJD4vD9fk=;
        b=c9z2cwgZ3A2luBaVVMcJ2JvWXRFec9oh3ikeWvYhD+DY71z0eeIutiiX275qW0FhnV
         ZFRmzftClY9F4uibU09NFxyceKgQa2e6YGgz4eh0iS5Nk8CPfNsYXvI4HcLrEvH7nNt/
         L50yQjF1bm+x7JWsmCPMgywBV9Ajjh5ZHtadS4/yzJbRhSljiNyx4PmPM8AOYjconpmH
         W4ASGX37InEAvmFKvvPDDBx9BUYqwhZbsNYY/EyGsDSTbkPYuBiqBcZXhUkwUCRoHQdq
         bqxGGAPFpIYEfOU63O61EsvkCtimwMAkr1lYal+2QrJnScXewm4sXhvHiKcEbvmLfEAF
         AfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694782571; x=1695387371;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yA+w/ciu0yFLGeghcbeKoBUWv1gFjly6/fhJD4vD9fk=;
        b=Uyh9/fIHAASmokRR0k2t/LLQ8tauFq8cr0K4oycCUu/dJOVnnye3YsPyDmq6bAK3XJ
         pexW380XlPPwHDt9SiXIFuWOG+u+ujrMtcr65p++WP7JTsJj0NwSLWlXvAHmhvkdXOkM
         tdLaXGiZzoRVrce2ppNqkb9IBtBFaoy6dh1Fqutg9PqjMv+lBKyB+LROvGSve2m2HUS5
         Z3ug3TqrojeLcrYONepcxCGkuR/MIAQCj1CYlBz7nwCp92Lavz14pywdypNSUafW6Kjd
         PakOEeQQ+M5VTTUW2usjSSk1bP8xnXbegt97OHAfFkQf5+gl3UqNRhlnySlnSPFaaUfB
         8UmA==
X-Gm-Message-State: AOJu0YyIenNcCraJ/EEB+ewO6ggD2zGARscrsC0XRqDTVx4xA7dtOEDJ
        lJtnZoQwPyloTGRA3Su1r6+9Gg==
X-Google-Smtp-Source: AGHT+IEFhm91Vd9KJtF7p0co4JGhvaN8mhKUO4tE/iXb0pf9TuNPgRteiP8DZvXq21sYX9HaOARKAQ==
X-Received: by 2002:a05:600c:2194:b0:3fe:ef11:d79f with SMTP id e20-20020a05600c219400b003feef11d79fmr1538537wme.36.1694782570807;
        Fri, 15 Sep 2023 05:56:10 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y6-20020a05600c364600b003fe2bea77ccsm4577932wmq.5.2023.09.15.05.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 05:56:10 -0700 (PDT)
Date:   Fri, 15 Sep 2023 15:56:07 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Kent Overstreet <kent.overstreet@gmail.com>
Cc:     Kent Overstreet <kent.overstreet@linux.dev>,
        Brian Foster <bfoster@redhat.com>,
        linux-bcachefs@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 2/2] bcachefs: acl: Add missing check in bch2_acl_chmod()
Message-ID: <0a0dea2c-23c5-49cb-996c-aa764bdf939e@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce3a4798-f467-4776-939b-b094c365cc5c@moroto.mountain>
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "ret = bkey_err(k);" assignment was accidentally left out so the
call to bch2_btree_iter_peek_slot() is not checked for errors.

Fixes: 53306e096d91 ("bcachefs: Always check for transaction restarts")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/bcachefs/acl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/bcachefs/acl.c b/fs/bcachefs/acl.c
index 6b1579e96dfe..f3809897f00a 100644
--- a/fs/bcachefs/acl.c
+++ b/fs/bcachefs/acl.c
@@ -427,9 +427,10 @@ int bch2_acl_chmod(struct btree_trans *trans, subvol_inum inum,
 		return bch2_err_matches(ret, ENOENT) ? 0 : ret;
 
 	k = bch2_btree_iter_peek_slot(&iter);
-	xattr = bkey_s_c_to_xattr(k);
+	ret = bkey_err(k);
 	if (ret)
 		goto err;
+	xattr = bkey_s_c_to_xattr(k);
 
 	acl = bch2_acl_from_disk(trans, xattr_val(xattr.v),
 			le16_to_cpu(xattr.v->x_val_len));
-- 
2.39.2

