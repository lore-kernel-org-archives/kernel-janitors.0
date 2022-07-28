Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E90C04A68
	for <kernel-janitors@archiver.kernel.org>; Thu, 28 Jul 2022 13:11:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239096AbiG1NLQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 28 Jul 2022 09:11:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239074AbiG1NLP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 28 Jul 2022 09:11:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E0A32501BB
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Jul 2022 06:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659013871;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Peb1snEEyClrr7SAXY+3h09rG7Cc4NL+stHh6RtUqlg=;
        b=DuhSR6etY/YvB2g5HBMSBwl8DK4fZbbY0RGr8OQ9Chq+O/e1vUhJbGCqXOQwVLBs6JRod5
        JJEaBqEnSqrQ9h1IwQi1yiFVPXKtOSJ2/UQY4oQPxi+TMwEf73CB6uzqfkvXe+9E9QrSOw
        SJBVSCsiWZjc7iiN5PqvQ9upStmpWQ4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-q0CZwP3-NGCMxD1By6XDEA-1; Thu, 28 Jul 2022 09:11:09 -0400
X-MC-Unique: q0CZwP3-NGCMxD1By6XDEA-1
Received: by mail-qk1-f200.google.com with SMTP id y17-20020a05620a25d100b006b66293d75aso1409794qko.17
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Jul 2022 06:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Peb1snEEyClrr7SAXY+3h09rG7Cc4NL+stHh6RtUqlg=;
        b=v6/vZX3mTt+a/F6XiXUf6nFj3QBWW3XCOAaCqxErjvQV2uim0QUU8UpxmBjeJBc0sz
         eFXUo35Z5JGmxXxqB0jDKGbWukAGdKw4PngVGORN2134sn5Tg/oDoAH1Ls2N1C238AO1
         X2ZdWZdnJv9m+SgoZxJsBNKUbHK0ClEeoRWxE5u02xEkHwHDXdO1rbl1qMUMAM1eFVw4
         buirP2D3uScUo6/uiSGz1rxia6ooGWM4y+smaqH8ZD+g9dsNfS41I1y7WM4Jps/1OjGl
         6lIWsJPjlotstzTmuOvmbd+wnxny22bCyAPUCL+C5p2vlpwXb8L4+i585GU1LARhdFjj
         apJQ==
X-Gm-Message-State: AJIora9m4MU2sihsRX3t6v1nyHd+jk5opNMjtOxtamYf8Ptm0xfmlZgA
        Y594XKgMcoAp0XmgYLr/Pn6HkIxQLR7cyd+YlE7MJzR6lSkWU078wL1hwIkAzGMi7W65AVrOT+c
        tUy5cK3prlLfrMpnBFUyVQ18g3htv
X-Received: by 2002:a05:622a:5c9:b0:31e:ebfa:f192 with SMTP id d9-20020a05622a05c900b0031eebfaf192mr22600195qtb.263.1659013869039;
        Thu, 28 Jul 2022 06:11:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uUGwnkUKAlkb5w7dfKwrYi+F9K3MAAR2oHcQcjWq9dcxCgUGRM2/5AUT0TVb6HvPZP43W81Q==
X-Received: by 2002:a05:622a:5c9:b0:31e:ebfa:f192 with SMTP id d9-20020a05622a05c900b0031eebfaf192mr22600156qtb.263.1659013868626;
        Thu, 28 Jul 2022 06:11:08 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-104-164.dyn.eolo.it. [146.241.104.164])
        by smtp.gmail.com with ESMTPSA id t14-20020a37ea0e000000b006b58fce19dasm529103qkj.20.2022.07.28.06.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 06:11:08 -0700 (PDT)
Message-ID: <e63e6fc511d9d515fcb8501f48f218192f36afd3.camel@redhat.com>
Subject: Re: [PATCH] dn_route: use time_is_before_jiffies(a) to replace
 "jiffies - a > 0"
From:   Paolo Abeni <pabeni@redhat.com>
To:     Yu Zhe <yuzhe@nfschina.com>, davem@davemloft.net, kuba@kernel.org
Cc:     linux-decnet-user@lists.sourceforge.net, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        liqiong@nfschina.com
Date:   Thu, 28 Jul 2022 15:11:04 +0200
In-Reply-To: <20220727024600.18413-1-yuzhe@nfschina.com>
References: <20220727024600.18413-1-yuzhe@nfschina.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 2022-07-27 at 10:46 +0800, Yu Zhe wrote:
> time_is_before_jiffies deals with timer wrapping correctly.
> 
> Signed-off-by: Yu Zhe <yuzhe@nfschina.com>
> ---
>  net/decnet/dn_route.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/decnet/dn_route.c b/net/decnet/dn_route.c
> index 552a53f1d5d0..0a4bed0bc2e3 100644
> --- a/net/decnet/dn_route.c
> +++ b/net/decnet/dn_route.c
> @@ -201,7 +201,7 @@ static void dn_dst_check_expire(struct timer_list *unused)
>  		}
>  		spin_unlock(&dn_rt_hash_table[i].lock);
>  
> -		if ((jiffies - now) > 0)
> +		if (time_is_before_jiffies(now))

Uhmm... it looks like the wrap-around condition can happen only in
theory: 'now' is initialized just before entering this loop, and we
will break as soon as jiffies increment. The wrap-around could happen
only if a single iteration of the loop takes more than LONG_MAX
jiffies.

If that happens, we have a completely different kind of much more
serious problem, I think ;)

So this change is mostly for core readability's sake. I personally find
more readable:

		if (jiffies != now)

Cheers,

Paolo

p.s. given the above I guess this is for the net-next tree, right?

