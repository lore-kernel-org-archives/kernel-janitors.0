Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADBDAC4743C
	for <kernel-janitors@archiver.kernel.org>; Mon, 21 Jun 2021 12:41:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93AA46101D
	for <kernel-janitors@archiver.kernel.org>; Mon, 21 Jun 2021 12:41:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbhFUMnV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 21 Jun 2021 08:43:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36709 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229663AbhFUMnV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 21 Jun 2021 08:43:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624279266;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UX4hH0orljGAjRfyNzYEtqzSPWXSws7HgqHEwdcv2h8=;
        b=E89KHkwIJbGs5xn0pNqa5YU3oWLavuqT2kRtupUOQTDdwSPRmp7sKH/f00Kee0uEixIVEi
        4jw+WFK0v/2wal0y3nWElQLxPsueizh+J0JmYG64Eda9wfI9jo2VJxE/9f1wQG0UjUGGVB
        3AggyuMa0zgzOQ5OcnNJp7ci+slmZQE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-3-MmhgmfMfmBw8Oye0ZMHg-1; Mon, 21 Jun 2021 08:41:05 -0400
X-MC-Unique: 3-MmhgmfMfmBw8Oye0ZMHg-1
Received: by mail-ej1-f72.google.com with SMTP id f1-20020a1709064941b02903f6b5ef17bfso6271859ejt.20
        for <kernel-janitors@vger.kernel.org>; Mon, 21 Jun 2021 05:41:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UX4hH0orljGAjRfyNzYEtqzSPWXSws7HgqHEwdcv2h8=;
        b=mvY8q/AeQnQUroHfO7V9YjJhgpFvfKPHlurr7w7dIT3nIUNh+11p21ukQmYLQn2qaO
         0le3+upJxmrry61lxVObjWozxklxfJj/prJtWHQVlv1TeJseKCMRsuz9l8atP5L5F63S
         CrBMOGZtvF0Pb96tUQ+u7Ao3CbEV6gr6bA00gxM/Hb1zlq2X1sFnjTcCcmFZK6wgs65V
         t1m5KTr71VXtcPd3lWlLiDBDwAaWQqwZjHmmq5t9HuUF3A24MSuBFcbnCA1SEtsAa/VD
         vY8f1JltGKbODYSnSAdve/OjyJkg+jIE8YiOWWqYP8ThzS9ucttBOAKbhAnIO9QHO4mE
         LIog==
X-Gm-Message-State: AOAM532A+vbVGnC8f82i2dbDW1Q9wGzVW1YjNZ99vk8gGyW5MQz6uLwO
        bMZyYFZ5Hlq+OFfYTGC0q+XdYrJRbc/SwEbqWWO4winmKi1nb7oAAmzSm1SbDBj31cfDvG272E9
        DMb7yn3fmiPLB1fFQzVRpR7xBDo1/BgNPn7Q1hHfElcAqd3p9MT3y2livjUTky13Pk6eRX0N5tX
        L/MH4M
X-Received: by 2002:a17:906:b55:: with SMTP id v21mr1292868ejg.88.1624279264412;
        Mon, 21 Jun 2021 05:41:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynWFPGDBeQoVs0wQFxZ6ukyvwpQ+InHpUPcAZ0QWYBeYA1wQXU3lIm+AdsMolUbicJN1wqXA==
X-Received: by 2002:a17:906:b55:: with SMTP id v21mr1292837ejg.88.1624279264280;
        Mon, 21 Jun 2021 05:41:04 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ci12sm4817907ejc.17.2021.06.21.05.41.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 05:41:03 -0700 (PDT)
Subject: Re: [PATCH v2] brcmfmac: fix "board_type" in brcmf_of_probe()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Arend van Spriel <aspriel@gmail.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Franky Lin <franky.lin@broadcom.com>,
        Hante Meuleman <hante.meuleman@broadcom.com>,
        Chi-hsien Lin <chi-hsien.lin@infineon.com>,
        Wright Feng <wright.feng@infineon.com>,
        Chung-hsien Hsu <chung-hsien.hsu@infineon.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        linux-wireless@vger.kernel.org,
        brcm80211-dev-list.pdl@broadcom.com,
        SHA-cyfmac-dev-list@infineon.com, kernel-janitors@vger.kernel.org
References: <YNCHELb14+eNV94n@mwanda>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6e0b8291-8c61-c172-30ce-031910009d04@redhat.com>
Date:   Mon, 21 Jun 2021 14:41:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YNCHELb14+eNV94n@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 6/21/21 2:33 PM, Dan Carpenter wrote:
> There are two bugs here:
> 1) devm_kzalloc() needs to be checked for allocation errors.
> 2) The loop was intended to be:
> 
>  Bad:	for (i = 0; i < board_type[i]; i++) {
> Good:	for (i = 0; i < len; i++) {
> 
> Neither of these bugs are likely to cause an issue in practice but
> they're worth fixing.  Also the code could be made simpler by using the
> devm_kstrdup() and strreplace() functions.
> 
> Fixes: 29e354ebeeec ("brcmfmac: Transform compatible string for FW loading")
> Suggested-by: Johannes Berg <johannes@sipsolutions.net>
> Suggested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: Basically a completely different patch.  :)
> 
>  .../net/wireless/broadcom/brcm80211/brcmfmac/of.c    | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
> index a7554265f95f..8ca62cd0e8ac 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
> @@ -24,20 +24,16 @@ void brcmf_of_probe(struct device *dev, enum brcmf_bus_type bus_type,
>  	/* Set board-type to the first string of the machine compatible prop */
>  	root = of_find_node_by_path("/");
>  	if (root) {
> -		int i, len;
>  		char *board_type;
>  		const char *tmp;
>  
>  		of_property_read_string_index(root, "compatible", 0, &tmp);
>  
>  		/* get rid of '/' in the compatible string to be able to find the FW */
> -		len = strlen(tmp) + 1;
> -		board_type = devm_kzalloc(dev, len, GFP_KERNEL);
> -		strscpy(board_type, tmp, len);
> -		for (i = 0; i < board_type[i]; i++) {
> -			if (board_type[i] == '/')
> -				board_type[i] = '-';
> -		}
> +		board_type = devm_kstrdup(dev, tmp, GFP_KERNEL);
> +		if (!board_type)
> +			return;

The error handling here seems to be lacking, specifically
this error-exit path needs a of_node_put(root); call (or
a "goto put;" or some such)

Regards,

Hans



> +		strreplace(board_type, '/', '-');
>  		settings->board_type = board_type;
>  
>  		of_node_put(root);
> 

