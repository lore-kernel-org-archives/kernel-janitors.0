Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E3C2C7EE23
	for <kernel-janitors@archiver.kernel.org>; Tue, 30 May 2023 09:25:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbjE3JZX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 30 May 2023 05:25:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231234AbjE3JZA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 30 May 2023 05:25:00 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6717F1724
        for <kernel-janitors@vger.kernel.org>; Tue, 30 May 2023 02:23:49 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f60b3f32b4so27723955e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 30 May 2023 02:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685438620; x=1688030620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wjR90Ctvp6ZQbw8QRFKChSdyEnuHvvabu/xgCEjiGB4=;
        b=ecb6HZm/MEXj2cucvYfvya+WXqaP/YABRut+6eJlRkVXdvsmLptN35/8Bui9HmLBcj
         TsviLhx8W3VNezNkfI9Um6lKqYcigFqV2AaEt4It/uSx2RBRecqGtu3rm/3dTSQgYFFR
         F7xjEEvqCDTeDdwfn51rd78K10TmB5xBTqBZm5ut9bLkgNkTg9VuuEFA+mZgaGu61vkB
         E6dkrUkdZLLj923hBlef0FAsdcB2jFF2cFFkW60CJfQcxY3fy78mWIgt69azMS+FFmIv
         14dWPKYdWsUmYqo8GMdz4UWYjy8N9w+QuGQvOaXa2HKp6gO9/Lo3V5X67JlwdHqhdylD
         5Pvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685438620; x=1688030620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjR90Ctvp6ZQbw8QRFKChSdyEnuHvvabu/xgCEjiGB4=;
        b=Quwjney43pEW8FTc6tzEg9HiLYhcYJm49eJQQXlorROG4YEnW9wuI8k1HLP1IX0geq
         oxJOBZ1JgsMXJwW1utxgrqMCm2BV0WfUR2FbSIbaaDw0y4kw9DHYZSoL77ZfaDwLc1m6
         909QxdVCOg2ZxeRJYc6GcH+Pv33IeyIXr/9VRhZiWGDs2bSSEyCl8rIiNyZSV3GbF2Z/
         sMn6H2AQyuTXS/rDqp0X9PqznwiNi8n5mtXxKZk7t477Ng4VRt+iEF1wG+BpcKqaRUeN
         KFYX/QawWe4Ki9Q/ifmsu4sgCwasg72Fo86DJO8veQ98CxaAQvBdddDm0z5c08Xo4+uO
         TXBA==
X-Gm-Message-State: AC+VfDxJnHsZrbxP0Jpf5nDRpSgCOb8ELamPZeQ/DVZy+Y1yTAtxEQ4I
        cASQ4eFjGH1W4dS7JUypG0GK/g==
X-Google-Smtp-Source: ACHHUZ5+4SmegIyAIJS+17P4obWCr0wwjHL2trNkxyb8ungnYM8gi9ma+XnOQYcNrWcwELOsTL2aLw==
X-Received: by 2002:a1c:c906:0:b0:3f4:2c21:b52c with SMTP id f6-20020a1cc906000000b003f42c21b52cmr1175562wmb.39.1685438619961;
        Tue, 30 May 2023 02:23:39 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l21-20020a1c7915000000b003f603b8eb5asm16993997wme.7.2023.05.30.02.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 02:23:36 -0700 (PDT)
Date:   Tue, 30 May 2023 12:23:32 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Paolo Abeni <pabeni@redhat.com>
Cc:     Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Russell King <linux@armlinux.org.uk>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] net: phy: fix a signedness bug in genphy_loopback()
Message-ID: <813008f6-cb26-4666-81ca-6f88c04bba07@kili.mountain>
References: <d7bb312e-2428-45f6-b9b3-59ba544e8b94@kili.mountain>
 <20230529215802.70710036@kernel.org>
 <c7a1ee2dea22cd9665c0273117fe39eebc72e662.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7a1ee2dea22cd9665c0273117fe39eebc72e662.camel@redhat.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, May 30, 2023 at 11:06:55AM +0200, Paolo Abeni wrote:
> On Mon, 2023-05-29 at 21:58 -0700, Jakub Kicinski wrote:
> > On Fri, 26 May 2023 14:45:54 +0300 Dan Carpenter wrote:
> > > The "val" variable is used to store error codes from phy_read() so
> > > it needs to be signed for the error handling to work as expected.
> > > 
> > > Fixes: 014068dcb5b1 ("net: phy: genphy_loopback: add link speed configuration")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > 
> > Is it going to be obvious to PHY-savvy folks that the val passed to
> > phy_read_poll_timeout() must be an int? Is it a very common pattern?
> > My outsider intuition is that since regs are 16b, u16 is reasonable,
> > and more people may make the same mistake. Therefore we should try to
> > fix phy_read_poll_timeout() instead to use a local variable like it
> > does for __ret. 
> > 
> > Weaker version would be to add a compile time check to ensure val 
> > is signed (assert(typeof(val)~0ULL < 0) or such?).
> 
> FTR, a BUILD_BUG_ON() the above check spots issues in several places
> (e.g. r8169_main.c, drivers/net/phy/phy_device.c, ...)
> 

I don't see an issue in r8169_main.c and in drivers/net/phy/phy_device.c
then I only find the bug from this patch.

regards,
dan carpenter

diff --git a/include/linux/phy.h b/include/linux/phy.h
index 6478838405a08..f05fc25b77583 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1173,6 +1173,7 @@ static inline int phy_read(struct phy_device *phydev, u32 regnum)
 ({ \
 	int __ret = read_poll_timeout(phy_read, val, val < 0 || (cond), \
 		sleep_us, timeout_us, sleep_before_read, phydev, regnum); \
+	BUILD_BUG_ON((typeof(val))~0ULL > 0);				\
 	if (val < 0) \
 		__ret = val; \
 	if (__ret) \
