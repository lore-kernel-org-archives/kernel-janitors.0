Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED57AC433C1
	for <kernel-janitors@archiver.kernel.org>; Sun, 28 Mar 2021 12:34:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6E5B61968
	for <kernel-janitors@archiver.kernel.org>; Sun, 28 Mar 2021 12:34:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbhC1Mdo (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 28 Mar 2021 08:33:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:49752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230437AbhC1MdB (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 28 Mar 2021 08:33:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8EB066188B;
        Sun, 28 Mar 2021 12:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616934773;
        bh=1tW6EgqS3GwDVKr8tt00RSBb137BBQAM9LEQ4HLlngY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nFKg8wiJWhDItAcrr89mIT9h+RLLL7khcM8WQdUADbmT0SzCeUkNZsoFmhLih3HHf
         PUeN874b2vVtJqVpQYAmJRzINpkmwFYpy/YSaxyYz6XSG6lXBOKEfI0T3ewMVr3b2T
         6k+/h3H60OVcrTK1cnRQPj72ArS47Ou29YP+NEEY=
Date:   Sun, 28 Mar 2021 14:32:50 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
Cc:     marcocesati@gmail.com, dan.carpenter@oracle.com,
        ross.schm.dev@gmail.com, fabioaiuto83@gmail.com,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next 1/6] staging: rtl8723bs: ieee80211: remove unused
 variable
Message-ID: <YGB3chK5o9+udlWt@kroah.com>
References: <20210327001736.180881-1-eantoranz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210327001736.180881-1-eantoranz@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Mar 26, 2021 at 06:17:31PM -0600, Edmundo Carmona Antoranz wrote:
> sec_idx in rtw_get_sec_ie() is set to 0 and never changes value. Also,
> it is only used for debugging messages. Therefore the variable is
> removed and the debug messages are adjusted. Adjusting debug messages
> forced style changes. Taking the opportunity to adjust indentation
> of those sections of the code.
> 
> Removing this warning:
> 
> drivers/staging/rtl8723bs/core/rtw_ieee80211.c:657:15: warning: variable ‘sec_idx’ set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Edmundo Carmona Antoranz <eantoranz@gmail.com>
> ---
>  .../staging/rtl8723bs/core/rtw_ieee80211.c    | 43 +++++++++++--------
>  1 file changed, 25 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> index cccbea555a32..ec065d924fbb 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> @@ -654,7 +654,7 @@ int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len)
>  
>  void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie, u16 *wpa_len)
>  {
> -	u8 authmode, sec_idx, i;
> +	u8 authmode, i;
>  	u8 wpa_oui[4] = {0x0, 0x50, 0xf2, 0x01};
>  	uint	cnt;
>  
> @@ -662,37 +662,44 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie
>  
>  	cnt = (_TIMESTAMP_ + _BEACON_ITERVAL_ + _CAPABILITY_);
>  
> -	sec_idx = 0;
> -
>  	while (cnt < in_len) {
>  		authmode = in_ie[cnt];
>  
>  		if ((authmode == WLAN_EID_VENDOR_SPECIFIC) && (!memcmp(&in_ie[cnt+2], &wpa_oui[0], 4))) {
> -				RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("\n rtw_get_wpa_ie: sec_idx =%d in_ie[cnt+1]+2 =%d\n", sec_idx, in_ie[cnt+1]+2));
> +			RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_,
> +				 ("\n rtw_get_wpa_ie: in_ie[cnt+1]+2 =%d\n", in_ie[cnt + 1] + 2));

These "RT_TRACE" things need to all be removed or use the real in-kernel
api instead.  Please do not hide the problems with them by trying to
clean them up.

thanks,

greg k-h
