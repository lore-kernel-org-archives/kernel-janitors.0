Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70766C433B4
	for <kernel-janitors@archiver.kernel.org>; Sun, 16 May 2021 20:03:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DFE960FE8
	for <kernel-janitors@archiver.kernel.org>; Sun, 16 May 2021 20:03:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233207AbhEPUEb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 16 May 2021 16:04:31 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:37033 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbhEPUEb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 16 May 2021 16:04:31 -0400
Received: from [192.168.1.18] ([86.243.172.93])
        by mwinf5d79 with ME
        id 5Y3C2500E21Fzsu03Y3CLh; Sun, 16 May 2021 22:03:15 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 16 May 2021 22:03:15 +0200
X-ME-IP: 86.243.172.93
Subject: Re: [PATCH 1/6] staging: rtl8188eu: use safe iterator in
 rtw_free_network_queue
To:     Martin Kaiser <martin@kaiser.cx>,
        Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210516160613.30489-1-martin@kaiser.cx>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <738695eb-61f1-54b2-cd68-2143e831e338@wanadoo.fr>
Date:   Sun, 16 May 2021 22:03:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210516160613.30489-1-martin@kaiser.cx>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 16/05/2021 à 18:06, Martin Kaiser a écrit :
> rtw_free_network_queue iterates over the scanned wireless networks and
> calls _rtw_free_network for each of them. In some cases,
> _rtw_free_network removes a network from the list.
> 
> We have to use list_for_each_safe if we remove list entries while we
> iterate over a list.
> 
> Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
> Without this patch, it's easy to get the driver into an endless loop by
> scanning, connecting and disconnecting repeatedly.
> 
> wpa_supplicant -B -Dwext -i wlan0 -c /path/to/my/config...
> while true ; do
>     sleep 1
>     wpa_cli reconfigure
>     wpa_cli add_network
>     wpa_cli set_network 0 ssid ...
>     wpa_cli set_network 0 psk ...
>     wpa_cli select_network 0
>     sleep 6
>     wpa_cli status
>     wpa_cli disconnect 0
> done
> 
>   drivers/staging/rtl8188eu/core/rtw_mlme.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme.c b/drivers/staging/rtl8188eu/core/rtw_mlme.c
> index 159465b073c2..14816ad51668 100644
> --- a/drivers/staging/rtl8188eu/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8188eu/core/rtw_mlme.c
> @@ -199,7 +199,7 @@ struct wlan_network *rtw_find_network(struct __queue *scanned_queue, u8 *addr)
>   
>   void rtw_free_network_queue(struct adapter *padapter, u8 isfreeall)
>   {
> -	struct list_head *phead, *plist;
> +	struct list_head *phead, *plist, *temp;
>   	struct wlan_network *pnetwork;
>   	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
>   	struct __queue *scanned_queue = &pmlmepriv->scanned_queue;
> @@ -207,7 +207,7 @@ void rtw_free_network_queue(struct adapter *padapter, u8 isfreeall)
>   	spin_lock_bh(&scanned_queue->lock);
>   
>   	phead = get_list_head(scanned_queue);
> -	list_for_each(plist, phead) {
> +	list_for_each_safe(plist, temp, phead) {
>   		pnetwork = list_entry(plist, struct wlan_network, list);
>   
>   		_rtw_free_network(pmlmepriv, pnetwork, isfreeall);
> 
Nitpicking: 'list_for_each_entry_safe' could also be used to simplify code.

CJ
