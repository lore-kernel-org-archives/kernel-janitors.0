Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F5017F517
	for <kernel-janitors@vger.kernel.org>; Wed, 12 Jun 2024 15:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718205158; cv=none; b=V1zo8ok0SbUqEUK5urSoExXFn8R/FDr0MXA/BKrF91HvffwdVoQXsIU2Go4IbYvEEaHsF0nDVyM4pNFsWvkCulV95pN/hSdU/S7HGx5cgfzgW0CYw+E/GCfn6KYPpAUzGtQcDhL3LEVdFTG448pir/YwLikcqaG5LBgezFayq1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718205158; c=relaxed/simple;
	bh=UfKYU+FaEaDhlgVIlRO+d4NHVy0mPvtEYjAmluIP2c0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BBdQ553vNRmC+JcgtDQwrPuSk9IQIUwboEMvlOTmircq9IReFWhvS/Kr1ai62fxuEaAnvYlqly4lZxmhTxfjDMplnTIcrE4NYHxy3N1zKcVJp9Ex8mOzrbSvowvUlxNGIo5MK7yE+LcYVR6XoCeqFg/Ek+8QIx5O7sk9ac92sZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AZAEus65; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AZAEus65"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dfa4876a5bbso6635669276.2
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Jun 2024 08:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718205156; x=1718809956; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ui0asLPnRQrSAoLGngUgtvhcpdpuHV+OvoZ2KNM3Fig=;
        b=AZAEus65lFwXLSuDD7pvNBIR6lQmCU0QWOCq5Mb3lBOqD6hWB8qUxOKsp0Plc6YleJ
         O1iA38wyo2Qit0rf/jPen7iLSbeMQnMbwEMYP6g/M16fRCqegSun+WBX4IeucxzUfYWk
         CZ5qSfbLIKrLWSzVn9n6xf/NwGWELQJrWMQ5dG0E3DisOX0YkdXSPP0Pdzsc9hT5oREe
         +72RdbxtYILqDqV0NLWuZi2yaqA4cJIulb43SP8nadcmtACHGQbnSkx3FsCzBzj7sPKX
         PQt/VE3CXQpACCxgrfynk4GTzrY8NcfgufMPKvisClqJwmGPFBkM4fqXSMAjywazb0cN
         pt7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718205156; x=1718809956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ui0asLPnRQrSAoLGngUgtvhcpdpuHV+OvoZ2KNM3Fig=;
        b=rlVhxmEH2afGfa78QB1A1BrxayFxyy1V+5LV03zuZEHyl4AoEKWHPWpaj7IipWGNAq
         SOqQ8ftpgihMCmsOR4QODZRz8GhND+zv9+wwNjc2KglIUJalDAcb3SJ+6ljQlWqPrpKP
         Dk89kZ6c2r3lgbvFILXAVJ5lHKn37DRtEEFD0LroBLodHgTrm547oduYygqmKjTP0B3i
         5ZoAMVfwjvTSjW3Wl6dDe78gnPIT3lRpGvTStd9LwTDOuxZg3GBM+mpa/ObJXaN+kUDZ
         xqdcNQxlVL1AFL91wEr9uSeRylllh9CpDTkNzh50z3D3tpCuM/+WMfAazQpADL0f2UtY
         y5/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXGIIbM1U/a4jNgLat8lPw4OH4ppeUiBEeZ3x+lr0l1+YbiBL7sUb0URy4vzC/fVwB+Ib3MQKzmQXWoGYidOYjQhkIdK8BeAh2pPzdwo+8
X-Gm-Message-State: AOJu0YwawK3uhazfkxQCTdrwFYkByd7Xy3kIwMFAFSmYbYf9LUY1ozQm
	C6mVzySB8atIFeTFAEq29DQq4++ulR370uvAueJI8AXAuY/6DGaJJtK+PJ3Kvsl/VpTvnsi6zRi
	FXEsRKzwQct2AyhSozpDzM07iDnywHw1rnaNy2w==
X-Google-Smtp-Source: AGHT+IFWoi12CdmKen6XCavHsYiaGeZ6uNOT7Y113dWDJBAN7YMJe+nUPHOOTDfX1o7vHsPrrRKwh1FWKxulzT69BGo=
X-Received: by 2002:a25:6a45:0:b0:dfb:538:df1d with SMTP id
 3f1490d57ef6-dfe6852d794mr1893187276.43.1718205155725; Wed, 12 Jun 2024
 08:12:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610-md-drivers-pmdomain-amlogic-v1-1-b49ddb1a8bdf@quicinc.com>
In-Reply-To: <20240610-md-drivers-pmdomain-amlogic-v1-1-b49ddb1a8bdf@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 12 Jun 2024 17:11:59 +0200
Message-ID: <CAPDyKFpJdOGq7VneJfaodo2Jc1jc8pfnoNxCdRW5+T0ofdabtg@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: amlogic: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Jun 2024 at 01:13, Jeff Johnson <quic_jjohnson@quicinc.com> wrote:
>
> On x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pmdomain/amlogic/meson-gx-pwrc-vpu.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pmdomain/amlogic/meson-ee-pwrc.o
>
> Add the missing invocation of the MODULE_DESCRIPTION() macro to all
> files which have a MODULE_LICENSE().
>
> This includes meson-secure-pwrc.c which, although it did not produce a
> warning with the x86 allmodconfig configuration, may cause this
> warning with other configurations where CONFIG_MESON_SM is enabled.
>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/amlogic/meson-ee-pwrc.c     | 1 +
>  drivers/pmdomain/amlogic/meson-gx-pwrc-vpu.c | 1 +
>  drivers/pmdomain/amlogic/meson-secure-pwrc.c | 1 +
>  3 files changed, 3 insertions(+)
>
> diff --git a/drivers/pmdomain/amlogic/meson-ee-pwrc.c b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> index fcec6eb610e4..fbb2b4103930 100644
> --- a/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> +++ b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> @@ -648,4 +648,5 @@ static struct platform_driver meson_ee_pwrc_driver = {
>         },
>  };
>  module_platform_driver(meson_ee_pwrc_driver);
> +MODULE_DESCRIPTION("Amlogic Meson Everything-Else Power Domains driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/pmdomain/amlogic/meson-gx-pwrc-vpu.c b/drivers/pmdomain/amlogic/meson-gx-pwrc-vpu.c
> index 33df520eab95..6028e91664a4 100644
> --- a/drivers/pmdomain/amlogic/meson-gx-pwrc-vpu.c
> +++ b/drivers/pmdomain/amlogic/meson-gx-pwrc-vpu.c
> @@ -376,4 +376,5 @@ static struct platform_driver meson_gx_pwrc_vpu_driver = {
>         },
>  };
>  module_platform_driver(meson_gx_pwrc_vpu_driver);
> +MODULE_DESCRIPTION("Amlogic Meson GX Power Domains driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/pmdomain/amlogic/meson-secure-pwrc.c b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> index 4d5bda0d60fc..b50e5678abe3 100644
> --- a/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> +++ b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> @@ -355,4 +355,5 @@ static struct platform_driver meson_secure_pwrc_driver = {
>         },
>  };
>  module_platform_driver(meson_secure_pwrc_driver);
> +MODULE_DESCRIPTION("Amlogic Meson Secure Power Domains driver");
>  MODULE_LICENSE("Dual MIT/GPL");
>
> ---
> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> change-id: 20240610-md-drivers-pmdomain-amlogic-f117930600ea
>
