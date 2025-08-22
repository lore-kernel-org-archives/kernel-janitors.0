Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8798B2D3EE3
	for <kernel-janitors@vger.kernel.org>; Fri, 22 Aug 2025 10:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755857785; cv=none; b=aMkFzmjDgl5HAoyTkDlIGJ8DuDNoY3TKcquRgvNueo22H7gxLrMyWkUf8kXuJ0Sg/uFl4c/+/8FShG1hYdqYJHWDRK/O/cHO7zMgrlTN551ilzqALPMLHyMMmGeeWaufFgMCUuB71hPTQ/URBb+Eo3O7QuFd4KgDkEr4zx8/5vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755857785; c=relaxed/simple;
	bh=ljAWuzvOYiIpTo6Czaq+47GM+C7kMXSt3L2+v0PFt8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qqfAh7lrXIGZaN7nUnHr29H4GqBaurOP9MxCGPmjgR2V92CtPXdiY/mArmF4rUZqnlWTv+k8edeGtfLZ0oAAS3xXyWioLnU95Y1q7FyTZ5NTGzUqTbJEQ1KrrNm7rQRhPL6ljE39EHDro1gmo3oUUmEtQSzxzGpdIt8v9tNEsGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LxpRTgp+; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LxpRTgp+"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-71d6059fb47so15853567b3.3
        for <kernel-janitors@vger.kernel.org>; Fri, 22 Aug 2025 03:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755857781; x=1756462581; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XnmV0us7Kg27Umkj8/JkmwkYYloh1umV4GcZnJysZtA=;
        b=LxpRTgp+GortkgvvCHGdVQlJekUFhnsmNwCeQl+PyWfY+3EARRGSupQ5aAenLuApCK
         nISjSmMrfH3vW9W56oAXACeCoGSGSpoBGpps6r1Kf7xHkWIn5sXioYZ8btJp/HxWy4TY
         UD3jvNfbg2/dZPt7zYiKUIngHCpYX4n2aXR7JIEa9Df1C9jwCP2V5Wi0ToCxr/KnnNNW
         u5wJ6C068EzmI5c3NQEYamG7rIiL4/Y1W7ICiIYsHmzpvCbsQWfnspEsntZByTtwkaC4
         Ihp5x7e7D5iI57R8HO2RXHAKZ5vU5egxMSro2SVeGDn6wnadT2UosTyUaGrIWEpOmGLj
         VWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755857781; x=1756462581;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XnmV0us7Kg27Umkj8/JkmwkYYloh1umV4GcZnJysZtA=;
        b=AG8i1zBxprnP4iHhWIGpzri+XKNrAh+ks7RNhF9sx6OH3hNPL+WGT62m6YBZ8n5W47
         hNAtJtICRzBNEdiUP0cOE2aGPFFUb12lNYanyJkSTM0cMRa4/yV3Hja09HORBgX0RnIc
         IleX1OCfzovAabMQbGG07hUZ5P331FCo6lDkoEcIgHdI5UiU69ooFhkJzpET/EhJh+Ok
         o3MGgKVEXNEjhjhyWpQ09RszCDr51yVlK2I4L2y+95aHBL2ymPcpzOF1wQoc3+2BBF+O
         LgEY8iUVk0xAZ6AeppVl8l+rGLVerZn8K7ulRmF6JV3lnaIWnswDJo1hcVFl+onyu3nZ
         eKFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBp2+St8d/Quj/zQFdI3vvi7wJLCx50F8P3heyQXLB7uosC7kEpXW8W83tFAVNToDSHWLfnZxQVH2vk+LVBOg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRubv/A/Z4QfW97gwD3eFRqW9d4e0vNe78JUkwFUhwcvGYFyDd
	fd9s22q2VQ8dNjzL7/5qeoN/y/4hs6Jh/rCvsnem1Dxve2n6xOFMmkxkozr5G+2hVNjITMgyPIh
	2cHaZK/yxJ4tMbmDWGMm3NzSj/rB2lPBUijHoo+kgSQ==
X-Gm-Gg: ASbGncseDOIygWLzetD3ZgOfPzZ8s1tl9l2vaEjteNfEXhE/DoyjPbl6KRQR0un+IbM
	YYnYafWBaLbOJjyArUU3Wf9OFGyxMuUc7KOR7Kizazcvx6A/nupi5CFa2P/eWGRPrfabkkvdHeb
	/jppBrGZrKRF/CyJH6ARZZeufmxrIPK9EiteaiWeAsI+/bh5eqrPApDu588NsjfZhOIkiy3POPP
	0uRPw3R
X-Google-Smtp-Source: AGHT+IEpjzEssQlLmXKXxadk4uEAS3oj1+xFV7AZ2qzlp06a7zrZrtPvDZicfzfIyyJ392bIlgHbjZLUDN0DNQK3CX4=
X-Received: by 2002:a05:690c:87:b0:71e:7ee9:839b with SMTP id
 00721157ae682-71fdc2e30a0mr26325577b3.12.1755857781289; Fri, 22 Aug 2025
 03:16:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aKcR2ea747xkw_it@stanley.mountain>
In-Reply-To: <aKcR2ea747xkw_it@stanley.mountain>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 22 Aug 2025 12:15:45 +0200
X-Gm-Features: Ac12FXx4XgJqgvW0WIQS_GDqdVbcgIgtnbc-eSHmfbfjx2viLj3OvkBKaDsAa_w
Message-ID: <CAPDyKFpHTktROvbW5ev6e_VGoVOUw=2EvRoMzmWLNfqoCPSykQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: mmc_spi: remove unnecessary check in mmc_spi_setup_data_message()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Rex Chen <rex.chen_1@nxp.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Aug 2025 at 14:32, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> An earlier commit changed the outer if statement from
> "if (multiple || write) {" to "if (write) {" so now we know that "write"
> is true and no longer need to check.  Delete the unnecessary check.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mmc_spi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mmc_spi.c b/drivers/mmc/host/mmc_spi.c
> index 95a32ff29ee1..42936e248c55 100644
> --- a/drivers/mmc/host/mmc_spi.c
> +++ b/drivers/mmc/host/mmc_spi.c
> @@ -566,7 +566,7 @@ mmc_spi_setup_data_message(struct mmc_spi_host *host, bool multiple, bool write)
>         if (write) {
>                 t = &host->early_status;
>                 memset(t, 0, sizeof(*t));
> -               t->len = write ? sizeof(scratch->status) : 1;
> +               t->len = sizeof(scratch->status);
>                 t->tx_buf = host->ones;
>                 t->rx_buf = scratch->status;
>                 t->cs_change = 1;
> --
> 2.47.2
>
