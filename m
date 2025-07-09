Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC91D2D5C89
	for <kernel-janitors@vger.kernel.org>; Wed,  9 Jul 2025 11:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752060688; cv=none; b=jRtufxGQ7nl7zSeZtKo2+0MMGb9GUF6OEkvP4JtceV2QX7CJQWPER5fkhHBskJTfqzAHGtMfu4jm0rMGO2Yi8+eQZRn+28R3/aZcYiVKRXNv4Wt+kMIQroInAuEAIEPhh+iiIBMoi51RzK2dAub+8Ez6sAVtmeHLvBT0/NABdhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752060688; c=relaxed/simple;
	bh=N8QY2YLbLqwZxs7VhmrGcUAii95hVfhe2zG9GwU9b2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JWijhTq5AGltnY2roQrgq3SA2D5WojV29JHcik5ieuA3rgsvPWwLuRZjwUt1fXyk4cEZMT+qEaXUJw55NTapwK87YHgoEoUnijpAN3o5WKeb8jTxiTRunmC3wRvqevujdq1Y+UJgu7bZIiponesPBpu8TXNiicNUX5r4gfSFtiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EN7jCNpm; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EN7jCNpm"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-70e767ce72eso50263297b3.1
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Jul 2025 04:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752060685; x=1752665485; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CDvxz8anR+BJ4sHLfVXzhIbmkKQRFf6UUA1osiYchOg=;
        b=EN7jCNpmkIWhW6NN7O6gwnZKkXTKemOAomy/L64yPJHPV3EnFX1yqI9KsR1XHxnawc
         yra7yuFEYDnxRkZMcqzk8jnWcix/jf2MxDibQKNVy7CP1oR97d3Lmch6g/KpZQPLeL0M
         2EGvqk0wHv64xqxcTHKQlRiZLt+0U7cI/e0JGTr9dkxBs6JwwYwregd0rWS+Go5QsVga
         Gqa5fby62A1KAkPl2UhNE2wMJz2BQyOdHrdlxlwJK1jyyryjcylrKUSns//xIc8le4ET
         6qYDzpo13i2DkeJJhp7/R2z9kU6vPNEu01PHCGdDbkFfIbVEtc2nySE/ri9k0udNFQSh
         x5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752060685; x=1752665485;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CDvxz8anR+BJ4sHLfVXzhIbmkKQRFf6UUA1osiYchOg=;
        b=MppZKTgeWXU1Hz1sbMNLVxFH/X28yu44gyvh2pOxmKWuL9yeOq/UDUnO+E2jLpVOwc
         IbKf48bAK/QqPiqaGEmW1trigbNlUN5FGNgS+3sAcy/c43QNd9U99KxdapefuHJrK5G3
         K0uN6OF/Sz2EEb2ZBnULOY4iapFe6tPotV4B8fe8LaiailgZ4WVMSLk15wPTng0ivvyi
         Qb5UpKry7REP0e4d8vgTCPp4wWCd/2yZVRsHSx1AhzTHJ0O/s35fkO9kOVnC73dbxCN9
         50GdRfiWcBuk+TSdUtzbCs+Kivo1uv20rQLpB96a3ked9XtL6AeKifbtPHkS4qBQ5RcW
         B0NA==
X-Forwarded-Encrypted: i=1; AJvYcCUqScCcDAt8Jq2Nu70DI7je/17Kwl5V7Jl7lr2MY7p1CSGYfoDU4V0dyLcqS9t/SZ9A4diejUrHSPOsJxZWSv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHXL6LYpWMJP1nKl9xkgsFlWNOhCjLUSmWEaSLQRfXleeubo6c
	cJ1OH3CaAFw89Z4uUyrvWj/jTKhv36yCqONyqw577B9V/GymWqHRD0Q+7gdXUiwzcMmKSL2z19l
	akepTiUnrAtS2UZziZPKoSKceZ5CFPgroms60y1uK2g==
X-Gm-Gg: ASbGnctLrEpVb6aNX5hPcJ0aC+5Sun8aY120PTca0B8bJu7WfFqVwFWUc6JnBL698wX
	I0ELb4JchefYUaPrrOV+qYsA1AJF/zlG/5C5eyQUbkrkchrkhQNLt5rPw8j1kpj+oENJiE/P5VW
	0eQ7IQbqKRMJ3xnUP/Q2H2R4NZTRNnLzsH+XpHF/tLrKFnP3EGAaYERgc=
X-Google-Smtp-Source: AGHT+IGU+pji3u6/G/drrXD9f6hzZ57lAuY7UQylTxtmRHqJxsYBUBEDT5Y4GQThZIBDfvEDAxWsUuXsGoMFEvARnXI=
X-Received: by 2002:a05:690c:6901:b0:70e:2c7f:2ed4 with SMTP id
 00721157ae682-717b13c163fmr32649447b3.0.1752060684637; Wed, 09 Jul 2025
 04:31:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e71abd8d75dd842690e5a11e38037bcf5feac189.1751816732.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <e71abd8d75dd842690e5a11e38037bcf5feac189.1751816732.git.christophe.jaillet@wanadoo.fr>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 9 Jul 2025 13:30:48 +0200
X-Gm-Features: Ac12FXwjFFHXtdaaUqyy9FfmUbPYblM-fvRv4hnhCWqr-KyPAgwmhH4mdvxEDsE
Message-ID: <CAPDyKFr2VPbQRRx6hYp4e6by1O4LvpD=WwwP2gb2KCMTB8uQGQ@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: amlogic: Constify struct meson_secure_pwrc_domain_data
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 6 Jul 2025 at 17:45, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> 'struct meson_secure_pwrc_domain_data' are not modified in these drivers.
>
> Constifying these structures moves some data to a read-only section, so
> increases overall security.
>
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text    data     bss     dec     hex filename
>    9248     408       0    9656    25b8 drivers/pmdomain/amlogic/meson-secure-pwrc.o
>
> After:
> =====
>    text    data     bss     dec     hex filename
>    9344     304       0    9648    25b0 drivers/pmdomain/amlogic/meson-secure-pwrc.o
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Compile tested only
> ---
>  drivers/pmdomain/amlogic/meson-secure-pwrc.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pmdomain/amlogic/meson-secure-pwrc.c b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> index ff76ea36835e..e8bda60078c4 100644
> --- a/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> +++ b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> @@ -342,32 +342,32 @@ static int meson_secure_pwrc_probe(struct platform_device *pdev)
>         return of_genpd_add_provider_onecell(pdev->dev.of_node, &pwrc->xlate);
>  }
>
> -static struct meson_secure_pwrc_domain_data meson_secure_a1_pwrc_data = {
> +static const struct meson_secure_pwrc_domain_data meson_secure_a1_pwrc_data = {
>         .domains = a1_pwrc_domains,
>         .count = ARRAY_SIZE(a1_pwrc_domains),
>  };
>
> -static struct meson_secure_pwrc_domain_data amlogic_secure_a4_pwrc_data = {
> +static const struct meson_secure_pwrc_domain_data amlogic_secure_a4_pwrc_data = {
>         .domains = a4_pwrc_domains,
>         .count = ARRAY_SIZE(a4_pwrc_domains),
>  };
>
> -static struct meson_secure_pwrc_domain_data amlogic_secure_a5_pwrc_data = {
> +static const struct meson_secure_pwrc_domain_data amlogic_secure_a5_pwrc_data = {
>         .domains = a5_pwrc_domains,
>         .count = ARRAY_SIZE(a5_pwrc_domains),
>  };
>
> -static struct meson_secure_pwrc_domain_data amlogic_secure_c3_pwrc_data = {
> +static const struct meson_secure_pwrc_domain_data amlogic_secure_c3_pwrc_data = {
>         .domains = c3_pwrc_domains,
>         .count = ARRAY_SIZE(c3_pwrc_domains),
>  };
>
> -static struct meson_secure_pwrc_domain_data meson_secure_s4_pwrc_data = {
> +static const struct meson_secure_pwrc_domain_data meson_secure_s4_pwrc_data = {
>         .domains = s4_pwrc_domains,
>         .count = ARRAY_SIZE(s4_pwrc_domains),
>  };
>
> -static struct meson_secure_pwrc_domain_data amlogic_secure_t7_pwrc_data = {
> +static const struct meson_secure_pwrc_domain_data amlogic_secure_t7_pwrc_data = {
>         .domains = t7_pwrc_domains,
>         .count = ARRAY_SIZE(t7_pwrc_domains),
>  };
> --
> 2.50.0
>
