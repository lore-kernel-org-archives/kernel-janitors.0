Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BE920C006
	for <kernel-janitors@vger.kernel.org>; Tue, 18 Mar 2025 12:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742300096; cv=none; b=XZ43CMmeK+8JQOYS9y01xe5zuWIhHd/Tvg8c9BsOcQwpKxosSxd35qhcSOZpR5XcDgBGqCH6YKKJQpwhWDPZB+3K1/4aivkQ1Cdd9Hj+ceQHrIHRs2VpODPjO8PnJIVaNs1PnDAZDTIK3qaqL39WcrlrHQi3GA7IX5wgCIQNHN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742300096; c=relaxed/simple;
	bh=Om9LWwSZhRbR5uwbIwSklW+JTUXChFeYWNKsyZInKxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U6ydAzMcqlbDKp5fgJT4nEjGWmvxkR62OlSgrKAwNuNLZK5J3OuBgjmr78qdUw2+rRX7/+l/weoK3xOBiE0ZyRsPfP0kGGEPYMtGQgBnNstZAtDPKJ7zkFqyuwSlFazoc9ryMiInHIzHnSiKXJh5Clfsewkugo8pnuKltTjH/6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kbD2D1MP; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kbD2D1MP"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6ff37565232so45292027b3.3
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Mar 2025 05:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742300089; x=1742904889; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1/y8nwDFP5hJBBvbUUG0QfBtnCqzgdSuPLHojeq2gsc=;
        b=kbD2D1MPMjnW9DfW0jfJ86/dLJ/M8uNfxysUkdpSPPvkZ+4vK1ertxocA1zmXH7h+f
         wiJAsKSNLeYcpNB1O6S43mFFgCnUP1hUyCfln5WNt0Z2+f7mW1s4uHkzX4gfIBomQk46
         EsJzKkrgbNglXfmls5Ld9b9aNfyBTZcXyRGha06ywVV620f0MaIoLCDO9V3QTCFhspRZ
         /O0RAROWYaZwUJZAk6dthBYRy+O8mkt6kwNuahlYhdBACkuPATyuV668LqLM4QRuzc8r
         awYvaudAa1x2Hk+Fva3RnWWWfzJs+cbxwl2UaBHEHHylI+5S+tI8TmcyV9jGxjjk6yC2
         fkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742300089; x=1742904889;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1/y8nwDFP5hJBBvbUUG0QfBtnCqzgdSuPLHojeq2gsc=;
        b=wUXjeMM5SWcYWdKyhWMsl7k4m7o3+AcrpXkDLFkwoiJpLfZ5j877iuZwMYfMA2csMS
         bYrge6Mi6mRkPWdy1hFq75Lehq/5PneEL+KN5o/mYa7QvbnlSyDiIKVYbCvfA4UV7qsU
         qtATLWirEfubqQfi5x2r71dhPs/BzBhVcjreBlJufb1kvxgSM5xS5762zsn9EBAzzuFO
         f5+RTdnF9fsQ8p2iTLiyaiOHcAjv1a8oI9vuL93Mar2tPPQbpe3Fl9geuX7KsIvPxts9
         PEKIl5g4mSwgQ+r6ELBhiMJ5OVuC5nUXUuwF1hGjlZUQ7H6DHSO981Y0tqqMOoZNU0Ke
         3rqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8K3kd09ZGXjhBEpkbBXwbMA14xuGEyix5ZcacXhvMNUoN38FnZ4eSgcgnu13an1bvGUytVX0hRasZMe8Tp4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwniC1TZLDYZEaOM0x5IG1RhVnl2GOT0TiW3dWpM0zFBykss5+p
	BGGDUqRQyV6gCqpF7yEcfkMUwJkT6/kZ3uPGnVg6/IslMdche1mZEbm/KLASLq+z0LukJPFcjuV
	YmFi7xYnMuw2UCgyKCZDpevuIhiO81BbVxJDdjg==
X-Gm-Gg: ASbGncslK8MjCqf+yp2DTZRZtsaYX/PVbjdxP8gqr97pmfR6Jk5gk+nVT1EwU2HaTqh
	U5FzV3IvIIugNJ68rwmgSAds9mkR80hKFgElu6WDu73pIAGAwS/Cc6GNfcfP2cBvNMFYWbl5RiW
	VDIS8aLhmjMp787JxmJJLk3Ad5pkA=
X-Google-Smtp-Source: AGHT+IEb+NzrbCeNRdPzm3xEMtkofIje/IsnUYw+kILlbfLc0DlZPY9+TQaCk80CJVoK/tOOND9xyncng+d5HjDNmyU=
X-Received: by 2002:a05:690c:6ac4:b0:6f6:7b02:2568 with SMTP id
 00721157ae682-6ff460529d9mr218205717b3.32.1742300089569; Tue, 18 Mar 2025
 05:14:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f19be994-d355-48a6-ab45-d0f7e5955daf@stanley.mountain>
In-Reply-To: <f19be994-d355-48a6-ab45-d0f7e5955daf@stanley.mountain>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 18 Mar 2025 13:14:13 +0100
X-Gm-Features: AQ5f1JqEJzBTaaSWFDJFRns2Qyn4YifFIkvKDJuCkDwbsG7HAzOkL1ON5MzrQiw
Message-ID: <CAPDyKFo8hyTJHZVLTAVXe2EW4FCPPLm39WWwpjOCqzUQnfNJ3Q@mail.gmail.com>
Subject: Re: [PATCH next] firmware: thead,th1520-aon: Fix use after free in th1520_aon_init()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 15 Mar 2025 at 11:04, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> Record the error code before freeing "aon_chan" to avoid a
> use after free.
>
> Fixes: e4b3cbd840e5 ("firmware: thead: Add AON firmware protocol driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/firmware/thead,th1520-aon.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/thead,th1520-aon.c b/drivers/firmware/thead,th1520-aon.c
> index 4416e9bbf854..38f812ac9920 100644
> --- a/drivers/firmware/thead,th1520-aon.c
> +++ b/drivers/firmware/thead,th1520-aon.c
> @@ -203,6 +203,7 @@ struct th1520_aon_chan *th1520_aon_init(struct device *dev)
>  {
>         struct th1520_aon_chan *aon_chan;
>         struct mbox_client *cl;
> +       int ret;
>
>         aon_chan = kzalloc(sizeof(*aon_chan), GFP_KERNEL);
>         if (!aon_chan)
> @@ -217,8 +218,9 @@ struct th1520_aon_chan *th1520_aon_init(struct device *dev)
>         aon_chan->ch = mbox_request_channel_byname(cl, "aon");
>         if (IS_ERR(aon_chan->ch)) {
>                 dev_err(dev, "Failed to request aon mbox chan\n");
> +               ret = PTR_ERR(aon_chan->ch);
>                 kfree(aon_chan);
> -               return ERR_CAST(aon_chan->ch);
> +               return ERR_PTR(ret);
>         }
>
>         mutex_init(&aon_chan->transaction_lock);
> --
> 2.47.2
>
