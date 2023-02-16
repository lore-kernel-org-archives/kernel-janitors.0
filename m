Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12780C61DA4
	for <kernel-janitors@archiver.kernel.org>; Thu, 16 Feb 2023 12:13:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbjBPMNZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 16 Feb 2023 07:13:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbjBPMNX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 16 Feb 2023 07:13:23 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 178A3270F
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Feb 2023 04:13:12 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id qw12so4703285ejc.2
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Feb 2023 04:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JRkj7un9T+kRR6jY9Frcp8Bss2eFDRGfWPpzJWFTUHo=;
        b=nYBLFtzbctA/qAwwY2F+iCtNHWPBZKH8BR+YuC4lXBJt4KyloMY1k8YeUQo7EImMfA
         a5vVMOZN9I+2Q2et/bnX0/uGZiiKtSHntDpWazgkS2813TgLa7hpa1nJItykC0iBV/Jk
         eSJJN1Fe9tLMnkxkXTdw5icN03MW0IBzDr5wE2MFcGV9UFCt6ADKh3nZt/R5NSkLV17U
         HXkEjzeua8KJBNEDxdmK677yUzYFicZvGEze05EkNyB6byJAszdz8Hy+PXJE+FcaQaLC
         uc8jUOomLhscE9nKmG77efaj9e7cbfD6ESOLpJsr0klacrZWLI0OZKnAijkOJ0ok0v1I
         fcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JRkj7un9T+kRR6jY9Frcp8Bss2eFDRGfWPpzJWFTUHo=;
        b=8AlqOZ6E/oBqRj1MNasUjFBsfxyM/h0OYmcN3v04Z0B8EF7E6YoaAtN3qS218Oggmn
         RBZIwTiNOBw0p5Cl7+BE1yU560uOKJ+xn7c04GqkF09j+4hNZ04wg90ri9MBsZIxrA7u
         ClcKBRev2FjzfZJwefecCZWAP3bx8Dwf3W+MKxaNoVgkFEKPiLODgAxu+GHsiCc8gzqI
         8Uzk8l+vNjm8fZOREKtpgl3iZATKkBvQ+48SBAwmdBfkoTUtOvjDqNLUxOxxr9MDrgPq
         7mCdDdd2DTmm6W2CeT4CkhAInbZqR8g0pdlSGOMR39yMAx7TxOdw2rZomd9fSrqnZE/C
         NqUw==
X-Gm-Message-State: AO0yUKUwGxg1ot6TjJ5TimJHs2NlleG8oI3qmy9nOqJKFz/yqLvc7TxF
        NUY107Uyn6zXEKb/BbyXK+0=
X-Google-Smtp-Source: AK7set+DOdwYRSWUU1TmLaX2hFth3dK9MKZ235xzhGSxb0RjCBgl9+a1HoD78oIbB0+/WGrwCjW6gw==
X-Received: by 2002:a17:906:e09a:b0:891:a330:c890 with SMTP id gh26-20020a170906e09a00b00891a330c890mr7041028ejb.0.1676549590509;
        Thu, 16 Feb 2023 04:13:10 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f12-20020a1709062c4c00b008b149e496e5sm720949ejh.163.2023.02.16.04.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 04:13:10 -0800 (PST)
Date:   Thu, 16 Feb 2023 15:13:04 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Sandeep Dhavale <dhavale@google.com>
Cc:     Chao Yu <chao@kernel.org>, Yue Hu <huyue2@coolpad.com>,
        Jeffle Xu <jefflexu@linux.alibaba.com>,
        linux-erofs@lists.ozlabs.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] erofs: fix an error code in z_erofs_init_zip_subsystem()
Message-ID: <Y+4d0FRsUq8jPoOu@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Return -ENOMEM if alloc_workqueue() fails.  Don't return success.

Fixes: d8a650adf429 ("erofs: add per-cpu threads for decompression as an option")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 fs/erofs/zdata.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index 8ea3f5fe985e..3247d2422bea 100644
--- a/fs/erofs/zdata.c
+++ b/fs/erofs/zdata.c
@@ -475,8 +475,10 @@ int __init z_erofs_init_zip_subsystem(void)
 
 	z_erofs_workqueue = alloc_workqueue("erofs_worker",
 			WQ_UNBOUND | WQ_HIGHPRI, num_possible_cpus());
-	if (!z_erofs_workqueue)
+	if (!z_erofs_workqueue) {
+		err = -ENOMEM;
 		goto out_error_workqueue_init;
+	}
 
 	err = erofs_init_percpu_workers();
 	if (err)
-- 
2.39.1

