Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BA018DF6E
	for <kernel-janitors@vger.kernel.org>; Wed, 16 Oct 2024 18:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729102514; cv=none; b=MhEKXGjOX0vW+U+2mhRDJbEFXkHorpNuK2xT0J5NM5K2INwf5s0lF3Z96m8AYwv778h87hIqwrIIo+LaJFsitq7/JlwQd7sqhBlOdjQvBFH3GT2cV05Hr8VQG5WoAsPx35QAdTLDmXxsCNo45b/S6RT97Yb7S/CqEgmgyHiHyeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729102514; c=relaxed/simple;
	bh=mAq4AoMlxKysGb+Itk7iEnVK5aXThmWxihuz2MsOgLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwiL5FZ7/91KUkfICiXdtvhcnCsZnPt1XD1g6CRU04IqscT+NWqEK1I3sHJMuuur6TruT25RnLSk6k8Qj78HKWNSvY1aZ7SNuDLQNftDzMtKJHuwnA/wVCAdia6lwdyxua6CtmRlHZUP/uHqHxy/1tOiX01NmC4ejU+HbchyPOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=INR2+jAJ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="INR2+jAJ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20cb47387ceso1007015ad.1
        for <kernel-janitors@vger.kernel.org>; Wed, 16 Oct 2024 11:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1729102512; x=1729707312; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fkgg/XiYmuwxuU0YWtVe0AMhNojrUfbhQVkInOv4lBU=;
        b=INR2+jAJbEwk/lqh9HxvjvDKHVEst9SoQW9s8r6q1l9gNdRlwMt7lB0U8Rv4Ce/VKh
         bbMUgunkwVNGIuPffvvG272pEFNuHhPcY2xNY1KAyh2z+IzA3n/iK01CoE2BZlZdfMve
         OWDJtiEJAV2GyvgZKIqV7xV3uMfVH7xM8S9QOrGGHK7feucyBKHpQRG/GhZvBoVSra1N
         pHNXqM+J8oI4q1sd8rZ0hEZVxgulCT/WSk7QI9oPfHs35nM8hk/0BmolQETnjpZklpA5
         zkTVRe0I5IsUI+Hh7d2jGcdWzaKkv+aYI7Fl/oMFXaxzTj4shtYW9IePVYaOp8d6y4ex
         qhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729102512; x=1729707312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fkgg/XiYmuwxuU0YWtVe0AMhNojrUfbhQVkInOv4lBU=;
        b=FEMHmX0WtI4MmFp7IiFV8vWcey/dRhaHkArpT9rtVLMa+ajDauOiceIzEj6ZZXkcQP
         go+AklbencztT60KMZn2u9ncUGV4ssQbx7kUCviJG1Y3WbEtFRjZbU+L0BiM56CgKE+r
         HOXerY2ogocdZ2/YFCk3rTyMNwKXobCP5+6TRBFhNIOPsDQ0XdTJ8JYJ0GgCLPkXAUf4
         UPz8bIw9pZJXd0cl+8qZUxh6qpflh5xh/u/oeZ7U8PrUO2FJ9hhuUYeFPN6IPYhkAcaR
         TJwYa1euFKrpH17Zjh3TOhqfc6il9emL7AHgA+BdlrVo3TktN8mAzo/7NFmumdq/PY+A
         /fag==
X-Forwarded-Encrypted: i=1; AJvYcCXQDguqxbNri5fA4ZVq885UkEsHm1MigVK5KbZieobFULVwtUk7QaYyJfYBhvGk/84wr32nd+KJSSiIClGDo8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrUT3AYuauv543LcksePT6Zz5xUd54PNAJI2IONfQucLkDz2Bf
	soSlNdEX47C927MlLMHD39Fd9j3QIvBTRULgWc94CT7iENdflW5LpRcQKe6JPYE=
X-Google-Smtp-Source: AGHT+IFPs/1VOYlgs8ynT/CESZBXXAGDk0R6M8OaJ6CAurUUdtWENPzhZVi9D9E3OSJvDP5dBev+bQ==
X-Received: by 2002:a17:90a:5647:b0:2e1:682b:361a with SMTP id 98e67ed59e1d1-2e3ab8bb22bmr5177503a91.28.1729102512217;
        Wed, 16 Oct 2024 11:15:12 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e3e08d082dsm79600a91.23.2024.10.16.11.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 11:15:11 -0700 (PDT)
Date: Wed, 16 Oct 2024 11:15:10 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] pinctrl: th1520: Fix potential null pointer
 dereference on func
Message-ID: <ZxACrl/0hUE62eGN@x1>
References: <20241016155655.334518-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016155655.334518-1-colin.i.king@gmail.com>

On Wed, Oct 16, 2024 at 04:56:55PM +0100, Colin Ian King wrote:
> The initialization of muxtype deferences pointer func before func
> is sanity checked with a null pointer check, hence we have a null
> pointer deference issue. Fix this by only deferencing func with
> the assignment to muxtype after func has been null pointer checked.
> 
> Fixes: 1fc30cd92770 ("pinctrl: th1520: Factor out casts")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/pinctrl/pinctrl-th1520.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
> index 7474d8da32f9..e641bad6728c 100644
> --- a/drivers/pinctrl/pinctrl-th1520.c
> +++ b/drivers/pinctrl/pinctrl-th1520.c
> @@ -803,11 +803,12 @@ static int th1520_pinmux_set_mux(struct pinctrl_dev *pctldev,
>  {
>  	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
>  	const struct function_desc *func = pinmux_generic_get_function(pctldev, fsel);
> -	enum th1520_muxtype muxtype = (uintptr_t)func->data;
> +	enum th1520_muxtype muxtype;
>  
>  	if (!func)
>  		return -EINVAL;
>  
> +	muxtype = (uintptr_t)func->data;
>  	return th1520_pinmux_set(thp, thp->desc.pins[gsel].number,
>  				 th1520_pad_muxdata(thp->desc.pins[gsel].drv_data),
>  				 muxtype);
> -- 
> 2.39.5
> 

Acked-by: Drew Fustini <dfustini@tenstorrent.com>

I've tested this on top of next-20241016 on the BeagleV Ahead and
LicheePi 4A.

thanks,
drew
