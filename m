Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D078C636D6
	for <kernel-janitors@archiver.kernel.org>; Thu, 23 Feb 2023 13:59:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234507AbjBWN7J (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 23 Feb 2023 08:59:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234154AbjBWN7I (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 23 Feb 2023 08:59:08 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5617338EB8
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Feb 2023 05:58:54 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id p3-20020a05600c358300b003e206711347so8296069wmq.0
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Feb 2023 05:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YD9aPMIqusQcIzxdFc4sBlniX328PWK4AhxV6f52xvU=;
        b=Puby1yva9H3jy2y6/i/6s84UNyS9hJT10vopNjhgM6dQ6cXDHYJoAaCPhh+yoHnan3
         03iDfMzBX/QrTA2ZD0CjlCMwpN1vvXGyusmeU+AFpGGyGhBdz8ZcRf1naI9mjBfeYfG/
         n0fZxjYbL5vKtISE/2ysOTSMn66nXAjqiTRgPkah1rWI1+fB2152x4cdBgvN1nrr0ZyQ
         xJadNIbY+tQyoEgFSz98jRZTAgUVUfWMcINpXBP3r7wLpmPkfVL8soE5Qkx6U9bY++YC
         uSww6skWd4VB2C4EkdwoQWF62S/9Zjo27KB4KPq8YOhoC354y/NweNAJ8Baq24cJvHhI
         mbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YD9aPMIqusQcIzxdFc4sBlniX328PWK4AhxV6f52xvU=;
        b=V7FQXtpOHu+ndd1PVmUO3Qzii5ipLo0ey5ZYaPa3i9K2pZQSbxHNk4sxj3P0XxgMXP
         T4og256oPXm2L6G05b0PCfuzddaM79soRYPlYUJRGYGPGf5MYNeJNwyRR/sFiTgxEE4d
         u2Ke5eClrWDz7/4nLz/Yu7S+ywy8ueIAZtQs4xMVCmUTbEC/V9RURhqfigEuU9A3f6FN
         flkFizMYt9higF+kK1wEgACFXD5tM+74D7rkWvITppJMyo+2Acua8CuEy0zyvFjeEsEl
         ui5bGck+q7/Gk7XoeQrY/cMxu/kAOmCg5BWzL3NBFqLSVA7aDF5vFhX9Gek4QzIxTqSE
         M5wQ==
X-Gm-Message-State: AO0yUKUqBLtYnIeC+8QYlcEXjyMF8eIYbmdwjAiUtNAKwgTXnWz+499l
        t3mhcxnzx0+CIf2RQjgInomI5PZDGIlZ+g==
X-Google-Smtp-Source: AK7set8lsCHKBeQ6RIIB00qpQ0nkfAgISlP71x2X/N9rRitbP+JB/oAzxix7AF9n7mUTaQtu6+ZJxQ==
X-Received: by 2002:a05:600c:130f:b0:3dc:198c:dde with SMTP id j15-20020a05600c130f00b003dc198c0ddemr8679781wmf.41.1677160732679;
        Thu, 23 Feb 2023 05:58:52 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c22-20020a7bc856000000b003e01493b136sm11475298wml.43.2023.02.23.05.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 05:58:52 -0800 (PST)
Date:   Thu, 23 Feb 2023 16:58:48 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Pavel Skripkin <paskripkin@gmail.com>
Cc:     Phillip Potter <phil@philpotter.co.uk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Deepak R Varma <drv@mailo.com>,
        Charlie Sands <sandsch@northvilleschools.net>,
        Mahak Gupta <mahak_g@cs.iitr.ac.in>,
        Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: fix a potential integer underflow bug
Message-ID: <Y/dxGHm3kjjNzxqx@kadam>
References: <Y/YfzZeFCAPiZ6RV@kili>
 <62e57016-c3e3-795c-afa2-8bbdb8071db6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62e57016-c3e3-795c-afa2-8bbdb8071db6@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Feb 23, 2023 at 02:00:48PM +0300, Pavel Skripkin wrote:
> > diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> > index a7c67014dde0..f49e32c33372 100644
> > --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> > +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> > @@ -538,7 +538,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
> >   		/*------------------------------------------------*/
> >   		struct ipv6hdr *iph = (struct ipv6hdr *)(skb->data + ETH_HLEN);
> > -		if (sizeof(*iph) >= (skb->len - ETH_HLEN))
> > +		if (skb->len <= sizeof(*iph) + ETH_HLEN)
> >   			return -1;
> 
> 
> Thanks for the patch!
> 
> I am wondering, if it make sense to use generic skb APIs which will do error
> handling for us?
> 
> Like following (not even build-tested tho)
> 
> 
> 
> With regards,
> Pavel Skripkin
> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> index a7c67014dde0..8f5f2ef26056 100644
> --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> @@ -536,26 +536,29 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
>  		/*------------------------------------------------*/
>  		/*         Handle IPV6 frame			  */
>  		/*------------------------------------------------*/
> -		struct ipv6hdr *iph = (struct ipv6hdr *)(skb->data + ETH_HLEN);
> +		u8 header *h = skb->data;
> +		struct ipv6hdr *iph = skb_pull(skb, ETH_HLEN);
>  
> -		if (sizeof(*iph) >= (skb->len - ETH_HLEN))
> +		if (!iph)
>  			return -1;
>  
>  		switch (method) {
>  		case NAT25_CHECK:
> -			if (skb->data[0] & 1)
> +			if (h[0] & 1)
>  				return 0;
>  			return -1;
>  		case NAT25_INSERT:
>  			if (memcmp(&iph->saddr, "\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0", 16)) {
>  				__nat25_generate_ipv6_network_addr(addr, (unsigned int *)&iph->saddr);
> -				__nat25_db_network_insert(priv, skb->data + ETH_ALEN, addr);
> +				__nat25_db_network_insert(priv, (void *)iph, addr);

Doing it this way introduces a read overflow because there is no
guarantee that iph is large enough.  You would still need a check for
if (skb->len < sizeof(*iph)).  The existing check is <= instead of <,
but that was in the original code.  I should have investigated why it is
<= and if it should be change to <.  Sorry, this patch was not good.

A better way to do this would be to use skb_pull_data()...  But it's
still buggy because it trusts be16_to_cpu(iph->payload_len).  I need to
zoom out on this one.  Is this NAT25 stuff even required?  Do other
people do NAT stuff in their wifi drivers?

regards,
dan carpenter

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index f49e32c33372..b84b2d4f23c3 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -536,27 +536,26 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 		/*------------------------------------------------*/
 		/*         Handle IPV6 frame			  */
 		/*------------------------------------------------*/
-		struct ipv6hdr *iph = (struct ipv6hdr *)(skb->data + ETH_HLEN);
+		u8 *header = skb_pull_data(skb, ETH_HLEN);
+		struct ipv6hdr *iph = skb_pull_data(skb, sizeof(*iph));
 
-		if (skb->len <= sizeof(*iph) + ETH_HLEN)
+		if (!iph)
 			return -1;
 
 		switch (method) {
 		case NAT25_CHECK:
-			if (skb->data[0] & 1)
+			if (header[0] & 1)
 				return 0;
 			return -1;
 		case NAT25_INSERT:
 			if (memcmp(&iph->saddr, "\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0", 16)) {
 				__nat25_generate_ipv6_network_addr(addr, (unsigned int *)&iph->saddr);
-				__nat25_db_network_insert(priv, skb->data + ETH_ALEN, addr);
+				__nat25_db_network_insert(priv, iph, addr);
 
-				if (iph->nexthdr == IPPROTO_ICMPV6 &&
-						skb->len > (ETH_HLEN +  sizeof(*iph) + 4)) {
-					if (update_nd_link_layer_addr(skb->data + ETH_HLEN + sizeof(*iph),
-								      skb->len - ETH_HLEN - sizeof(*iph), GET_MY_HWADDR(priv))) {
-						struct icmp6hdr  *hdr = (struct icmp6hdr *)(skb->data + ETH_HLEN + sizeof(*iph));
-						hdr->icmp6_cksum = 0;
+				if (iph->nexthdr == IPPROTO_ICMPV6 && skb->len > 4) {
+					if (update_nd_link_layer_addr(skb->data, skb->len,
+								      GET_MY_HWADDR(priv))) {
+						struct icmp6hdr  *hdr = (struct icmp6hdr *)skb->data;
 						hdr->icmp6_cksum = csum_ipv6_magic(&iph->saddr, &iph->daddr,
 										be16_to_cpu(iph->payload_len),
 										IPPROTO_ICMPV6,
