Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFA217333F
	for <kernel-janitors@vger.kernel.org>; Mon, 25 Mar 2024 13:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711372758; cv=none; b=duX74wslmvlZ890/iXLQbmtE2QK7eTHyta4xXEPby9dddD0xLaJsMvX+cAJrPgnfuqNiWMJmxtgFT9RA1PbA6bDIZ3P1QZTxoYoyIUKsDsPIqHC3joicYYQ+VWnfUCol9nJk2uR/REMDls/a/mIsWhfnyUFIDt9Vr09a9zkaFqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711372758; c=relaxed/simple;
	bh=94oaHfW8q3kkUiIIR/cmjM+I50aKVNB68akJ1g1OjWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cSx8j8csyDYvcTDHqbJz4kTE+AEPIeZ5Fp8uUR1jODiPhha2NDhITKbwbgQJj77e322tijNmU+kLDuwiOi3KEw0gaI8RfmIdP31+nxRjHOmNDrEjLFUyQsfHEWns5FbVllTxxoKvH4+hvAyOrNZQtDNMd/sXodyyiGb+tLewwRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HB7HxWMB; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HB7HxWMB"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dc6cbe1ac75so3341983276.1
        for <kernel-janitors@vger.kernel.org>; Mon, 25 Mar 2024 06:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711372756; x=1711977556; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7uWWEosiNkhyTUXt6it9vKWgUnpfWnt4Y8zWTzw+zh8=;
        b=HB7HxWMBFxrRfiWdRnyd8CJb3LruIXC1B7VQjMgfpsfXAizYZRWe58lqmYZFcTUIxs
         P39tIC7AE0Sv4HTS5n3k7vD8xfn3FsxwHvOn4TWW/Tc1dacMnVvuTLTe6Wpsu2quBM9t
         OZOulXIf/yxjUXBmiSz61vdfdpk5VbwEL41pMNn8S5sr84jAb9vdC7xlM7NXlhXretr6
         w7XmlHQUptWcgR03sNF94qO/u/+yFC1BQqmS6tacBl6r5bprsTh8kU3cm6yegVhzlOr4
         KcRzysrhkvzEXD/BWyNHQJlDtvPTugbCsIztgRnUb9sQENkk2RwmXqY3W3R2uK8gF0Sl
         yb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711372756; x=1711977556;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7uWWEosiNkhyTUXt6it9vKWgUnpfWnt4Y8zWTzw+zh8=;
        b=S2kiFow7Xl3Rz2eFYdbv7UG2shWOxqF2Khp0Y16tm4fkk+3131VZ+NAbTzp6+5qSRh
         KlzAC1u9XrtAGGOTY+B24fNn1BOL6eG0I07qI8Kr243F4bMTADEtHd9ohFCwK9q1nVZo
         PNpLwhJZpLYZaH/RLjtpmh/aHRyEuNOjCqHzSCG/ohxz3j2LLaQSM3JDlSbTEklbny5U
         vbZlH3OIYlJeEjo+TryLEpRVXUhocLLzSesGAB5+/KIT7R7mD37UIB0KHIgQAy+hTIun
         l+NrhoGdeWMcsRWN97tkrdWnyt6AI+x+1T7ImXwaGYr0HLaqqHrbXCh3t+FrtFz0KC51
         rWQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTHN1NokW1pURVcVsffhZX5oIH0iJb2ikD23v1KX3+YFaZYKLaDP8FBR1lEaimFl4eRSPJFPuzStZ12vHYTGnnY4vZ/tXzL8SvHzWfCJ5P
X-Gm-Message-State: AOJu0Yw7NzPaDIPnaSVqKnLJVPCeQ+k3WYb54R5Z3oQAeitxOe/yy3El
	1png812ViMUbY7JnGaeqNu1hxTI4ZDEyl+NJSf47r0FxkTTopnGBL6b/KoFLyzfwBkhtiKVDeEQ
	YsV6RPPG0sJjAFpo+OsDpWnZZQ77Ph+Oj0U+LsA==
X-Google-Smtp-Source: AGHT+IEAfx8jgfQzVNhKjIT/4Qjs9TEvBHG0zgnv0QMZirUu+xrnxo3NKC/nMJMjbv2KThVVcOczG2lGb73/4zgma64=
X-Received: by 2002:a25:144:0:b0:dcc:97c:5754 with SMTP id 65-20020a250144000000b00dcc097c5754mr3015583ybb.5.1711372755810;
 Mon, 25 Mar 2024 06:19:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240307122129.2359553-1-usama.anjum@collabora.com>
In-Reply-To: <20240307122129.2359553-1-usama.anjum@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 25 Mar 2024 14:18:40 +0100
Message-ID: <CAPDyKFrmJjv1WEc2yZFXKHxtN-vbS1k3VMeRyKdFiJkc5Uoimw@mail.gmail.com>
Subject: Re: [PATCH] mmc: dw_mmc: remove unneeded assignment
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Jaehoon Chung <jh80.chung@samsung.com>, Yang Xiwen <forbidden405@outlook.com>, 
	kernel@collabora.com, kernel-janitors@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Mar 2024 at 13:21, Muhammad Usama Anjum
<usama.anjum@collabora.com> wrote:
>
> The err is being set to 0 and replaced every time after this
> assignment. Remove this assignment as it is extraneous.
>
> Fixes: 25d043841db1 ("mmc: dw_mmc: add support for hi3798mv200")

Again, this isn't needed I think, so I have dropped it.

> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

Applied for next and by amending the commit message prefix to "mmc:
dw_mmc-hi3798mv200", thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/dw_mmc-hi3798mv200.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/mmc/host/dw_mmc-hi3798mv200.c b/drivers/mmc/host/dw_mmc-hi3798mv200.c
> index 989ae8dda7228..96af693e3e37c 100644
> --- a/drivers/mmc/host/dw_mmc-hi3798mv200.c
> +++ b/drivers/mmc/host/dw_mmc-hi3798mv200.c
> @@ -133,7 +133,6 @@ static int dw_mci_hi3798mv200_execute_tuning_mix_mode(struct dw_mci_slot *slot,
>                         goto tuning_out;
>
>                 prev_err = err;
> -               err = 0;
>         }
>
>  tuning_out:
> --
> 2.39.2
>
