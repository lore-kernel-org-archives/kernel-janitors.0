Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050C338FA1
	for <kernel-janitors@vger.kernel.org>; Thu, 19 Sep 2024 19:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726774767; cv=none; b=QaZBu/wqpWETRMzyOUvm38LCmcRpNmKY3JBO6LXtwde12ujyM0hoq8gGxziUteYcmJPvNpcSDXX5/7up0C5vt9aBcQ6x0ZYPe4RTG95UBNBlXgal0PK3f3MbfaCDpAhcAoTI5YSGtVk4gv5kDu97y9J95N9xK0unLxQFV49TaDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726774767; c=relaxed/simple;
	bh=fof4Y+XqAIEawmDZiNjGYccb4vYXEW3pxTGZwYqjodc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dzmLFC9Cqi+VsfkdyGNB3VVlmrVzIGdMoy4pG6ndFw3AufAzJyPYSI7uIocuMkfjZJLEoNycMtKO2JBW7ZMiOZQmWEyABzeY6NBvkC1ZKoiTfz9HOp8L4Pl517X7ajM2poUTWX+3wOqLb2juanITXaXzLcGfpirmgy0SwmvNhaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BW3ZihHQ; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BW3ZihHQ"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8a6d1766a7so176422566b.3
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Sep 2024 12:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726774763; x=1727379563; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W7DLrUqqQ4L4ci5VnJmW7hDeRDd57P0ACw668zHYYqg=;
        b=BW3ZihHQVyhgyRPxhILVRVsjkSI5rqeYl6iDkgXipNfyLE3B1Lvow+xh00k9du/1UI
         NL1nt0ILIkLN0I2SWbLfcFw2R5sMsmV0nW0p5n0kPNvDqe8KxIJktm5DWoxV9vbcbmki
         UeB/x9HGboOzDVz+w8FddXb8hbldwgpfh3OGt0UQo/4Lx309rXIoshV82vL7KR6VXkGq
         pQ864xa3z6pMX6wbKgn+XQZA5w9M9Af6DG3HYSVdly+FVui3pmpKh0V7z2xVpPKwTr6u
         6qss0myJTOfEFWrOwOmQgHrFY49CgQisVKOdd5TOnCv/MuLY1Ka2UzfrvTNIdV/V44C8
         TmYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726774763; x=1727379563;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7DLrUqqQ4L4ci5VnJmW7hDeRDd57P0ACw668zHYYqg=;
        b=MU1lCJRf4EAjnBBb/lT7dOSb1lLbjm55q+AGFmuZNXqPfCAlmXbx89WYfSJtD6gNza
         cubpT31LIUAhPqXUXzDvkWV+OC9GtQFvXlCP7vElitHmT/vDzyIOo5IizvnIJ9EjI50X
         mG1ZBN+WW4B5uRQJC0icMfm8wjaph+DPCu4UNOtOBBbXwvrt3wu3w72FHI45nUUtXHTx
         FzIWR944+6HmiahWrBWHgPNJYDLzPKrWh8r8ZnW10i230lPvWzaMz/ij9T3a791E9DKs
         cmKGuvYZ9df0+Y3GDEFR9IbtMUzP37zHDxqwEUK2gDdxTlDwnNq9Gd6k3y5efZVaY02y
         Ed3g==
X-Forwarded-Encrypted: i=1; AJvYcCVm02oOGaOVGi+h5FYU2D2nkbewDzpGnQMeMqgAdSfFbQz7DuF9xl4VoHlLNL+GhDI0lDtHfwz+6EHq4/cHDYA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNoUW3rBfyTYQmaR39DSK836eoRlBPj98VeI80yGhtasnLLHYc
	UTYy6FDW9nI5Eo3LphTXisVBNodKwRB8Xsj/vEV387FJS1IidUCZ8mnQo3L1Qhmy03y3yVFs7Ex
	47UimklkgL+NjaVkTZ6NU6D/x/ojqWc0CLQ+7GQ==
X-Google-Smtp-Source: AGHT+IHFssq6SEY8xmjw8fzlMOVLwF7nUAg01vJG44H7tx5slPYYutozOjG4yTxIRsVA+zkzobhXmI1ODIc37gj+aQs=
X-Received: by 2002:a17:907:c897:b0:a86:8f7b:9f19 with SMTP id
 a640c23a62f3a-a90d50eec19mr23301766b.52.1726774763253; Thu, 19 Sep 2024
 12:39:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3f3660af-4ea0-4a89-b3b7-58de7b16d7a5@stanley.mountain>
In-Reply-To: <3f3660af-4ea0-4a89-b3b7-58de7b16d7a5@stanley.mountain>
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Fri, 20 Sep 2024 01:09:11 +0530
Message-ID: <CAKohpo=x6CvzwcJjYscV6qTdj=K3qECjwNj-EV5L4n8O+-WoTw@mail.gmail.com>
Subject: Re: [PATCH] OPP: fix error code in dev_pm_opp_set_config()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Sept 2024 at 19:37, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> This is an error path so set the error code.  Smatch complains about the
> current code:
>
>     drivers/opp/core.c:2660 dev_pm_opp_set_config()
>     error: uninitialized symbol 'ret'.
>
> Fixes: e37440e7e2c2 ("OPP: Call dev_pm_opp_set_opp() for required OPPs")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/opp/core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index 494f8860220d..3aa18737470f 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -2630,8 +2630,10 @@ int dev_pm_opp_set_config(struct device *dev, struct dev_pm_opp_config *config)
>
>         /* Attach genpds */
>         if (config->genpd_names) {
> -               if (config->required_devs)
> +               if (config->required_devs) {
> +                       ret = -EINVAL;
>                         goto err;
> +               }
>
>                 ret = _opp_attach_genpd(opp_table, dev, config->genpd_names,
>                                         config->virt_devs);

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

(Ulf should be picking this patch for now)
