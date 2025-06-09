Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C735D25B67C
	for <kernel-janitors@vger.kernel.org>; Mon,  9 Jun 2025 14:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749479152; cv=none; b=f7u7/XohYPIdFlLFroBqW58Q3L5/goESqota+4xMTXbnk3xKs6uXGMSC+XqIRXZA6oLnuAlyVwA1l/me2wD0C1kFuf0s9D9b5ZdltGwrauhAFBsn+UZDDwbvZgjvmpH9wfp6t9L+nA/NAKXiZSHu7xe/ATKG+fBVlVsrRa0L/wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749479152; c=relaxed/simple;
	bh=tpgFqrLkSn1DVjpGW60JOm0C0+VLH7tHHY59kM5bL/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m3zVrKNTG9D53iz6Tm/2m/DbMsbGhyUr8GSnckNCEOA9y8mSnNf3fH0bSEdKW/ADgdIdgz4/89pT2amq50Whp8uTgewe3HLpBLusOQc3WxBGZQjEy0WahSamfNZK0Cwr8p9HHtDWinB6VIq6xh6/4bWZYjFDSJ17Mpx/OaGkyGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AVeiup7S; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AVeiup7S"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e7569ccf04cso3562312276.0
        for <kernel-janitors@vger.kernel.org>; Mon, 09 Jun 2025 07:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749479150; x=1750083950; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/DHcPIW+FNlaQudxh/1xCvJS+KJ4L+7fwYUL5LAEe78=;
        b=AVeiup7SMc5rGeff8WBHr25QSzFULA4reLpqGP9vvcJx0uas+s8tPcLx9zk5JCr9mZ
         fqHTN0LDYxZFPRKr9SgEqQsKUFTdxOXsAQ9b5SEAsUrAfw/g1ZQhLSqjLTWVlnpVeOdP
         u5aNFLsUtUtkqY4Sw2g41IaWtbHnOo3Ry07YhAtmgRwsGdUNEPXao26Ki1iNFMCD2xZk
         8mJ0BUxg0tXFUciK17rHRtf8rDV5moBcza+7UlOMMU3KZFfhWunkEixvirixOpLpNGvs
         Yyd4a1TUnqbZzJSzoAsBTcFXCFZ3Q+678snQ1DqVAW4o5GRmEC0V6rL39SP6ZmD8tTai
         rZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749479150; x=1750083950;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/DHcPIW+FNlaQudxh/1xCvJS+KJ4L+7fwYUL5LAEe78=;
        b=vO9oHnKVMRqCtDUOTR27DWYU7urYYJK3C7s+KOL85hPvfoNjvKT1PXPigYa+NO8tau
         BALrUaSvIA/43P+WG7GgP/6bBcd/ILzhC9tm1DCG9icegVG0R5p9xJQktoyLwKSO1KPR
         SwsuLc5JTa5mM+OVhsRNRcFiNJYxEN8A0mpAJv1EuEW+jcmUI4qXGA3fkrp59a6MF/e4
         cCnBJzJ4SMxH9qcxQAasmUwn5ypxMFQCEcKZHjEIiJQE2txgX7Qk1bSTmI3+5pEyO58W
         lTSu+gWVvmdUukIWVLMDc2Z/REGiJnYym+K5itKUIWbvNT4JEheDhcXZUxlqwuai5XaT
         gP4w==
X-Forwarded-Encrypted: i=1; AJvYcCUsVQOr7CVEH0AoZfYUl90JprtFsBL4FruUeROxtKBm1iBfiU/bEosVz0fD6OzmW+CjZHNUqE98AkT5sy2m7Vk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs6H29d0qJa7963YYsmO2V7qmmoG7207qOtnQXbPvSYKIe+AsL
	tVXlhr6gLExHDA5UFuUV72onWij6fH4z8r6cR5wcS+/lxEr8RGxqRmBEsGlhmPgl6CE3LT2yPir
	mX86R6/MzuBHduJk5XrtgJe8n3/mh0Kg8I60Gif+lUA==
X-Gm-Gg: ASbGncsEgmZm/gAdxiiXaho77E+fdcusH0yl0ACq1okVv6Z9leG67+smbLEskbNEBqu
	i9eF1LP4IHKcg8x/C54t1tzXwtMeCz1a2HG3CSoBRfBH4SNLs41Sx/Bw81J0NW36npkJl15QmzQ
	1ThhIt7RskTLchguykgiquIhOuysrFciK07Q==
X-Google-Smtp-Source: AGHT+IH/Pnd5J+NF0FnDZghYVyvpxu7EjsURZfHbZf+7AxkvSsyWy0aeXxECpBSIWdWQ+pB3LafvHHvF9PpdbwIrqGk=
X-Received: by 2002:a05:6902:2686:b0:e81:cfde:3d46 with SMTP id
 3f1490d57ef6-e81cfde4149mr9130040276.16.1749479149876; Mon, 09 Jun 2025
 07:25:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aDVTtQdXVtRhxOrb@stanley.mountain>
In-Reply-To: <aDVTtQdXVtRhxOrb@stanley.mountain>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 9 Jun 2025 16:25:12 +0200
X-Gm-Features: AX0GCFvaiXF4lOm-GilksSFMvid8SMz438Y_wsOtUwqxJmS3jsDnPCnS_PeSI8Q
Message-ID: <CAPDyKFqMmOUsEWjE7X2oj0Nuc+FU6g_0p=+JCQ8xgGXJXNN-0g@mail.gmail.com>
Subject: Re: [PATCH next] mmc: sdhci-of-k1: Fix error code in probe()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Yixun Lan <dlan@gentoo.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 May 2025 at 07:55, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> If spacemit_sdhci_get_clocks() fails, then propagate the error code.
> Don't return success.
>
> Fixes: e5502d15b0f3 ("mmc: sdhci-of-k1: add support for SpacemiT K1 SoC")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-of-k1.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
> index 6880d3e9ab62..2e5da7c5834c 100644
> --- a/drivers/mmc/host/sdhci-of-k1.c
> +++ b/drivers/mmc/host/sdhci-of-k1.c
> @@ -276,7 +276,8 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
>
>         host->mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
>
> -       if (spacemit_sdhci_get_clocks(dev, pltfm_host))
> +       ret = spacemit_sdhci_get_clocks(dev, pltfm_host);
> +       if (ret)
>                 goto err_pltfm;
>
>         ret = sdhci_add_host(host);
> --
> 2.47.2
>
