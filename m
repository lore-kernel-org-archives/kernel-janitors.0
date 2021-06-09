Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93154C48BCF
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 10:38:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79DC761375
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 10:38:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237981AbhFIKkS (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 9 Jun 2021 06:40:18 -0400
Received: from mail-ot1-f50.google.com ([209.85.210.50]:35738 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237757AbhFIKkQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Jun 2021 06:40:16 -0400
Received: by mail-ot1-f50.google.com with SMTP id 69-20020a9d0a4b0000b02902ed42f141e1so23486929otg.2
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Jun 2021 03:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wLl8pnET+SDuIlIX2Nbz/uqjI22Y9csWS/tvxvAKpbc=;
        b=OThcgThq2MUjHm67XXXHvXuifR9Ue+5Xr9gP65gN41vI6ZZJ6GPdFe+lKjzeSa32N1
         9rRwjCg+xumUp2D+tWI0iph0BZkPv7MPiUdAOHb/oopBpJs16ika10Ik24iBCq6yPMog
         GkiDI/+nrKE40Qh99ZxedgT9x8mv3Jr62ZUBhWiQKcIbUqbGnMnSsJNKVGdnoCvHV4TE
         s63wNmNYRzaqU3Leyy2GJnmXVBkDS+e0UQHuRas83tVIEc8UBCFbOvSdt/2BGWAMkBxX
         0CArtJXFIpbjgkYMVmiE+1nm+Pt9XB/kaAGEzZZ73MIvgH3I6OKdsX1dfZQJxMtf9u74
         GYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=wLl8pnET+SDuIlIX2Nbz/uqjI22Y9csWS/tvxvAKpbc=;
        b=BT9tVwjqt8x/YGd7HED+GZH3HfvAJRYIVkycjmpTxmkpuf25Lc0JdPpPeF9hcY6+1l
         YKCbaU/HslA0a0+bDvpe7q8kKEewOLyVVfAiomuCXVc3awkEdWUdf49YFMlNuVvsk4pX
         dMFM+s6FD/QEmuT0W7Ct2hX6PNN+LSZtXa4h5XWiV3UmGDT3I0fqisgkhh01v+8gbTjf
         E63K5dbvt52I48Qb2YHfKOoZ1R+xfw7esRvuV4wu3OstftiIDoeiviSDXlD2hpDl8ESP
         UJVmlQOcnfboxmLHFg31lrBI+vVIA3lsQYrTpp2k3fwjprVI2IovlOFfoqdafoCNxNUF
         et5Q==
X-Gm-Message-State: AOAM532dVhZLr/onZqlQBT+soQ6++DJRcPmaN01I39xBSvA5ZRoV8Fby
        Ysm0/1BRrsR4h1QvsrnrhWE=
X-Google-Smtp-Source: ABdhPJytNIJgphMD7MwvKNhQbCtHJ5uuW6MpRZI6XhC9TgdnUdpZYwrIPXPhhiBz2a1TsJll7WBE4g==
X-Received: by 2002:a05:6830:18c2:: with SMTP id v2mr11462055ote.153.1623235041442;
        Wed, 09 Jun 2021 03:37:21 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w20sm2047489otl.51.2021.06.09.03.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 03:37:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 9 Jun 2021 03:37:19 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Martin Kaiser <martin@kaiser.cx>,
        Ivan Safonov <insafonov@gmail.com>,
        Simon Fong <simon.fodin@gmail.com>,
        Michael Straube <straube.linux@gmail.com>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 5/7] staging: rtl8188eu: use safe iterator in
 xmit_delivery_enabled_frames()
Message-ID: <20210609103719.GE3727184@roeck-us.net>
References: <YL5iX3Exc0HVYrsi@mwanda>
 <YL5i5aVMQ3CZ5wuQ@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YL5i5aVMQ3CZ5wuQ@mwanda>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jun 07, 2021 at 09:18:13PM +0300, Dan Carpenter wrote:
> This loop calls list_del_init(&pxmitframe->list) and "pxmitframe" is the
> list iterator so it leads to a forever loop.  We need to use a _safe()
> iterator to fix this.
> 
> Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/staging/rtl8188eu/core/rtw_xmit.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8188eu/core/rtw_xmit.c b/drivers/staging/rtl8188eu/core/rtw_xmit.c
> index d5489811c5bc..718dd20ff36c 100644
> --- a/drivers/staging/rtl8188eu/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8188eu/core/rtw_xmit.c
> @@ -1912,17 +1912,14 @@ void wakeup_sta_to_xmit(struct adapter *padapter, struct sta_info *psta)
>  void xmit_delivery_enabled_frames(struct adapter *padapter, struct sta_info *psta)
>  {
>  	u8 wmmps_ac = 0;
> -	struct list_head *xmitframe_plist, *xmitframe_phead;
> -	struct xmit_frame *pxmitframe = NULL;
> +	struct list_head *xmitframe_phead;
> +	struct xmit_frame *pxmitframe, *n;
>  	struct sta_priv *pstapriv = &padapter->stapriv;
>  
>  	spin_lock_bh(&psta->sleep_q.lock);
>  
>  	xmitframe_phead = get_list_head(&psta->sleep_q);
> -	list_for_each(xmitframe_plist, xmitframe_phead) {
> -		pxmitframe = list_entry(xmitframe_plist, struct xmit_frame,
> -					list);
> -
> +	list_for_each_entry_safe(pxmitframe, n, xmitframe_phead, list) {
>  		switch (pxmitframe->attrib.priority) {
>  		case 1:
>  		case 2:
> -- 
> 2.30.2
> 
