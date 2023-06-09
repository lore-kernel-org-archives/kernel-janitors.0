Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 415B0C87FE4
	for <kernel-janitors@archiver.kernel.org>; Fri,  9 Jun 2023 11:05:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbjFILFd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 9 Jun 2023 07:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238820AbjFILF1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 9 Jun 2023 07:05:27 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 830021FDC
        for <kernel-janitors@vger.kernel.org>; Fri,  9 Jun 2023 04:05:26 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f7378a74faso12508165e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 09 Jun 2023 04:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686308725; x=1688900725;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tFyWP/Gv04JokRZ90bRXNAF0sLVUQUnwQyZmUvgIR0w=;
        b=oxspjefXVCLflDUTz7ZGtjCzKu/BHHdCyNz5Xjs/hyGClXt45cDE6xpGXm3A3e2uEr
         RV40rCeCFMtX7Jis8IJcXJpoBUqS/MWvIdpi09CerEM1wHdV2QIwiBlFWyIDRUP1G8Wq
         e2DrjWL3R5yTGPKUfClD4kAstCdFn5x4cnmAXdf9YZG+SD86bLS36QNjjVQcuXte2Cqn
         XlVojEDTz8daeIRYxQarDF9PvmO8Vbszv2iBY80R9P+dD2OLqjYDoCRzK5O0JNfc0m/y
         dVfTg0UjIWqVMu6Y1OH75KbORgBRK3pl2h722//pIiRZZ8l1LiA45A8FJ04y4JkQgZoV
         p/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686308725; x=1688900725;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tFyWP/Gv04JokRZ90bRXNAF0sLVUQUnwQyZmUvgIR0w=;
        b=dquhHIHPHPiOWKUs0wQ0U3iFZxQzafdq0lxe/ctpXYDGpzKdOuxy+WLkhmacU4Ooqp
         9HiVdAB3pjHuHUTBGI7Negwdq4LUCAYHIp4m5MBCymICqRrtom2QonY2JrRFP/s9JA+q
         G+tJ/Q04wVN7eqfcPAFB3LeMdoijWQOI6D0e/vCRpGQW8Iw/A0nEOFJro3w/8s5RPtsi
         nQ7tf5TlEyvjGKfrTqheNkcPYzMySOx/cJSGwEfJHWywkU5jYSYPjbE0JF7IWaEhhfi7
         tq6omdlLdaavrvUYjt8UC7jSlvbWJjjy75vGgOfkSwRCa1WOf+L41Wrj+zuQS67hkflJ
         i63Q==
X-Gm-Message-State: AC+VfDzGhRb11TScXgYkIkIuCxPJ1h6pffhoCjbCsNYcM/SOSpUEUBLV
        epHjsgDSpZddH+K7/XvZmQinaw==
X-Google-Smtp-Source: ACHHUZ5a/3SspzqfpjyWpYpyUKU5uGfftwmHY0tsmPA6mLLzprhRTE8IrmzxR+xp0QDfSwZaPDVDPQ==
X-Received: by 2002:a05:600c:384:b0:3f4:2897:4eb7 with SMTP id w4-20020a05600c038400b003f428974eb7mr911968wmd.38.1686308724936;
        Fri, 09 Jun 2023 04:05:24 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n6-20020a7bcbc6000000b003f6f6a6e769sm2336197wmi.17.2023.06.09.04.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 04:05:23 -0700 (PDT)
Date:   Fri, 9 Jun 2023 14:05:19 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Vlad Yasevich <vladislav.yasevich@hp.com>
Cc:     Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
        Xin Long <lucien.xin@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-sctp@vger.kernel.org,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 2/2 net] sctp: fix an error code in sctp_sf_eat_auth()
Message-ID: <bfb9c077-b9a6-47f4-8cd8-a7a86b056a21@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4629fee1-4c9f-4930-a210-beb7921fa5b3@moroto.mountain>
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The sctp_sf_eat_auth() function is supposed to enum sctp_disposition
values and returning a kernel error code will cause issues in the
caller.  Change -ENOMEM to SCTP_DISPOSITION_NOMEM.

Fixes: 65b07e5d0d09 ("[SCTP]: API updates to suport SCTP-AUTH extensions.")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 net/sctp/sm_statefuns.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sctp/sm_statefuns.c b/net/sctp/sm_statefuns.c
index 97f1155a2045..08fdf1251f46 100644
--- a/net/sctp/sm_statefuns.c
+++ b/net/sctp/sm_statefuns.c
@@ -4482,7 +4482,7 @@ enum sctp_disposition sctp_sf_eat_auth(struct net *net,
 				    SCTP_AUTH_NEW_KEY, GFP_ATOMIC);
 
 		if (!ev)
-			return -ENOMEM;
+			return SCTP_DISPOSITION_NOMEM;
 
 		sctp_add_cmd_sf(commands, SCTP_CMD_EVENT_ULP,
 				SCTP_ULPEVENT(ev));
-- 
2.39.2

