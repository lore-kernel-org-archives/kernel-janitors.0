Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131BA18FC6F
	for <kernel-janitors@vger.kernel.org>; Tue, 20 Aug 2024 11:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724154645; cv=none; b=cxkGhp4gFECGnW3q/wXDW9xhh1LR6dxRrmewIkvwq99o9rQioVKTnzsKsrHZKFCejw80rKVl5OU26QHYNGIyRB99Y1brh6qkts20ZVCZ+jaAb2OvmWPt3VdPOnvCpWJOchpDqYg4CkcACwT4RcR+tJRnhjwGRyN50TbZ9LZA2pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724154645; c=relaxed/simple;
	bh=+N0fCfo75321OdOJcVcEyAnRKFBXqAIaZvFl/KyVYCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vx4qo2liSlNzUtqWQeKR+gf3iBLUg6gDmZK9KRJZNA0qTM8LXRV7FQnsoYdafA4Vto2vez2CdrVjtNoAEoKSN6QMwTWvRVD+VzEnTgr1x7o4de3O53PtmxsJhAyEeqNdbIxC/Nzgtq3m7B6hQy2GXSvRn0j1hfpeEow70zAEvKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=naH22V54; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="naH22V54"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e1659e9a982so387343276.1
        for <kernel-janitors@vger.kernel.org>; Tue, 20 Aug 2024 04:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724154643; x=1724759443; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9DVd0Gefl7PHpJ5IcyG9GzUh0GMs/G2HRBX2T94h5zQ=;
        b=naH22V54vnmnpUC0mBpyC/NRdrlRbT6takB5P5dnQm3rOJKXC+Nd70ThDge7XAccan
         AeB1X+7eFglWcQjxhwmrpaRgRXvYWKr3nyllQlzsJ244GspXZfGy7BaareRy0GalWyQd
         yfKpEox6sIs1qfKPp/Gr9KEK1T1JMbNwva1Hkris63try70xC3L9HETl/7kcM9U31kis
         ILSPsWJP9wTxRgSGV14jKCFmDwGpp3IEwxHZMnCkmtsvO8bSFcTg8vEiZWPvHVJEBJMt
         qHnQmGL2D3SJm7SZBUqvxSoQlat9uvDsSOtjRX8E7M2WpB8CRyrd6zBlZbn0oYNTnxx8
         yVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724154643; x=1724759443;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9DVd0Gefl7PHpJ5IcyG9GzUh0GMs/G2HRBX2T94h5zQ=;
        b=Ky/MSJvNQwt/8BTaGqlkJACBpq3pTC0AFwH+LUCt1Gl7Lh9n/btKyBVBpbpdYAt9hX
         HpLE7nhsEdJZ5AV6fGlrSaFRgUw7BIcmuUyDwqHC+eyLO/Axu2v4zahjEVr2uV7hdUUH
         a2+aDP+KS57hAUrsOE2vsg1ruCvvwuibL0DH4ou/x61w9RYpaXU1MGhIzcsragG4XF+Q
         xFkcS/dX7odk/2oGLW69DDq7r2mlsV45Ts0d2HI7HZWjcnFl55ukXbXUlSUUb6VkTWqf
         tSn13uTY7+B6XdVBMBBuQaOVMgaJW3KIyLJN0yidolUJkF8QwMEaFbr20n73y4ctwhFe
         0law==
X-Forwarded-Encrypted: i=1; AJvYcCXS1LtLjtkCpfQN3DK/HOVpJBAIzQQKeCx1iODJI+44GLt4ocuJjgFl5dztV7gxwsMRYmn0bAUvLze/DC52rs0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1UGHXOyZA9Pgyf6C8616mtWcWBJSxwzLOC/RaaP5X980fvrzu
	itifBkSv+BRAOSlzadTdKHpXzX8AB3EX89Z/N+blizPP/PfWSfAFNSMcpDCT2XBlGFl8ARpf/dd
	vM8qRdKG1z5Y8NhVW0kt2HbhrV1bptJx5SpdIQg==
X-Google-Smtp-Source: AGHT+IEMB3TMQoKoMENuYx3+vgX9Vhmt9+GFb4+PSf+bt1316IqMO95UvkjliFqkRrK+xxXvuI3QTNie11Iwttdbqgk=
X-Received: by 2002:a05:6902:e10:b0:e0b:eb96:fd95 with SMTP id
 3f1490d57ef6-e1650d3fd97mr1995243276.19.1724154643077; Tue, 20 Aug 2024
 04:50:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8c90be28-67b4-4b0d-a105-034dc72a0b31@stanley.mountain>
In-Reply-To: <8c90be28-67b4-4b0d-a105-034dc72a0b31@stanley.mountain>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 20 Aug 2024 13:50:07 +0200
Message-ID: <CAPDyKFrdNWTsP_cKM4+RmmL-j=nu+r2HktFRxGxhcOhPcSt8vA@mail.gmail.com>
Subject: Re: [PATCH] mmc: mmc_test: Fix NULL dereference on allocation failure
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Pierre Ossman <drzeus@drzeus.cx>, Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Aug 2024 at 10:44, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> If the "test->highmem = alloc_pages()" allocation fails then calling
> __free_pages(test->highmem) will result in a NULL dereference.  Also
> change the error code to -ENOMEM instead of returning success.
>
> Fixes: 2661081f5ab9 ("mmc_test: highmem tests")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
> This code is from 2008 so it must not be that much of an issue in real
> life.
>
>  drivers/mmc/core/mmc_test.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/core/mmc_test.c b/drivers/mmc/core/mmc_test.c
> index 8f7f587a0025..b7f627a9fdea 100644
> --- a/drivers/mmc/core/mmc_test.c
> +++ b/drivers/mmc/core/mmc_test.c
> @@ -3125,13 +3125,13 @@ static ssize_t mtf_test_write(struct file *file, const char __user *buf,
>         test->buffer = kzalloc(BUFFER_SIZE, GFP_KERNEL);
>  #ifdef CONFIG_HIGHMEM
>         test->highmem = alloc_pages(GFP_KERNEL | __GFP_HIGHMEM, BUFFER_ORDER);
> +       if (!test->highmem) {
> +               count = -ENOMEM;
> +               goto free_test_buffer;
> +       }
>  #endif
>
> -#ifdef CONFIG_HIGHMEM
> -       if (test->buffer && test->highmem) {
> -#else
>         if (test->buffer) {
> -#endif
>                 mutex_lock(&mmc_test_lock);
>                 mmc_test_run(test, testcase);
>                 mutex_unlock(&mmc_test_lock);
> @@ -3139,6 +3139,7 @@ static ssize_t mtf_test_write(struct file *file, const char __user *buf,
>
>  #ifdef CONFIG_HIGHMEM
>         __free_pages(test->highmem, BUFFER_ORDER);
> +free_test_buffer:
>  #endif
>         kfree(test->buffer);
>         kfree(test);
> --
> 2.43.0
>
