Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9555EC61DA4
	for <kernel-janitors@archiver.kernel.org>; Thu, 23 Feb 2023 11:27:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233704AbjBWL1E (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 23 Feb 2023 06:27:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233509AbjBWL1C (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 23 Feb 2023 06:27:02 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B393D72B6
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Feb 2023 03:27:01 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id h14so1748746wru.4
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Feb 2023 03:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3+hQVuvhZzcYtd7cokSKHFj+kPj7oU92IKueIRii2D4=;
        b=hXyYUjxlefIkK4YIS+VcGhYrA3Es+eYWsT/vLiaeaubRq5TIZ3uWwGsm5RF/oXyxoF
         lyPpYxZqEmMCaL+WQFbee8eOCuuDBUmQzF9FspbT0I+8RlxHjijDIw+9Mejgz2OAXfkL
         InUonIdF1mcunBdDQlRuxLdW70m4L1deGgqxwXXY003aGYcp4IskHbjaXed/n9Gj4flG
         OE8jOWXasXfi6xOrXEnxyzExigIRCLd8MUmNdXIiVlbQmoDznr1T8aslbgktKs6b6qwh
         Uwye0YmL0dLeIqEw+fGCP22ZhEOYbqIuH+IZqYgSakt2R/0GrvwcHX9msY8zX8q7HEhG
         /S9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+hQVuvhZzcYtd7cokSKHFj+kPj7oU92IKueIRii2D4=;
        b=Fx+HbpLKftOedbdlx3eyCwRLV1B77CnmvNIs8ikGULoz5upxL24njOQarAjnqPE1qb
         +VvTiVGPKzIXG6g61rjvgtTKSirEXLI5CgbaYGxP/8xv0M9nGqoBKmk/YghgCvzAkKq/
         DY0I82WujISZv8sBRSeJR8gXAFaudLgXmUBereDhuBNIkMJBGOzAR8+kKvbXaQCJ63QP
         b4YRj56f7H6VpCERMMpob2Zk78y1fmkRwiSs7sKHxOBb3iMcOMCH/4U/HDhZFWxxo0Wf
         UvVjqvf3nFG+CXCpDfPv8rQVfezSv6nKeZghoCYlEBH4dPTgWd4cJt/YRXq5J0VMOOe8
         V7CQ==
X-Gm-Message-State: AO0yUKWmbUQKf9t7n1tXbLqfc0YUK2ArVnt/gpIIf2p3L4oaMW89j7tB
        mCjFL0krXlVe4emGSn2605c=
X-Google-Smtp-Source: AK7set83tsQiWgEeieQ08Rc/LpTgt7Wsfl6kGkeoBkFpNFPDKdNCej+XmV81HXCJ68ufWy5b+mCpkA==
X-Received: by 2002:a5d:69cd:0:b0:2c5:9ef9:9bab with SMTP id s13-20020a5d69cd000000b002c59ef99babmr9238732wrw.43.1677151620092;
        Thu, 23 Feb 2023 03:27:00 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v15-20020a5d678f000000b002c6e84cadcbsm8240620wru.72.2023.02.23.03.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 03:26:59 -0800 (PST)
Date:   Thu, 23 Feb 2023 14:26:56 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Phillip Potter <phil@philpotter.co.uk>
Cc:     Pavel Skripkin <paskripkin@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Deepak R Varma <drv@mailo.com>,
        Charlie Sands <sandsch@northvilleschools.net>,
        Mahak Gupta <mahak_g@cs.iitr.ac.in>,
        Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: fix a potential integer underflow bug
Message-ID: <Y/dNgG2C8TupGJLF@kadam>
References: <Y/YfzZeFCAPiZ6RV@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/YfzZeFCAPiZ6RV@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Feb 22, 2023 at 04:59:41PM +0300, Dan Carpenter wrote:
> Here the code is testing to see if skb->len meets a minimum size
> requirement.  However if skb->len is very small then the ETH_HLEN
> subtraction will result in a negative which is then type promoted
> to an unsigned int and the condition will be true.
> 
> Generally, when you have an untrusted variable like skb->len, you
> should move all the math to the other side of the comparison.
> 
> Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> Compile tested only.  This is basic algebra of moving parts of the
> equation from one side to the other and I am surprisingly bad at
> something that I was supposed to have learned in 9th grade.
> 
>  drivers/staging/r8188eu/core/rtw_br_ext.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> index a7c67014dde0..f49e32c33372 100644
> --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> @@ -538,7 +538,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
>  		/*------------------------------------------------*/
>  		struct ipv6hdr *iph = (struct ipv6hdr *)(skb->data + ETH_HLEN);
>  
> -		if (sizeof(*iph) >= (skb->len - ETH_HLEN))
> +		if (skb->len <= sizeof(*iph) + ETH_HLEN)
>  			return -1;

NAK.  On reviewing now, if this is a bug, then there is already a read
overflow a few lines earlier.

regards,
dan carpenter

