Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B4BEC48BCD
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 10:38:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8F8561377
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 10:38:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237843AbhFIKkI (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 9 Jun 2021 06:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237622AbhFIKkH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Jun 2021 06:40:07 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AA70C061574
        for <kernel-janitors@vger.kernel.org>; Wed,  9 Jun 2021 03:37:59 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 69-20020a9d0a4b0000b02902ed42f141e1so23488367otg.2
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Jun 2021 03:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fFi8//Jkb3RjJoIz0ovgttmGp4ert/bfI3tH5gBS+JA=;
        b=HTFEHnSHFsYKfVW1wqDi57e7qrpPUal/hvNWcDIRtAH/q2dAFf8DOpB+nesCqsqfVg
         axa8WOhGXfeHS3jKcNdt9D+3Kez7irZItUsFB9RfWkvqkeBo7+/gTNW8KA6zVqtyTWIo
         +qo4IsfYRni6fvIAWLaHuWJXh2T2H1raPEaoPVvPLM3DZ0GLCT3MBjncplaRzzq2K135
         WQdCxwz5Asm0WMGH0FD0zqPSHnvXOS8Lpdm+lEzY4rWsRNlLKcsNtyl5neUkGwWsGxSW
         A6hHbaKUfH7UdgFWBXh6n08LTJpUjh6t5hJ30DjiGD5cAXhOYFWHmYQteA6XNc2MMe4N
         gi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=fFi8//Jkb3RjJoIz0ovgttmGp4ert/bfI3tH5gBS+JA=;
        b=q2zKz26isIWiRj7CQO1SZxZXOmNqK+ECG454yOhRBhn4HhD3l3NHXQqZskLzaN6nfz
         mC5x4CRhgNOHyAonqgiWfNbyEFZiepw6AdOYinmTwwJI9VcPTmPpqIiWASUUgZlMcXeB
         vP8yu602TWWanLytOhRdOrWxscmVyungyX5Gat3hR+rT4uKAcELUI+TVhX9X4gsdWuy2
         eORMjV185ErMmxUNjta5sTBIkvjmBU4l6z0j2J1+ZqEKZvX0nUsoPW2Pg1hE8vkVrfNL
         5FGeJ2ydtPGmJs6l5O7xe9saS4M8BPoXd0Os1MQVRWQNsG3nL134vY+ijl/3+yhNpKKW
         rYTA==
X-Gm-Message-State: AOAM532+oFB2ZeAAAf6CNlUOYNeeif1QEnz6EIiw1knD2R/08wxEdywy
        MRSCBSWmBGLa/4JXCaADHC8=
X-Google-Smtp-Source: ABdhPJzFyNWuqMRUMtqhGq43VKU6r0meNlR5eNDrG70/UvmV8Al20SqXvqOURHzZmHBQq6pzZVYlDA==
X-Received: by 2002:a9d:405:: with SMTP id 5mr23003438otc.9.1623235078909;
        Wed, 09 Jun 2021 03:37:58 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f25sm1368327oto.26.2021.06.09.03.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 03:37:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 9 Jun 2021 03:37:57 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Straube <straube.linux@gmail.com>,
        Romain Perier <romain.perier@gmail.com>,
        Allen Pais <apais@linux.microsoft.com>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 6/7] staging: rtl8188eu: use safe iterator in
 rtl8188eu_xmitframe_complete()
Message-ID: <20210609103757.GF3727184@roeck-us.net>
References: <YL5iX3Exc0HVYrsi@mwanda>
 <YL5i8W7BNla2DlrW@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YL5i8W7BNla2DlrW@mwanda>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jun 07, 2021 at 09:18:25PM +0300, Dan Carpenter wrote:
> This loop calls rtw_free_xmitframe(pxmitpriv, pxmitframe) which removes
> "pxmitframe" (our list iterator) from the list.  So to prevent a forever
> loop we need to use a safe list iterator.
> 
> Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c b/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c
> index 10a8dcc6ca95..19055a1a92c1 100644
> --- a/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c
> +++ b/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c
> @@ -414,6 +414,7 @@ bool rtl8188eu_xmitframe_complete(struct adapter *adapt,
>  				  struct xmit_priv *pxmitpriv)
>  {
>  	struct xmit_frame *pxmitframe = NULL;
> +	struct xmit_frame *n;
>  	struct xmit_frame *pfirstframe = NULL;
>  	struct xmit_buf *pxmitbuf;
>  
> @@ -422,7 +423,7 @@ bool rtl8188eu_xmitframe_complete(struct adapter *adapt,
>  	struct sta_info *psta = NULL;
>  	struct tx_servq *ptxservq = NULL;
>  
> -	struct list_head *xmitframe_plist = NULL, *xmitframe_phead = NULL;
> +	struct list_head *xmitframe_phead = NULL;
>  
>  	u32 pbuf;	/*  next pkt address */
>  	u32 pbuf_tail;	/*  last pkt tail */
> @@ -507,10 +508,7 @@ bool rtl8188eu_xmitframe_complete(struct adapter *adapt,
>  	spin_lock_bh(&pxmitpriv->lock);
>  
>  	xmitframe_phead = get_list_head(&ptxservq->sta_pending);
> -	list_for_each(xmitframe_plist, xmitframe_phead) {
> -		pxmitframe = list_entry(xmitframe_plist, struct xmit_frame,
> -					list);
> -
> +	list_for_each_entry_safe(pxmitframe, n, xmitframe_phead, list) {
>  		pxmitframe->agg_num = 0; /*  not first frame of aggregation */
>  		pxmitframe->pkt_offset = 0; /*  not first frame of aggregation, no need to reserve offset */
>  
> -- 
> 2.30.2
> 
