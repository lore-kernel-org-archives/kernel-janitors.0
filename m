Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992F21ADC97
	for <kernel-janitors@vger.kernel.org>; Thu,  8 May 2025 10:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746699321; cv=none; b=KbKa1+O1HLXn+qnvgRrR+LQyG6et3XE3MDNOkadIP4129V0vXfuZwVIbsbGR+Vqb4VNmSUZ9jyOa1HGR28+ir94kaWcNLzkIleResPpvPgN2MB3txZ/ieAMJjtIVfqZKmLwWqee4dVp2S6OU1VDWMyxQ+mjoVD2fFzZulw9QkbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746699321; c=relaxed/simple;
	bh=qhNsKNLNw5tmwB3UAIDERkC8dHitaFy99n00D7sMtvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dETJ3zycajtq8TtCMh98DCZuKmW32Yx7dRU4fBhPcDvjKcm2Y2Al6Bt9nVzydkTyjlTQkhDSp00vQMxweMMz8LrmJGPhOlMu0dcpLeWu1qvvT2vPmsfygAIIHvkrMszmRyc1DUEH0a3zJ9N59NvMNXmncmivh+r9T99ChQ0FIhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IEwe50iX; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IEwe50iX"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e75668006b9so901388276.3
        for <kernel-janitors@vger.kernel.org>; Thu, 08 May 2025 03:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746699317; x=1747304117; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gpNKcie2UhGLpgDU+EfoQWjK/q5dcvHwia1KJeJcP0Q=;
        b=IEwe50iXy+VAW6dWq6aFlqUo6/kvIHAy5zsrJeV5WqOniEaizm+QpVTzvAtiDU6fLj
         VHvWROTzS+NJBP0XBcFR1Q2WQFZ42nYEQqX9CMUJLqi7zfgFapgK7uu3vjY0YKQMYVy7
         qNfh2G10V+io7+iwENa5VY2pkfyCiJRIuwbFv4qF+GNtJzUIxEc1Q5A/etLdxrcpA/9R
         RAaehVuSzY0rP4mQM63SQfykZnPUpQgmErVoFTUSKooJPBL4DNhzzSWsQ+Pre6y0gDs9
         u04RpUTzqqFGJ28r4LVrsYHtKSmJUJ/vtI9tEn8bn5CDuoDXLZn0gN9CFfd3Mjd9B5AJ
         g1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746699317; x=1747304117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpNKcie2UhGLpgDU+EfoQWjK/q5dcvHwia1KJeJcP0Q=;
        b=Yh9oHG5JlpK/9IKVfZYmKcd7FA1q8DrgNJvkMHQIC4DL38iWLrepJNxjtQUoBFarJ4
         0m9OAMLMkzWuSsfvt5Fx06TuOQ+EuqoRBK90VzemaIbMake2KvzuqIScANUHPCnnR21V
         M/gsiZzhX3tl3BCBkbKUKYb33V17eOd+aNAq3PYUKhU72yNRWpAjhuWaZlPafiygUc2s
         5OFFpZHmzQj/Dvi6qV44mok6FUw0k/FFJla/YxyoY5RpHmuMYtp1qw35gptF4WYx26P7
         EW7X2UUP5yN7p1OPwliJwg2ve+n+fMz9PJnwc1Q+m/OciguU1UmRk6LPi+6G2fAzYC20
         N64A==
X-Forwarded-Encrypted: i=1; AJvYcCXXKJx/TUwTiBQ/5gS2VRW2OmKBtqH+fFcyU/z/I/ZK7tcHqabFU1yxBkF6L5Cec8jAvo8lCfMejoaqnPgFHGE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW0oVyAfHt5IytmzQH265obtUUmSpqtFlQkDKlbZ4y5wtQjbvy
	LILawafTljV3MZBGgKOqgrt+dTcCPlqVOZw+qQJFff5iWBoVrc/pdQXcYhOOeNWmilvTzdAB7QY
	dMJOYVJ5iVQ9BQ6rMTeV2KSx7IO785T1D4h+iEaA6WE1K/HB2
X-Gm-Gg: ASbGncuJZI+RI2dLUSB7vgTvjNF3IAeQTGNiZAThu3PMsKMZTKdAfFhvMZ2b+wxyMix
	xq367rVvjy8xVu/G9BFViCHEo8rMcp0kFGraJQRYF1OMdqG8gLce6OANrvWWGgTpHRaH24mICu9
	xjhp8LhFNqzImaXZmfkUojgyQ=
X-Google-Smtp-Source: AGHT+IFZR+3HdpndujRIwAKAXYMyHzJt6gQWJhlrflCknDzCNNPyqtjJEyMg55oFZwNVRamj1dH6embSLYS37XFNcDM=
X-Received: by 2002:a05:6902:230f:b0:e73:1ff1:ca2f with SMTP id
 3f1490d57ef6-e78ef6f7c55mr3056251276.32.1746699317373; Thu, 08 May 2025
 03:15:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aBxPQ8AI8N5v-7rL@stanley.mountain>
In-Reply-To: <aBxPQ8AI8N5v-7rL@stanley.mountain>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 8 May 2025 12:14:41 +0200
X-Gm-Features: ATxdqUHgbU1sftWGZFEYCFbWV60qCjH22SvLEOP-bV81E5it0iQHN0cHPsZak-8
Message-ID: <CAPDyKFoZiEAn8yT8a9VZqayR1=HPnMn+a51O3zUAUR3L6RXH=Q@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: core: Fix error checking in genpd_dev_pm_attach_by_id()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Niklas Cassel <niklas.cassel@linaro.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 May 2025 at 08:29, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> The error checking for of_count_phandle_with_args() does not handle
> negative error codes correctly.  The problem is that "index" is a u32 so
> in the condition "if (index >= num_domains)" negative error codes stored
> in "num_domains" are type promoted to very high positive values and
> "index" is always going to be valid.
>
> Test for negative error codes first and then test if "index" is valid.
>
> Fixes: 3ccf3f0cd197 ("PM / Domains: Enable genpd_dev_pm_attach_by_id|name() for single PM domain")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks for the fix! It looks correct to me!

What puzzles me though, if this is a real problem I am sure we would
have been receiving bug reports, don't you think?

Kind regards
Uffe

> ---
>  drivers/pmdomain/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index cd4429653093..ff5c7f2b69ce 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -3176,7 +3176,7 @@ struct device *genpd_dev_pm_attach_by_id(struct device *dev,
>         /* Verify that the index is within a valid range. */
>         num_domains = of_count_phandle_with_args(dev->of_node, "power-domains",
>                                                  "#power-domain-cells");
> -       if (index >= num_domains)
> +       if (num_domains < 0 || index >= num_domains)
>                 return NULL;
>
>         /* Allocate and register device on the genpd bus. */
> --
> 2.47.2
>
