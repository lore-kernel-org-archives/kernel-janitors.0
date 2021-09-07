Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05217C433EF
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Sep 2021 22:10:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6603610A3
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Sep 2021 22:10:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347393AbhIGWLP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 7 Sep 2021 18:11:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231251AbhIGWLN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Sep 2021 18:11:13 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1DE1C061575
        for <kernel-janitors@vger.kernel.org>; Tue,  7 Sep 2021 15:10:06 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id n7-20020a05600c3b8700b002f8ca941d89so42528wms.2
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Sep 2021 15:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jvwyaUQt5n0mIy7xaampJ1fxHnCzRU2G9ORyorTcaFg=;
        b=Z4rmr9kIvWxpCZB7IlbES4y5ojyL37h9G+fB4bQ6OtiadOHiY5YXZ4Ogh2qASFEQtr
         EGuKvVEt6NBZH8MSZqGGhf41wkdqlwIzt82Bv7oLn09LFnE26opQDzF/NkDVpTF2JOiA
         0KnC38oF2p+v3u7AtMuhD70OcSxmD0xcKy5UqM6DcBU50A6A8pjO8i2Mu58lrWfJQSUm
         AJL/DOVUkuq2zzUNhXAAovXCNleAuEm9fIShv6/RRQUFNHmWaHCGDlqoMzvsych/UksC
         rKAuUjrHwevf/uiPUf1BE18PSrJlTiagDegF+45oe9/aT1/HRpDyLQfWyXGQ6wmuewmI
         Scnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jvwyaUQt5n0mIy7xaampJ1fxHnCzRU2G9ORyorTcaFg=;
        b=GH7+rTTlk3u16v1PRv+QXpksXovaFB2ZCX874SYAY+WVg4KdsHZEAFrg10uzTu7F1V
         T8faw9MaqBp0v5Kp0phjJ4AGEALIIMgEHN8zm4bSp9GNz3l9893GenJmlY6+ITGJgGjE
         FihuzOwqxSqPgfSkX2RkEmGZTjzFYTc5WsOANl2JcFVDjaHKuPNpqLwLCV6PVYR5foEt
         e0m0J3XK/5LJXOo19eeRuMD/Q/jtLZDbuy3dr5TqR8f+911zWmlZWM2hkBcz9atPCXHj
         5aHJzPNYuGYGPjtM0HQp04GB2L2H/nPDE7RJTdeYwAw7/cYDk2fDaw1iBap8ZOz4puan
         U1IQ==
X-Gm-Message-State: AOAM533hw7PriHN0zVNe2YFapMpKHyB4CiigTFX6kgjUEyLGhmO1J9IV
        xqJqpeLKxY3umoR6hBnPaE/wvQ==
X-Google-Smtp-Source: ABdhPJxP+dFd1KsQhgXsGzKnROx0wlUsDamiYbTKMztXUuGDFqaZrpO3mEzk7mcnUsvSILyh1AsIcg==
X-Received: by 2002:a1c:cc05:: with SMTP id h5mr408853wmb.5.1631052605160;
        Tue, 07 Sep 2021 15:10:05 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id h8sm265028wmb.35.2021.09.07.15.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 15:10:04 -0700 (PDT)
Date:   Tue, 7 Sep 2021 23:10:02 +0100
From:   Phillip Potter <phil@philpotter.co.uk>
To:     Colin King <colin.king@canonical.com>
Cc:     Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: remove redundant variable hoffset
Message-ID: <YTfjOtrlaZscXVTm@equinox>
References: <20210907085302.10672-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907085302.10672-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Sep 07, 2021 at 09:53:02AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable hoffset is being assigned values but it is never being
> used. The variable is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
> index 14758361960c..7c12ca548c47 100644
> --- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
> +++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
> @@ -1143,7 +1143,7 @@ static u16 hal_EfuseGetCurrentSize_8188e(struct adapter *pAdapter, bool bPseudoT
>  {
>  	int	bContinual = true;
>  	u16	efuse_addr = 0;
> -	u8 hoffset = 0, hworden = 0;
> +	u8 hworden = 0;
>  	u8 efuse_data, word_cnts = 0;
>  
>  	if (bPseudoTest)
> @@ -1156,18 +1156,15 @@ static u16 hal_EfuseGetCurrentSize_8188e(struct adapter *pAdapter, bool bPseudoT
>  	       AVAILABLE_EFUSE_ADDR(efuse_addr)) {
>  		if (efuse_data != 0xFF) {
>  			if ((efuse_data & 0x1F) == 0x0F) {		/* extended header */
> -				hoffset = efuse_data;
>  				efuse_addr++;
>  				efuse_OneByteRead(pAdapter, efuse_addr, &efuse_data, bPseudoTest);
>  				if ((efuse_data & 0x0F) == 0x0F) {
>  					efuse_addr++;
>  					continue;
>  				} else {
> -					hoffset = ((hoffset & 0xE0) >> 5) | ((efuse_data & 0xF0) >> 1);
>  					hworden = efuse_data & 0x0F;
>  				}
>  			} else {
> -				hoffset = (efuse_data >> 4) & 0x0F;
>  				hworden =  efuse_data & 0x0F;
>  			}
>  			word_cnts = Efuse_CalculateWordCnts(hworden);
> -- 
> 2.32.0
> 

Many thanks Colin, looks good to me.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
