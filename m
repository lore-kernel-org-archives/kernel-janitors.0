Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1217CD98F9
	for <kernel-janitors@archiver.kernel.org>; Wed, 11 Oct 2023 08:00:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345529AbjJKIAd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 11 Oct 2023 04:00:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345394AbjJKIAb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 11 Oct 2023 04:00:31 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49E65A4
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Oct 2023 01:00:28 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-405505b07dfso3667195e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Oct 2023 01:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697011226; x=1697616026; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qz8ZijtXypgZfgGaNG42ozEudQwZ/S4uYiYC3qrkT4w=;
        b=InioOG/MLYTDZA2VHIziYLynQlDASgEG+NsTSePgf3hOroOP5kj0NKANmiB5gbdz12
         aIqTEaXK9XQNielWD5T8+sDPokI4KknFTR4RhtYHpUTFyXbbWiNwjL10mDh9FayHngzC
         iJGDxFBD7rnAKMz+WEndq+J7kc7cBGiF5fDYBTf2+oVPrZO15w3ZR5yfLEuDhGzahH8U
         LfhzXgdZtv2kBprW7uywpeluZ/vBjFoqKC1uTHr3QECeMV0y4DLIzLAgUc04sQ9XLjH1
         cz7aU9n/QBmMqNQ0w07ct+mqhcyCzgq6shmHSr2+LjQZth2g0ux3L12ooRYkqFohFRUj
         YgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697011226; x=1697616026;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qz8ZijtXypgZfgGaNG42ozEudQwZ/S4uYiYC3qrkT4w=;
        b=wL0zRliPKCyrbzc6bcELuZ2Pz9PriBBHYJvn/VdYO6XqnWyYHz31hE+LjR+jjTCwW/
         ZXAofsbJY99VVk2k9f1cI4mNkKvbiTEaL56rOq5lGr4riRNMa+P3DWrZ4Gf04qbL9MUl
         8HNRwDkKcypkiGOYOeaxSLCQsBxy4kLB9Gyl1wh41EhTmTYQ668SsPHPRVcErZtjBGv5
         5mFWk/42hUNk8JTgW1Ayci21P7paCrEYtFOxKrzlBoP59kf6bZUltuZBBPvp8eO2MQEA
         CpvaNjLNvl5Gf9YJVW8l02r5ra1HjXt3QEeIaUTMcKKmItHIPheFXlbvc70bsK34WOha
         kJHg==
X-Gm-Message-State: AOJu0YzrA4FCcr01NWx9cTFs6p9IZtbd2Cm7aTvdlh02dPWKmR9ryq+D
        9OCnGchUK6uw49+lsH4aIRyWvQ==
X-Google-Smtp-Source: AGHT+IFZXX0jarvpNDfAJY2TbuzWh9WTigeX7sMPpWABOvC6Pd2KQOBcSrlU0uwBWQ3W4y5pUCkMbg==
X-Received: by 2002:a05:6000:243:b0:329:6b53:e3ad with SMTP id m3-20020a056000024300b003296b53e3admr12254266wrz.34.1697011226548;
        Wed, 11 Oct 2023 01:00:26 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l9-20020a1c7909000000b00401b242e2e6sm18282714wme.47.2023.10.11.01.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 01:00:26 -0700 (PDT)
Date:   Wed, 11 Oct 2023 11:00:22 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Xiyu Yang <xiyuyang19@fudan.edu.cn>
Cc:     Chuck Lever <chuck.lever@oracle.com>,
        Jeff Layton <jlayton@kernel.org>, Neil Brown <neilb@suse.de>,
        Olga Kornievskaia <kolga@netapp.com>,
        Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>,
        Trond Myklebust <trond.myklebust@hammerspace.com>,
        Anna Schumaker <anna@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        "J. Bruce Fields" <bfields@fieldses.org>,
        Xin Tan <tanxin.ctf@gmail.com>, linux-nfs@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH net-XXX] SUNRPC: Add an IS_ERR() check back to where it was
Message-ID: <356fb42c-9cf1-45cd-9233-ac845c507fb7@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This IS_ERR() check was deleted during in a cleanup because, at the time,
the rpcb_call_async() function could not return an error pointer.  That
changed in commit 25cf32ad5dba ("SUNRPC: Handle allocation failure in
rpc_new_task()") and now it can return an error pointer.  Put the check
back.

A related revert was done in commit 13bd90141804 ("Revert "SUNRPC:
Remove unreachable error condition"").

Fixes: 037e910b52b0 ("SUNRPC: Remove unreachable error condition in rpcb_getport_async()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
It's possible Smatch was responsible for generating the original warning
because it warns for unnecessary NULL checks.  But generally, there was
a future error pointer implied.  Those warnings are just a hint, not a
command.

 net/sunrpc/rpcb_clnt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/sunrpc/rpcb_clnt.c b/net/sunrpc/rpcb_clnt.c
index 5988a5c5ff3f..102c3818bc54 100644
--- a/net/sunrpc/rpcb_clnt.c
+++ b/net/sunrpc/rpcb_clnt.c
@@ -769,6 +769,10 @@ void rpcb_getport_async(struct rpc_task *task)
 
 	child = rpcb_call_async(rpcb_clnt, map, proc);
 	rpc_release_client(rpcb_clnt);
+	if (IS_ERR(child)) {
+		/* rpcb_map_release() has freed the arguments */
+		return;
+	}
 
 	xprt->stat.bind_count++;
 	rpc_put_task(child);
-- 
2.39.2

