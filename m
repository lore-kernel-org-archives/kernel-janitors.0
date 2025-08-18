Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EF23101B5
	for <kernel-janitors@vger.kernel.org>; Mon, 18 Aug 2025 10:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755514517; cv=none; b=R4W1Jfl7UA4f7ZPSarm51TFjC9P4FjRtovamcID70Z58XFS4Wv6HIMydtiauL8uwWzWQuU5YNvLyCCqBQwlJOG0xf9zHl5Y7xu/xpJdLiyQLTGk0uQiT1Qks5/nYNHg0bA80AQWUSf3Yw5DUPgtXaGZlHiCG4sGT9cnx33DEHoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755514517; c=relaxed/simple;
	bh=FJ519jWH9KWAI2H67Tholf7HmFlB87+jCNjkI7Ma76k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H4qDQnoHEEAzCYEquAKoVvgmLtToepBYQOJAaXiKIWvgER7o15fg8huVGPeogxSHiCV6Mj5m+vafo1y4yJRvp1xj8xX8Lz9ZOv6Wu9jSAgk6w7OysjtRPkVbDg4P1D7CwNE8yg1oNFiPX53lRpQSPGI1EiwMy7W4oSe+YXY4VUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k48YcGtx; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k48YcGtx"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-71e6eb64991so18330157b3.3
        for <kernel-janitors@vger.kernel.org>; Mon, 18 Aug 2025 03:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755514514; x=1756119314; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cRZb2JpwGfgK0Dvyni/lGLUSOMBzhH0cIWS+Rzvv3Hw=;
        b=k48YcGtxlfSYR9PBWChf+LVHYtP4S/gAJLeQD4OajBYmJVId/6KgQ2x6S/zCULd3kn
         evIja1kpFM1Jc90MXRQbREk4IArIA7ueaiQLJasEFdBbHgWUCoZXgbmCA8R8XBLJAknD
         AXBI1ZxP5dCN99mlPqMc0TwBxzJ2X/l6mjGBJf0jZ0gE7gMHfe0mTlcKQ8C034cudVWf
         56osERU3gA0G2nhJczJGGQIR5SgXpyT78JC+2u39W1gxUHCOBSz7NEd0q8byFZcY100o
         IbgngaIyJAQ1O8BkFXivZrqjAatAyKSAp7SzGss0o1FdUuCEoTwshQilyi+giCJDbRgr
         te0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755514514; x=1756119314;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cRZb2JpwGfgK0Dvyni/lGLUSOMBzhH0cIWS+Rzvv3Hw=;
        b=e6OtaBQ3+KzWwM1hRA/qyYMGqnITcIj5SSDWfEpJJVPb8CYCfLmoRpVvuKfkJhvjSv
         bk8xwqrp+QVEUYQHwS9WBQcNc2j7Ut638cM6H6uEIccsFk+qd3s+GeFQuqD0TTcUN7J8
         oR62erCzPQC0aWLtZUhLL/mU6yoW859ZBVz5ynDZvxGezC46YiCQZaHYpDLkYakCYteB
         Dcb8D246/sxrfukoiH9CnTlZT6GvzETxV31Hldad8SNPg8AIHUtSW2YmiXFvoKzMGVmb
         7Lq/ur/ll24ZafstOsRbAmD+7Wr/cQGmEcgaZgmiiH7v9jVEgEuBnqUCh+sPVoHGsK4l
         DSrA==
X-Forwarded-Encrypted: i=1; AJvYcCVT4X1zujm1YA7nk6mL7I+6MmKvbdRUNuzb4OuZ6xJTo0Nn88tbtdhRxNTDHgqJ8RD6QdKCNG2s9QbGcntc9QI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCfveDcn9D/IoILid/0T0tdVroaidbZ47Q5uTUwKFvb7gvFqwC
	EMnlrgz1X2L1tk7NIdyYUQf1C5YrFc0c/+GFApS135v+JsXYyf663w0IYmtsDvmzzk2i9Sc9hDy
	nduyyXQ4eaKKdN23qqzGQkE/6c8buDos6xV/X/RDFFwCE37uVwVzC
X-Gm-Gg: ASbGncurxLw+TiOkJKY6G1KwTtw6IAxbqbBDZLAK6btQ5AtxwL13VfOwvnXxZOxN4bX
	KrtFyz6fjgw6djz86EKoGT+CjjYJlVedh2U39CVW7requqMy6pIyYphkbsUZkCpjnxT7+X2XOjt
	LHR7D26cr/nBxoIWL6SfuOeR8JkSHZEIiYbY7V0w2wPjwgyfVSxfhey9+SehFw0oyTu3iCG+2hX
	l2xsvlV
X-Google-Smtp-Source: AGHT+IESjdzn9W2JnsSauD18554Pkmz/p+/H6LoVzd2oHmARAOOT0+bzfJ7oITTTCicEmYqOeZmBCi19VjziTAWluD4=
X-Received: by 2002:a05:690c:4b8b:b0:71c:1e93:272d with SMTP id
 00721157ae682-71e77506f84mr94612597b3.31.1755514514246; Mon, 18 Aug 2025
 03:55:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250731094116.2163061-1-colin.i.king@gmail.com>
In-Reply-To: <20250731094116.2163061-1-colin.i.king@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 18 Aug 2025 12:54:38 +0200
X-Gm-Features: Ac12FXwmA01YCEQ2jCJwvBR_wmGb3MGLVpLbRcdACzXEkQ4qTCrGPjPh1dPBI50
Message-ID: <CAPDyKFrPhVezQprofCFyP5nbytyBCWsmxAu-ZbO_Bbx+d5aXrA@mail.gmail.com>
Subject: Re: [PATCH][next] mmc: davinci: Remove space before newline
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-mmc@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 31 Jul 2025 at 11:41, Colin Ian King <colin.i.king@gmail.com> wrote:
>
> There is a extraneous space before a newline in a dev_err message.
> Remove the space.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/davinci_mmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/davinci_mmc.c b/drivers/mmc/host/davinci_mmc.c
> index c691f1b60395..2a3c8058b0fb 100644
> --- a/drivers/mmc/host/davinci_mmc.c
> +++ b/drivers/mmc/host/davinci_mmc.c
> @@ -588,7 +588,7 @@ static void mmc_davinci_request(struct mmc_host *mmc, struct mmc_request *req)
>                 cpu_relax();
>         }
>         if (mmcst1 & MMCST1_BUSY) {
> -               dev_err(mmc_dev(host->mmc), "still BUSY? bad ... \n");
> +               dev_err(mmc_dev(host->mmc), "still BUSY? bad ...\n");
>                 req->cmd->error = -ETIMEDOUT;
>                 mmc_request_done(mmc, req);
>                 return;
> --
> 2.50.0
>
