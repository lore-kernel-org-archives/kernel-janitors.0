Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FADFEDE99C
	for <kernel-janitors@archiver.kernel.org>; Thu, 14 Sep 2023 09:48:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237504AbjINJsF (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 14 Sep 2023 05:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237497AbjINJsE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 14 Sep 2023 05:48:04 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4166EB
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Sep 2023 02:47:59 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40434d284f7so5155025e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Sep 2023 02:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694684878; x=1695289678; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NzzzJpY9KlYdQtsBVsrdcIxWQyjcGOv0khQAB609xvg=;
        b=I8CIqLhZH7ynHiMYMnqMB4b7c89IzWD4eGgaVyuAgl7gMFubwSN3RsoBN8OzxPczDV
         RSFinowOnopUZOAfxWrglOU0lfZqe13jBSsjuAMmk24i5B+Q9vjy02UJ/QO6THK40v7C
         5kvjJ4VWPWcj86hVZ/+Tbo9Vca7M6WdhmfDro/cBgz0oxSi+qcqXMXjZOnhJmqpEMqLI
         AJb6Hxc15pEVActHbuvmmWLG35Oz0tOjhY6pRNEiO0YSqJP20WxFo1j3MGGmGys1mP+j
         TSdHlvPXiws/uXR7TYFDryTuMfORin8I5nZfI5zcFL9gT81hbY44K2mz/9n8lI62vvzX
         PqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694684878; x=1695289678;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NzzzJpY9KlYdQtsBVsrdcIxWQyjcGOv0khQAB609xvg=;
        b=NCcG/KT8fu+rxjJU6dAwTIMcoMECW8w0VwOn0qfvH4b01tXuz3srjT1+btvoQrwIah
         93qNJqfOL4WJUAmfnOXyvJWADgXwm9EMn6V8SAviKJ/GqQTqKM7JrFBpAAe+49J2lXs5
         LvyeqPDDmRyYAE/6WazhFNqaH1h3NmFEv1dagltxexzEveFm7PDnDaBKuSAFcg3QG5w3
         yghsko2i1UASlJBFWIUMk08Pe7BqfVL2gXrP6O8mxSUQAKeMXkYA4QbQwVgLUPLT2St8
         1YYlEE5nMNO/2Q8aw4OKM1oHrjOLXptyB1k3WXTgcL1sBWmdtvZYVixOtsMs6jBjHMFd
         9GqQ==
X-Gm-Message-State: AOJu0Yz+2zEsvLpvPVE+/SL7z63E98J2/FUQxNlk4Vio6FummHAfiqU2
        Dxp48RZlRm9UeR+L6AxOBLq5lQ==
X-Google-Smtp-Source: AGHT+IHzgX1oNCgbhQl0a7H9yPKrhXkm4fFi37KYW/JBRfGXBl+yNuIOQgHlKkxiKUMaw93PkJHsHg==
X-Received: by 2002:a7b:c7d5:0:b0:3fe:e7b2:c97f with SMTP id z21-20020a7bc7d5000000b003fee7b2c97fmr4019759wmk.36.1694684878173;
        Thu, 14 Sep 2023 02:47:58 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f2-20020a7bc8c2000000b003fed70fb09dsm1499698wml.26.2023.09.14.02.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 02:47:57 -0700 (PDT)
Date:   Wed, 13 Sep 2023 12:36:29 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Eric Dumazet <edumazet@google.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        David Ahern <dsahern@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] tcp: indent an if statement
Message-ID: <de6b9eed-7049-45c6-aa49-ca7990c979c8@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Indent this if statement one tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Applies to net and net-next, but it's just a white space issue so it
should go into net-next.

 net/ipv4/tcp_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/tcp_timer.c b/net/ipv4/tcp_timer.c
index d45c96c7f5a4..18ede5205b9d 100644
--- a/net/ipv4/tcp_timer.c
+++ b/net/ipv4/tcp_timer.c
@@ -394,7 +394,7 @@ static void tcp_probe_timer(struct sock *sk)
 		if (user_timeout &&
 		    (s32)(tcp_jiffies32 - icsk->icsk_probes_tstamp) >=
 		     msecs_to_jiffies(user_timeout))
-		goto abort;
+			goto abort;
 	}
 	max_probes = READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_retries2);
 	if (sock_flag(sk, SOCK_DEAD)) {
-- 
2.39.2

