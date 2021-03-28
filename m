Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C832CC433DB
	for <kernel-janitors@archiver.kernel.org>; Sun, 28 Mar 2021 12:34:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D35F6188B
	for <kernel-janitors@archiver.kernel.org>; Sun, 28 Mar 2021 12:34:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbhC1Mdo (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 28 Mar 2021 08:33:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:49810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229577AbhC1MdZ (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 28 Mar 2021 08:33:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DECE56192D;
        Sun, 28 Mar 2021 12:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616934798;
        bh=pdQRUpZ1Av2+lJEcYllJX2Tydj9H56i/I6uC16wmCWs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QPOchp5lrSIPyjWUct7Dwia853m6sPQVQPTG1uXD55+6irAdV65MiWvwEMtff52S2
         Tf7K9Q2A3FPj27EGGz4QfAlLZCJpCfTDv/FI0YVQeHJEcfDaQmCXJ7wsW2wvPF7ZOg
         jVlFqIpi8n3FoMdDHS0nCxzcTtSLL+9qzJGE1/Sg=
Date:   Sun, 28 Mar 2021 14:33:15 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
Cc:     marcocesati@gmail.com, dan.carpenter@oracle.com,
        ross.schm.dev@gmail.com, fabioaiuto83@gmail.com,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next 2/6] staging: rtl8723bs: mlme: remove unused
 variables
Message-ID: <YGB3i1qYdvJtGpIz@kroah.com>
References: <20210327001736.180881-1-eantoranz@gmail.com>
 <20210327001736.180881-2-eantoranz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210327001736.180881-2-eantoranz@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Mar 26, 2021 at 06:17:32PM -0600, Edmundo Carmona Antoranz wrote:
> The variable *pframe in rtw_build_wmm_ie_ht() and rtw_restructure_ht_ie()
> is set but never read. Both instances are getting removed.
> 
> Removing these warning:
> 
> drivers/staging/rtl8723bs/core/rtw_mlme.c:2560:6: warning: variable ‘pframe’ set but not used [-Wunused-but-set-variable]
> drivers/staging/rtl8723bs/core/rtw_mlme.c:2576:21: warning: variable ‘pframe’ set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Edmundo Carmona Antoranz <eantoranz@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index 29d4b7493784..83fbd415d766 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -2555,12 +2555,11 @@ void rtw_build_wmm_ie_ht(struct adapter *padapter, u8 *out_ie, uint *pout_len)
>  {
>  	unsigned char WMM_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x00, 0x01, 0x00};
>  	int out_len;
> -	u8 *pframe;
>  
>  	if (padapter->mlmepriv.qospriv.qos_option == 0) {
>  		out_len = *pout_len;
> -		pframe = rtw_set_ie(out_ie+out_len, WLAN_EID_VENDOR_SPECIFIC,
> -							_WMM_IE_Length_, WMM_IE, pout_len);
> +		rtw_set_ie(out_ie + out_len, WLAN_EID_VENDOR_SPECIFIC,
> +			   _WMM_IE_Length_, WMM_IE, pout_len);

Why not check the error value?

thanks,

greg k-h
