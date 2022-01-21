Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F17C0C433EF
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 Jan 2022 11:18:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350161AbiAULSB convert rfc822-to-8bit (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 21 Jan 2022 06:18:01 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:50611 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbiAULSB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 Jan 2022 06:18:01 -0500
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 3595A240002;
        Fri, 21 Jan 2022 11:17:49 +0000 (UTC)
Date:   Fri, 21 Jan 2022 12:17:48 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Joern Engel <joern@lazybastard.org>,
        yangerkun <yangerkun@huawei.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: phram: Prevent divide by zero bug in phram_setup()
Message-ID: <20220121121748.24e98015@xps13>
In-Reply-To: <20220121053836.GA27293@kili>
References: <20220121053836.GA27293@kili>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

dan.carpenter@oracle.com wrote on Fri, 21 Jan 2022 08:38:36 +0300:

> The problem is that "erasesize" is a uint32_t type so it might be

Don't you mean uint64_t here? Otherwise I don't get the sentence.

> non-zero but the truncated "(uint32_t)erasesize" value *is* zero. That

s/*is*/*can* be/ ? (again, if my understanding is correct).

> would lead to the divide by zero bug.
> 
> Avoid the bug by delaying the divide until after we have validated
> that "erasesize" is reasonable.

I don't really get the fix. If "erasesize" is big enough, then
(uint32_t)erasesize can however be zero. But checking if erasesize is
zero beforehands does not fix the situation. Or am I missing
something?

> Fixes: dc2b3e5cbc80 ("mtd: phram: use div_u64_rem to stop overwrite len in phram_setup")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/mtd/devices/phram.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
> index 6ed6c51fac69..d503821a3e60 100644
> --- a/drivers/mtd/devices/phram.c
> +++ b/drivers/mtd/devices/phram.c
> @@ -264,16 +264,20 @@ static int phram_setup(const char *val)
>  		}
>  	}
>  
> -	if (erasesize)
> -		div_u64_rem(len, (uint32_t)erasesize, &rem);
> -
>  	if (len == 0 || erasesize == 0 || erasesize > len
> -	    || erasesize > UINT_MAX || rem) {
> +	    || erasesize > UINT_MAX) {
>  		parse_err("illegal erasesize or len\n");
>  		ret = -EINVAL;
>  		goto error;
>  	}
>  
> +	div_u64_rem(len, (uint32_t)erasesize, &rem);
> +	if (rem) {
> +		parse_err("len is not multiple of erasesize\n");
> +		ret = -EINVAL;
> +		goto error;
> +	}
> +
>  	ret = register_device(name, start, len, (uint32_t)erasesize);
>  	if (ret)
>  		goto error;


Thanks,
Miquèl
