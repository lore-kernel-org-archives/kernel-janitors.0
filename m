Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C50EB64DC
	for <kernel-janitors@archiver.kernel.org>; Thu, 29 Jun 2023 17:03:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbjF2RDU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 29 Jun 2023 13:03:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjF2RDS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 29 Jun 2023 13:03:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59D513591
        for <kernel-janitors@vger.kernel.org>; Thu, 29 Jun 2023 10:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688058148;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=GAvGrde4MtuxZLnVvBlSKLGykkv5j7+I9BzanVVshIE=;
        b=JlbVWR5skCl7lIBGH24UdIupWzGSYIdA1iHsD2r+rgAVnH8Jh5eBhPddBvubtC70HuT/DY
        izeNOmlW2g6zMfFcDuapjzCtSK7vg+8avfca26JOK8+xaJf2CtCRNEw3FzM9YsOgNx5QiU
        eAoU9CoN9L5y6ohEiGS4knmrWH1SOv0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-MeZYgjRgPXioEx7uTs1X3A-1; Thu, 29 Jun 2023 13:02:26 -0400
X-MC-Unique: MeZYgjRgPXioEx7uTs1X3A-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6349a78b1aaso6144176d6.1
        for <kernel-janitors@vger.kernel.org>; Thu, 29 Jun 2023 10:02:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688058130; x=1690650130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAvGrde4MtuxZLnVvBlSKLGykkv5j7+I9BzanVVshIE=;
        b=LkQ8lnqB3Hclz1YlX0CPT51YRsZdSzXvjEwjdeP2eyxrM4xASNf+2GiHWJ/FXmsOGs
         rYAmbuNHto6t9P9DOadLhDkk4KqCUn4dY8UlTZ9yuYxZtOKDMmq9yUhKYgoafzD+44Hg
         /pQH06mtOJ3PKx2A6GpIjva1PKXocDVV2mjoytFwMpnrwh9ug5GBPwLcOrNV9uwGBnoH
         vb9e1LXPy1I6o+Qs7tYtqQ+9oUWTOTdx76kdaUt7UNun1V+gbEV7d/DJ7bnzOCS9wt/8
         J9VaZlX8LHVta15GyeDJmo0sT7cP3YIiVO/QGgUCKMlH/L9xa9g1+5G+fKsIudRVKFif
         6org==
X-Gm-Message-State: ABy/qLZFxU2HI7oPPpcbJ+vkpAHJKfQMKGFg/zJdgryl5wdQEYB0wuqa
        kjxSnhsmJDxwGebTUENAZvTzbNXfQWXk4po8Ux4EDpVy9c/aYsNwTsLnsmPWhQ0zb4F7fQj2J27
        +4f5Lfn9Zd7bD2+Ozr/DCU3wdFmF0
X-Received: by 2002:a05:6214:4003:b0:62d:ed86:154b with SMTP id kd3-20020a056214400300b0062ded86154bmr570173qvb.5.1688058130051;
        Thu, 29 Jun 2023 10:02:10 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFIlZKSA03MUe0kuBlHNv1mmJ/JxAOE5u+mAyL+HRPpI6KWZRPdjJpykJjqW8orgC2eSoaCqQ==
X-Received: by 2002:a05:6214:4003:b0:62d:ed86:154b with SMTP id kd3-20020a056214400300b0062ded86154bmr570155qvb.5.1688058129752;
        Thu, 29 Jun 2023 10:02:09 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id p15-20020a0cf68f000000b0063631be090csm705644qvn.125.2023.06.29.10.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 10:02:09 -0700 (PDT)
Date:   Thu, 29 Jun 2023 10:02:07 -0700
From:   Jerry Snitselaar <jsnitsel@redhat.com>
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Peter Huewe <peterhuewe@gmx.de>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        linux-integrity@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] tpm: remove redundant variable len
Message-ID: <zsl2srmpmv5tezl7gbz3gruvuj2c5xwiovnyqh67b2qtm34v7z@5uppil2tvt5z>
References: <20230616170730.2343540-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616170730.2343540-1-colin.i.king@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jun 16, 2023 at 06:07:30PM +0100, Colin Ian King wrote:
> Variable len is being accumulated but the value is never read. It is
> redundant and can be removed. Cleans up clang scan build warning:
> 
> drivers/char/tpm/eventlog/tpm1.c:276:2: warning: Value stored to 'len' is never read [deadcode.DeadStores]
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

> ---
>  drivers/char/tpm/eventlog/tpm1.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/char/tpm/eventlog/tpm1.c b/drivers/char/tpm/eventlog/tpm1.c
> index 8aa9057601d6..12ee42a31c71 100644
> --- a/drivers/char/tpm/eventlog/tpm1.c
> +++ b/drivers/char/tpm/eventlog/tpm1.c
> @@ -251,7 +251,6 @@ static int tpm1_binary_bios_measurements_show(struct seq_file *m, void *v)
>  
>  static int tpm1_ascii_bios_measurements_show(struct seq_file *m, void *v)
>  {
> -	int len = 0;
>  	char *eventname;
>  	struct tcpa_event *event = v;
>  	unsigned char *event_entry =
> @@ -273,7 +272,7 @@ static int tpm1_ascii_bios_measurements_show(struct seq_file *m, void *v)
>  	/* 3rd: event type identifier */
>  	seq_printf(m, " %02x", do_endian_conversion(event->event_type));
>  
> -	len += get_event_name(eventname, event, event_entry);
> +	get_event_name(eventname, event, event_entry);
>  
>  	/* 4th: eventname <= max + \'0' delimiter */
>  	seq_printf(m, " %s\n", eventname);
> -- 
> 2.39.2
> 

