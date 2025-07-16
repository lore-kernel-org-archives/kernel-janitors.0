Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAC02F3634
	for <kernel-janitors@vger.kernel.org>; Wed, 16 Jul 2025 10:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752660552; cv=none; b=Lxh1oKpxOSSCL9br2Ou4sf9JCWI6Zvqm+ukBEbn/za9UMzkcgVi8fdSv+7cEvnjwxp57hNTEP6J13mVNjKZMMp/jKNcmGivjSIG+oaxxpR+U6LRBxD3PE/amQzeimEMQOkQn8qGiCemmJy/H49nFIDk60cW+tI0ta0bj1CwjQyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752660552; c=relaxed/simple;
	bh=bYR1c9LIUL6l7D6Wuh18sl8qUWFTwYdOeejSsA0iDBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cbDEB85QG3iWjzR66F3K6WsCs1XO4oZuvvbRX1N0TUXru3F1KMn74RH2sVqVNFQaI0YyUrtfFnTw0KzQ2btbfZwdASZ7UuOUW4+qeE7ffc8e1kFOiUebNOukq2yhuOG4AzA32g6ZNjVkkdDN5SJPC7UFeGHh6RUVVXIBdAbXziI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sb7cT2DB; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sb7cT2DB"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7183fd8c4c7so2137227b3.3
        for <kernel-janitors@vger.kernel.org>; Wed, 16 Jul 2025 03:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752660549; x=1753265349; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aaSlIX5JSMkPDXYG9OHGWw9rTnf4dMbBtDMCUX1oXGk=;
        b=Sb7cT2DBKzu0dLJA4pKIFaNSayrw3zi+x/xQ1PZ07iSCbQWylfToz1gQ5LJTB+4eMk
         mBPS1BqqFR7JQDvuySXht3HTE1SOXSmNG9+dw8v0ny+BMr1M82EF4s/0gUIpuj/jXM5Q
         3uotcC4RsxC+YZ+DpnpxkHRX/NUYBOTxzaXh5npZtBtvwWPTipOUMqXkbCp026HlODlb
         Nzh4HmVpUcq+e9Jhf3miiQQ1Z6Xh/2Yq3iQNZ+FVgiM4X7AfkX+dMyvL0NNPbNOMKxec
         t6WUe9qhAxRCNbunJn/TdNP8v8OrA1ncgobXzOmB42NPXfT2aYp3cfWWSnPhAbDKCc6Z
         joOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752660549; x=1753265349;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aaSlIX5JSMkPDXYG9OHGWw9rTnf4dMbBtDMCUX1oXGk=;
        b=mvLkbVQYuO24Y+6MK1l2wZY8OyFeByP5dWz63DVIIb5xx3tJ4wohRXs7WPjZ+lchd4
         fu2s9vg4v1DccG17zsZ10a8ZfvS4bozFHxIvGbLmDolZi4gSCRK/nmCxIRt4VqZ6xMsQ
         y7Y/MyafbkcuxftJA1nkcSyujIdtnU0OGQFxSGToBPD6t6CSR1mHsTKx9YI3sD5UdwmV
         ZawEJPcQTRxViPP36U3AFWFQO9A0fZ83XSoUBixATK0UTS8YYBBnoQOMn9E/VyzJ7hKm
         p8Ytkmdq89bqPLvVRRtNxP555MoIGaFgo4M9BLNPrgRkDs11fYD0xqjHl2olFjiokujE
         3j7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXT2lEQlD3GW57DbVJmPJAgs3dJ+C1kS6S5whA5kDQERno0l7QUEXTdv2cNuYerZutKlSPTL7vegcDSmebK8gM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9M1udwYJZrB+frkz0d6EFStQAYWyyOIdjeHSm58barPKchOuD
	rmFh2W48aoDKj9Agw6gKRsaYWkTRAw/lYdYucees1g4xDWbYo7gQJY0WyA4k0AhxToZRV/Lcr3H
	S97dst8PmszmQJtsbP++RVQT4ZGmk5RNNjqPmtAodhpYiIgjdBoz2
X-Gm-Gg: ASbGncu78VVabaIU97knN0q29OpZJZrFF4f3Zkdy03PP8vxoSuxT2IzswrST0KSsUA4
	xs15/6Tt1PwL7AEeraBKcFk+noLUpy2zk4OK90omRrFb6JCwNEbRz/VF/H5uz1xP55sjy8mvXK1
	7m8bYT9V43GAnyLil4e5zUkTPPCRR5oVmQemsrP92g8IV0OXqrzKs94+D4cx8bStjUlm0FE3rYx
	+1lZIl5
X-Google-Smtp-Source: AGHT+IEVrqdnzjgna0nPf8/QlqPaakZ0z/Y4vr73ndJXG6lcTCHSif5oJvQaIYU9G6d6AxqzY4LsoRudWzSfDn6eIO8=
X-Received: by 2002:a05:690c:22c5:b0:70e:2ba2:659d with SMTP id
 00721157ae682-7183747da57mr24628487b3.23.1752660548791; Wed, 16 Jul 2025
 03:09:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <847bf395-6d62-49c9-a39d-8e82c5b17bf7@sabinyo.mountain>
In-Reply-To: <847bf395-6d62-49c9-a39d-8e82c5b17bf7@sabinyo.mountain>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 16 Jul 2025 12:08:33 +0200
X-Gm-Features: Ac12FXzW2XIbQtUDaHN3eu8QGSaXiZ3-1JrKO6jE043zd7_dvv1edcxvTnJN-Gw
Message-ID: <CAPDyKFqsP7bHrN6oBi0Wvy-MRZNko3uOq6wiH8vf9QxOeJuEug@mail.gmail.com>
Subject: Re: [PATCH next] mmc: loongson2: Fix error code in loongson2_mmc_resource_request()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Jul 2025 at 01:01, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> There is a cut and paste bug so we accidentally return the wrong
> variable.  It should be "ret" instead of PTR_ERR(host->clk).
>
> Fixes: 2115772014bd ("mmc: loongson2: Add Loongson-2K SD/SDIO controller driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/loongson2-mmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/loongson2-mmc.c b/drivers/mmc/host/loongson2-mmc.c
> index ba6bb8fd5535..63d01d2cd978 100644
> --- a/drivers/mmc/host/loongson2-mmc.c
> +++ b/drivers/mmc/host/loongson2-mmc.c
> @@ -887,7 +887,7 @@ static int loongson2_mmc_resource_request(struct platform_device *pdev,
>         if (host->clk) {
>                 ret = devm_clk_rate_exclusive_get(dev, host->clk);
>                 if (ret)
> -                       return PTR_ERR(host->clk);
> +                       return ret;
>
>                 host->current_clk = clk_get_rate(host->clk);
>         } else {
> --
> 2.47.2
>
