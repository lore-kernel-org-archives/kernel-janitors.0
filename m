Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3289D58131
	for <kernel-janitors@vger.kernel.org>; Tue,  6 Feb 2024 11:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707218332; cv=none; b=RZZoK/CeQ6whDAVDa0UX8Fu6D2AgKEuH4HMAeR+XIUuBitKDugN5kZKJ2NoD0r0JXj+UbMaWOoBX7NpYYJEcUB78y1isu/aySBDoOs35+c322DuO4Mf9IRntsuiTCZipbTGnr+f/XxCn+DIAM/feI6Pug6RZSb9lNn8XPoUGSNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707218332; c=relaxed/simple;
	bh=RAUcQj04TyEXEDqfDrWDiMlYnTPZzSWd7J0PrXfQYhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q6CNX4fERPl0/GEJ5v5sceI6hgzDeAWYMW0pYtdnduJpQKE0FINYZQ3k5uEbsWQoTi1hpuXEB8ZAtYDYH/xsKbxInaPgRsibyYg6iBGn3NXm8w2jfaDzxQwQ7CsjMCm7oWJ3pdrKeTdqdYF6Vc99wQesUO55pRnxLMpUjhmLHEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y9DR9RcL; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y9DR9RcL"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dbed0710c74so4715958276.1
        for <kernel-janitors@vger.kernel.org>; Tue, 06 Feb 2024 03:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707218330; x=1707823130; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e345+swzPUmQgd41l0m3kNKJ/xmdbW17sX8/bM58R7U=;
        b=Y9DR9RcLqQquZMzl8oG+qCFOpkWKgKCZWiikR6jOKzHT0OmKaujpl377FvtPE42WhT
         Gj2Nb0qHAUy4L/ovHudsCz1YiH4ECaZoQ059ROUZDbUNkA7u4bw4jjieiRoPhpiezaa2
         cKEt8jdbQXgkIUpXgOoVnSMci9XxjMC49hwiJdmE5BQNpKemXLkOwdTRxJJZ0b26VjH5
         12pXlumv80QUZ3owU4AzbtaUGrJbfACXG0f26o5Wdl/uE6STcYMxVTpJp0S/JKUiK9Dn
         GiR1iOU5kGEGCbyzqKhPAphO8AJY29h4NSowg/FNXAJ+1IzgzOEOKA8tIJh+XLRwRS9C
         +ZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707218330; x=1707823130;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e345+swzPUmQgd41l0m3kNKJ/xmdbW17sX8/bM58R7U=;
        b=TUnA2hnW0X4lrtaaeDWLuRubYlhG8dxZqgpgc8dWFEFA/UAKvDd+8arRnKArdRDFob
         gQZGeQcqFa+xwMQ4a/3bdBTuYrhFG5WxBkWuBG5zGKXFnJH/45lWnrBDOaizqPbsbGX/
         1nxs9XLY8c5ndIiNlp9HVAF+Klddc5HzhmT3AB9ns/hsaYS2qMh5xvt3ygLTyydxwthm
         WYW83zP4YNy15ZakMhJKOGmzIVPsfTEjXEhqvwGfNIW8c0nE9HWsjr+/Uvkuv1NsXfB1
         WL2lDuK9g9lbpZTwz3fQLqANiY2PjZnWI0rpfMvo51TnYwN3vl+Q4yR8hmaIhlfyHBrr
         DOHg==
X-Gm-Message-State: AOJu0YzegXFiuIiW/5RHjN+fC7svyDtk/75vVWmcDFq1eppFWtF6ZS/M
	9GsCmMKlJALM9xhrFCN3Xmi0Nw5cS+S9sDwr59eYF+5+6P16bVUTnOtdJbZ6Mmrz7ZPqbwLyXkd
	SWAj/el/mmAoWe8IsglM4syjvmBxec2no/nB4qg==
X-Google-Smtp-Source: AGHT+IH5fKEJpfHApHOplFSXWwd53luljuax/eSuatIgasfLKxsU+SyYcCYNNtHkP+jet8LCGSrmSvjmsvLU/HM9H40=
X-Received: by 2002:a25:840c:0:b0:dc6:e8b3:9ffd with SMTP id
 u12-20020a25840c000000b00dc6e8b39ffdmr1292874ybk.53.1707218328670; Tue, 06
 Feb 2024 03:18:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205191310.1848561-1-colin.i.king@gmail.com>
In-Reply-To: <20240205191310.1848561-1-colin.i.king@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 6 Feb 2024 12:18:12 +0100
Message-ID: <CAPDyKFosojWAaSWATX6hGh8cJ7yU3zCxheMSiKUsMgJmB1Y-+Q@mail.gmail.com>
Subject: Re: [PATCH] mmc: wbsd: remove redundant assignment to variable id
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Pierre Ossman <pierre@ossman.eu>, linux-mmc@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Feb 2024 at 20:13, Colin Ian King <colin.i.king@gmail.com> wrote:
>
> The variable id is being initialized with a value that is never
> read, it is being re-assigned later on. The initialization is
> redundant and can be removed.
>
> Cleans up clang scan build warning:
> drivers/mmc/host/wbsd.c:1287:4: warning: Value stored to 'id'
> is never read [deadcode.DeadStores]
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/mmc/host/wbsd.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/mmc/host/wbsd.c b/drivers/mmc/host/wbsd.c
> index 001a468bc149..f0562f712d98 100644
> --- a/drivers/mmc/host/wbsd.c
> +++ b/drivers/mmc/host/wbsd.c
> @@ -1284,8 +1284,6 @@ static int wbsd_scan(struct wbsd_host *host)
>                         continue;
>
>                 for (j = 0; j < ARRAY_SIZE(unlock_codes); j++) {
> -                       id = 0xFFFF;
> -
>                         host->config = config_ports[i];
>                         host->unlock_code = unlock_codes[j];

A few lines down there is check "if (id != 0xFFFF)". Looks like that
is a redundant check. Would you mind cleaning up that part too, as a
part of the $subject patch?

Kind regards
Uffe
