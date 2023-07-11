Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3797EB64DD
	for <kernel-janitors@archiver.kernel.org>; Tue, 11 Jul 2023 08:52:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231757AbjGKIwp (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 11 Jul 2023 04:52:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231543AbjGKIwj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 11 Jul 2023 04:52:39 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3DE2E6C
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Jul 2023 01:52:34 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31297125334so3903711f8f.0
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Jul 2023 01:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689065553; x=1691657553;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BqBcFsm4VvCi5EZywoq+U276RpO9NYFsz2Y5f42xGjY=;
        b=FUOCf9WcfNVUm7BtEOKdPaOLicH9qh1ARWma3aXixAtDBWnMsaVLVKfIoF87hxq4rR
         hQnviV4I4qowdfrsxQ6DJyAz9d0EiCfX3W4AFeXnI5ek8grtOW+FYO4AecCqEaIHyHPQ
         euP4jsxA2DT+PQt+OIHGFVwxucdUNon7sSnJLAUMSepUP2i9w7I2kUPeQipCpAL6pGpS
         eXkC3vav6JnBrJHL6ssaaWG0OpYhcbvu3iSg8AamN+8hzJtIjIwIOe8htoeBQ9pfj7wc
         k4nvebqf0CCPBLz6+sH+OjddMVVPruhN7iTTa6s86EC0Lq9IHh8WnlScYwtcwtvsUdwh
         Gkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689065553; x=1691657553;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BqBcFsm4VvCi5EZywoq+U276RpO9NYFsz2Y5f42xGjY=;
        b=K3GM09z974GFgi/Ueq6+DTWufwJg1XXGGYJWyuHBkwo+njvBk1QiWIG1yo0pcXjCxT
         44Cn+poGn6cBo1yhOgdaGYFPaJ5e0i3Dxge1kBQknG8++Fqcf9TbA+6jjJ4NVh72oWHA
         F7lIB/tpXp4O4FAV7B7NjEVNUOz5d4EAD2M4Og1h1u3x+ovqn9ru169oWM0cFACnnjiC
         XKL4+LwiUWEKrzmEcL3qoyuTkMG2B59GG/nglPl8NEmXJCLxsqn1pO1KSkkokRj0CpaZ
         M5AsLlvvJnk5v5Y0gmH/mZp+cPnVQ3m9NU8CAnnJVgoZqAhQtExfWAEZk7CKGqJ2mlQ0
         BGjQ==
X-Gm-Message-State: ABy/qLY+phalpk6+7JHFTUP4dUrO/hUTZl3zwN3oH1RMbcPMYJi5CIN7
        LDW6SDezhmt7GseWA5zRfYCRfA==
X-Google-Smtp-Source: APBJJlGSShkRRFeH3WyQvNfSN+5bRph1U8HSLs/9Sc8Xf9i/vPSkWHCW59E3FMwo8/UOe2Se1+IG8A==
X-Received: by 2002:a5d:5182:0:b0:314:2d59:c6d5 with SMTP id k2-20020a5d5182000000b003142d59c6d5mr17588385wrv.15.1689065553040;
        Tue, 11 Jul 2023 01:52:33 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q10-20020adfdfca000000b003144b95e1ecsm1619492wrn.93.2023.07.11.01.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 01:52:31 -0700 (PDT)
Date:   Tue, 11 Jul 2023 11:52:26 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jiri Pirko <jiri@resnulli.us>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Ido Schimmel <idosch@mellanox.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH net] devlink: uninitialized data in
 nsim_dev_trap_fa_cookie_write()
Message-ID: <7c1f950b-3a7d-4252-82a6-876e53078ef7@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The simple_write_to_buffer() function is designed to handle partial
writes.  It returns negatives on error, otherwise it returns the number
of bytes that were able to be copied.  This code doesn't check the
return properly.  We only know that the first byte is written, the rest
of the buffer might be uninitialized.

There is no need to use the simple_write_to_buffer() function.
Partial writes are prohibited by the "if (*ppos != 0)" check at the
start of the function.  Just use memdup_user() and copy the whole
buffer.

Fixes: d3cbb907ae57 ("netdevsim: add ACL trap reporting cookie as a metadata")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/netdevsim/dev.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/netdevsim/dev.c b/drivers/net/netdevsim/dev.c
index 6045bece2654..b4d3b9cde8bd 100644
--- a/drivers/net/netdevsim/dev.c
+++ b/drivers/net/netdevsim/dev.c
@@ -184,13 +184,10 @@ static ssize_t nsim_dev_trap_fa_cookie_write(struct file *file,
 	cookie_len = (count - 1) / 2;
 	if ((count - 1) % 2)
 		return -EINVAL;
-	buf = kmalloc(count, GFP_KERNEL | __GFP_NOWARN);
-	if (!buf)
-		return -ENOMEM;
 
-	ret = simple_write_to_buffer(buf, count, ppos, data, count);
-	if (ret < 0)
-		goto free_buf;
+	buf = memdup_user(data, count);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
 
 	fa_cookie = kmalloc(sizeof(*fa_cookie) + cookie_len,
 			    GFP_KERNEL | __GFP_NOWARN);
-- 
2.39.2

