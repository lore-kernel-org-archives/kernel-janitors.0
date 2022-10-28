Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D23ECAAA1
	for <kernel-janitors@archiver.kernel.org>; Fri, 28 Oct 2022 15:06:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230515AbiJ1PGo (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 28 Oct 2022 11:06:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbiJ1PGg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 28 Oct 2022 11:06:36 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEDED208813
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Oct 2022 08:06:30 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id o4so6962447wrq.6
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Oct 2022 08:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/1Bni2amD0jAR8XTAOGCUubFB4RfYi0aSzsPqrZfAy0=;
        b=HkO6OxN6qsix7ydLktv9/mCo31nYQGtwB2WYmbr6zkVjf33/wGMKE91v0wcCP2ltjp
         h5XPSN0oWx1x7mf5ppIwtq4BnT5hwpr/Rz6MqBxXz+EWiTLC8vjANXLkyAmCVDBLu9u8
         TaeuZS4YHn/uq8AUrrRKbtX8MZIHpVMEK6P/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1Bni2amD0jAR8XTAOGCUubFB4RfYi0aSzsPqrZfAy0=;
        b=nsSxGejrUWDcDyrTi6+jQE5pJHXelkJ4gfuH2RfazviHTWTsRB2Aqd/f0m9aJ31nHx
         bRGld24vGPPSFvT+T2TMHPY7stqEw4HprK82PKm95LGKi1R01dTwdNwiWt9WShcmpFYH
         2dQo8U+NBrR0M32IZn1TqgmSPxMdNdZ+oEiSpnDhOIW+nLuv4NoeoBe2GVpXl4ovBkNN
         0i3s6OzmM2gA1uQaviZ50wyvV5sSLtk7I+2XgKv/PfMp416FGlTQg8agOkYigmdVLVq2
         BHsB4WUB7BQrhuSJ7L9hDUePoAkDqktL+AloDe7ACApwAbDR8cfCLvHytRb7zjJnfO+Z
         acmg==
X-Gm-Message-State: ACrzQf3FiQIRQNECYKoHaTs9GwAVXHcNZvryxzXDmMdOS9nQbcHM13Jq
        D3UZaKQ1yHuSIDhZQ8qkt3mecA==
X-Google-Smtp-Source: AMsMyM549Vj2K2MQt/E/1QlxV19rVfi086Dk5jtlJRWE0kj89yeiwtVyzMwbiIdHy8BW1WmAFNGWPg==
X-Received: by 2002:a05:6000:54e:b0:236:5818:d432 with SMTP id b14-20020a056000054e00b002365818d432mr24648306wrf.37.1666969589179;
        Fri, 28 Oct 2022 08:06:29 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i (net-188-217-54-207.cust.vodafonedsl.it. [188.217.54.207])
        by smtp.gmail.com with ESMTPSA id h8-20020adffa88000000b0023538fb27c1sm3908096wrr.85.2022.10.28.08.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 08:06:28 -0700 (PDT)
Date:   Fri, 28 Oct 2022 17:06:26 +0200
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Cai Huoqing <cai.huoqing@linux.dev>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dvb-core: remove variable n, turn for-loop to
 while-loop
Message-ID: <20221028150626.GA165737@tom-ThinkPad-T14s-Gen-2i>
References: <20221024142954.2162920-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221024142954.2162920-1-colin.i.king@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Colin,

On Mon, Oct 24, 2022 at 03:29:54PM +0100, Colin Ian King wrote:
> Variable n is just being incremented and it's never used
> anywhere else. The variable and the increment are redundant so
> remove it. This allows the for-loop to be replaced with a
> while-loop.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/media/dvb-core/dvb_demux.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/dvb-core/dvb_demux.c b/drivers/media/dvb-core/dvb_demux.c
> index 83cc32ad7e12..398c86279b5b 100644
> --- a/drivers/media/dvb-core/dvb_demux.c
> +++ b/drivers/media/dvb-core/dvb_demux.c
> @@ -233,7 +233,7 @@ static int dvb_dmx_swfilter_section_copy_dump(struct dvb_demux_feed *feed,
>  {
>  	struct dvb_demux *demux = feed->demux;
>  	struct dmx_section_feed *sec = &feed->feed.sec;
> -	u16 limit, seclen, n;
> +	u16 limit, seclen;
>  
>  	if (sec->tsfeedp >= DMX_MAX_SECFEED_SIZE)
>  		return 0;
> @@ -262,7 +262,7 @@ static int dvb_dmx_swfilter_section_copy_dump(struct dvb_demux_feed *feed,
>  	/* to be sure always set secbuf */
>  	sec->secbuf = sec->secbuf_base + sec->secbufp;
>  
> -	for (n = 0; sec->secbufp + 2 < limit; n++) {
> +	while (sec->secbufp + 2 < limit) {
>  		seclen = section_length(sec->secbuf);
>  		if (seclen <= 0 || seclen > DMX_MAX_SECTION_SIZE
>  		    || seclen + sec->secbufp > limit)
> -- 
> 2.37.3
> 

Looks good to me.
We save some space into function stack :)

Reviewed-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>

Regards,
Tommaso


-- 
Tommaso Merciai
Embedded Linux Engineer
tommaso.merciai@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via Le Canevare 30, 31100 Treviso, Veneto, IT
T. +39 042 243 5310
info@amarulasolutions.com
www.amarulasolutions.com
