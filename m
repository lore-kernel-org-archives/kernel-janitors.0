Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5922D7DDC
	for <kernel-janitors@vger.kernel.org>; Fri, 22 Aug 2025 10:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755857788; cv=none; b=A6cjftSB11QoCQQeFgvGgqf27XTKoUruHvQdNRhxe0/7kWpuU2CVuUYZacPmgSl1/brd4TaE+ojoN/s43V75oFMefkhr9dlELp4ry3kMAE3kaitxpO9flRF2vSAAP+gtwMP4t7lmIOTOIfNn7+ysKtketV3EvmkiudFc3UPT+EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755857788; c=relaxed/simple;
	bh=rTQ7O4z0T32sSi6Uq1+vre+DsN/J7g0YhgFRfALG9gU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SgeVJTsXv+l3NEp4Q46DIHxMtR/ERJi67IikiWSbBKqKlGhQyPVe3PjP4bdumdq9wBHsFXbYT9txVmIK50qlmcoMAcJFcMCr+V9xrE4dgzDAjCR1Ywiu8sGB3G23MSXRBEuE5DPlb2vPIFzs643sSZ3KkZUhvrXDm0K/C5oNPWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ucRMf7fU; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ucRMf7fU"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-71d71bcac45so16625017b3.0
        for <kernel-janitors@vger.kernel.org>; Fri, 22 Aug 2025 03:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755857785; x=1756462585; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MStKSgawIhy24YHaPQ87vkMuuEaG2e8ZMvV10Ab8/eo=;
        b=ucRMf7fUThAW5b0nFpDPFK1gkfWID4O70q3zkK9MLSnLFIZ1q2q221WeCC/NAG4/9c
         wsqSPlsKCiCBfekFA1Aep+6jXoz7kRjFYv3gbnAHTZAm3fIB4yqe3sKzUuSAN0TM+aR7
         UhqOLBslsxICYMWguJgbDzYfCBa/BaygvPYqdlJ1VLEfu0nHRGSnxgqfhh4SelQb2bYl
         Z4/troFrPk0Cxg/VZpWLkN5FtNyL3rsnBgxyiwmnp27zccZ55ZQgEVuNb6w5/BlhCM65
         dLK+BWh/z3gogz8VE1TyTB41Lg/C9TYi/9sIOXb19FBDQ6bru2yk/Q77x6/V0vV2wW+u
         mDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755857785; x=1756462585;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MStKSgawIhy24YHaPQ87vkMuuEaG2e8ZMvV10Ab8/eo=;
        b=Xj2AKxhZ46ylTVM9BsHEScqXbZoJ9Rk+EUxLU77uX4e8ED6ZzPedwspOBOnT1TRFeL
         jUdwQYQ1ohRdTNNO1ZidMPv8R386XpElwm4ylxyPOQsudVfFGSodjT60v8CAfpAD5HKi
         1QowDBfx4LNjXzopXHpQDRF/R2aYF0iWT9mgywficq1TO7OIpBWDkkKQ6hRU9/QSLt2N
         OBGoZU4y0Z4q/dcv3P+87Ao0jwCyiQflDjxhVxIz/E4J2KXGM0UjT0z3Ka15Z8Bzdawe
         atYEpx27GCiYgMXDuQllAXhrgnwdsxjC7M/PMrRmMtaEErgP2E/hr7OjZ4AzpAVE6lXq
         3cpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWONiO2uXbHcSaT3f9Jw7HFziXZexZ+Vq6UW0O7PJVHZ0PSKFfXoN9A5lSoL+e0H410VB9kxybYRBeqtbn+sCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwrNr3/E1WWBollZbLYeWLId2IyUt+uild6JQQpygoovsC0kjy
	+ajN7VXrZ+9Y4g0k6gRFtzLeRWSELY62JLb15PvdSxqWnTWkmtqU8rSEeIxt4AS4CTjMATbtTNw
	0IJ0zS31fYyBpZoNgJaffPWGpa7Z8KQsRJD1pu9+bazFPKx9lCban
X-Gm-Gg: ASbGncvztv93gir7yypttrMgrOw7/lCgXcd2EYsPT0MOLjM9M9tFPPdn1pdRobsM0QL
	MnaYbodL+7r7HNSQ3vaH2J5dUzv/hjqN9/WszzuIUlBjFb6llWgF6u5i4Nej8PvvtIFbDVZBMH+
	svl2X8gixqYUvuTDkcmrShvRjhnT3GH/mBnVjhCdU5S/Ykg5uDFXWfy6TNol1k+NKXE2VMedN+L
	Ca+arFm
X-Google-Smtp-Source: AGHT+IGH9fb3EwJaOrhTe49XLE6xV468Qoema24FhNsmpJSTJGItY08kz7Di3vmpIC/L+K/O0pTBrTv047W5wS3elEY=
X-Received: by 2002:a05:690c:6410:b0:71f:9a36:d6fc with SMTP id
 00721157ae682-71fdc4381a1mr27097437b3.45.1755857784609; Fri, 22 Aug 2025
 03:16:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aKcR8QD81TjVqIhl@stanley.mountain>
In-Reply-To: <aKcR8QD81TjVqIhl@stanley.mountain>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 22 Aug 2025 12:15:48 +0200
X-Gm-Features: Ac12FXz4sxGKUtjWkUVr0TIFLeBjq-6soq1-snf2Jf2WKexjhIZ7RAbCOnHYyhs
Message-ID: <CAPDyKFoDsSbOh=Z5_uFd-qPfxmGBZhBNviRt7nZbiEO98fSAog@mail.gmail.com>
Subject: Re: [PATCH next] mmc: rtsx_usb_sdmmc: Fix uninitialized variable issue
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Ricky Wu <ricky_wu@realtek.com>, Avri Altman <avri.altman@sandisk.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Aug 2025 at 14:32, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> If rtsx_usb_get_card_status() fails then "val" isn't initialized.
> Move the use of "val" until after the error checking.
>
> Fixes: d2e6fb2c31a0 ("misc: rtsx: usb card reader: add OCP support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/rtsx_usb_sdmmc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/rtsx_usb_sdmmc.c b/drivers/mmc/host/rtsx_usb_sdmmc.c
> index e1ed39c657c3..70bd21084b97 100644
> --- a/drivers/mmc/host/rtsx_usb_sdmmc.c
> +++ b/drivers/mmc/host/rtsx_usb_sdmmc.c
> @@ -785,13 +785,13 @@ static int sdmmc_get_cd(struct mmc_host *mmc)
>
>         mutex_unlock(&ucr->dev_mutex);
>
> -       /* get OCP status */
> -       host->ocp_stat = (val >> 4) & 0x03;
> -
>         /* Treat failed detection as non-exist */
>         if (err)
>                 goto no_card;
>
> +       /* get OCP status */
> +       host->ocp_stat = (val >> 4) & 0x03;
> +
>         if (val & SD_CD) {
>                 host->card_exist = true;
>                 return 1;
> --
> 2.47.2
>
