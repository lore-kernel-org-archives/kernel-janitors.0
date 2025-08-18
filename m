Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BEF258EC6
	for <kernel-janitors@vger.kernel.org>; Mon, 18 Aug 2025 10:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755514514; cv=none; b=JqknFKfzevS9qGZczYll4hL0rPfEHu++Ezxis5g2ZsA7GEZcuZDpSIL9Pnqmxkqx4U95ZxmTRanbNKuCjRppoNpi2ChtlEo9ikYwL9YYZL8h7VI5qfmnKvqF64dM8XNdoj4STtBb3CYwm8dEsYsjwkw69XgrI/QY9JfOCNV/vQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755514514; c=relaxed/simple;
	bh=HpNccza3p8v2vE6GFzePxRiQVMDCc6soH+W3WfHy8pI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LGEh1l/LuTDfMWFAgH+iDgVOaaltFiy0DNIJUs3fzuYVjSLnliyChZAJq6ivADJ2Jp2eZqA3l3aiwKh66VRVemImUeoqhGB8TAlRkE5qo/dNaJ4hjX7VUuuob4ca3bjxR6A6xpTdxLYMfFJPmjMhn47e2zDzFPaUoSVEPvJgu3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WZ5hEvgq; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WZ5hEvgq"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-71d60504bf8so33609217b3.2
        for <kernel-janitors@vger.kernel.org>; Mon, 18 Aug 2025 03:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755514511; x=1756119311; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zy1IorWNS34FecdFEvi5FhAZbBdTEKAgjIL+i6/fu6Q=;
        b=WZ5hEvgqwdU+7GGP2AldpIwPArLri3vLOzYfIfHn4nHgCRK625R7V9d0QVr2qGAYLP
         EXlfDQBOgQdRO992/3Oyua7dZKVoU3rV6Z1zQDjC9xjaId/kWNRJB0hjUB15QJr7dP5u
         5YliamSRNtU2KeKTYjL7rRDv/CC9Tvs1sqwDN43b/VwfDb1CHyy8M4Wf2qA8Gzp2BblG
         fCQy6lLr7iJaiW6rQofm+zF8ef2smP8SkS8L7cbGoEJUQEc2i1Ztn6m9IvJ1zANrqhs/
         VL4xkacR2dyH6rXBWWIeLa4GC+2N39+B0XryaxRRcYLRBnqRzVSJ+YOGZynnO9dolD7Y
         0PHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755514511; x=1756119311;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zy1IorWNS34FecdFEvi5FhAZbBdTEKAgjIL+i6/fu6Q=;
        b=sWv8djc0uA435kdAqFqZJDcaVT94yqS+JwumR6wfr8vgYMdzzUJELTgVjxgHT93Xuq
         j0ym+i8PTMXmqaoTSlfzJzigPeJd13RKcXQSQMqMuLsFeZUqXQy532JU+kI9nXKPO+gb
         ARoPJ+myiBP/CpX+Ogt6iOvTq5IroNM0fRi1FRLt52Tt9uk7UDv3kgyMRYiSx8KDgLqL
         E0eTasROu1s2aCetZCTrZBt/3xZSDNkFfVe/3Rr3d8m4zSxGQ40HNMuU8PVoyaeTXHy+
         2Wwz4BqWg5miY2vE6TKF3Zf12CbcgJIwC1BaKtVSvTfqJiJ03/Oa07mFbohKFj5T4VzH
         8vMg==
X-Forwarded-Encrypted: i=1; AJvYcCW+eCAw/w0dPLwqcgaaQujylOQZmGwym++wELkH2rbWYKBAivBRSBoV6nQsBqE6GZfKHJInNe/eaf7VNC23sGI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCcKzoNAhl7LMveEo7HVlygTBpRqeg8vzHO+8BgI6jw58TuPuX
	Ib1DEundTBU2U9dfLpK66+wmz03YH8cdg/bZNPazH3R+9QDlrSxHNVenBBb9+0Ew9aKwyUDkMhj
	k2v2RqcsZ3sixrVb6tWgK1LnAouzcJ0NeVUlqDHdbjA==
X-Gm-Gg: ASbGnctPsJN35Zf0VniYvaieodJr5mufkOY6neAvWevl8OCvIK+YvlwbPKjgBSasu1s
	nb5fgYA3/+tLuzibsu6FCrhaCdUpXhPPy+HLT95WfnqQqH9jERsu79Pbugfji0LpogyTWZSdCUt
	zInk5WOQDytLhlSKQwRbcsCvgc9rSBJ6woHFi6hD1beyymLD3plAx+ctVRy0PscQySV5Pcgjp6b
	McpHGEh
X-Google-Smtp-Source: AGHT+IEboBf6c0njtMAWRhLMOeerkvYUC/RpB+BHwi3FJenNwXNu8sDBXzeAxKFWYduZF9LOAJuj4ffV/2Ux+0YYIgU=
X-Received: by 2002:a05:690c:23c4:b0:71c:4152:82f9 with SMTP id
 00721157ae682-71e6d9f11a3mr132543537b3.8.1755514511272; Mon, 18 Aug 2025
 03:55:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724112817.142784-1-colin.i.king@gmail.com>
In-Reply-To: <20250724112817.142784-1-colin.i.king@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 18 Aug 2025 12:54:35 +0200
X-Gm-Features: Ac12FXzzABoPhZpmLWeQec_PNYAHBcPqx-MkWfT1zRFWCwObMMPA2QDob8U7l2w
Message-ID: <CAPDyKFqQJsBjaVotzRmL=pHWLmJnOiXUaQN5yo0oheiKyw8T+w@mail.gmail.com>
Subject: Re: [PATCH][next] mmc: Kconfig: Fix spelling mistake "referrered" -> "referred"
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Jul 2025 at 13:28, Colin Ian King <colin.i.king@gmail.com> wrote:
>
> There are two spelling mistakes in the config. Fix them.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 7232de1c0688..4afa0130779d 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -359,7 +359,7 @@ config MMC_SDHCI_S3C
>         depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
>         help
>           This selects the Secure Digital Host Controller Interface (SDHCI)
> -         often referrered to as the HSMMC block in some of the Samsung
> +         often referred to as the HSMMC block in some of the Samsung
>           S3C6410, S5Pv210 and Exynos (Exynso4210, Exynos4412) SoCs.
>
>           If you have a controller with this interface (thereforeyou build for
> @@ -401,7 +401,7 @@ config MMC_SDHCI_SPEAR
>         depends on OF
>         help
>           This selects the Secure Digital Host Controller Interface (SDHCI)
> -         often referrered to as the HSMMC block in some of the ST SPEAR range
> +         often referred to as the HSMMC block in some of the ST SPEAR range
>           of SoC
>
>           If you have a controller with this interface, say Y or M here.
> --
> 2.50.0
>
