Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DE92417D4
	for <kernel-janitors@vger.kernel.org>; Thu,  4 Sep 2025 19:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757012898; cv=none; b=txeE2KhzvmUk2NN73XZX/NcViCuxL5D1WWUqETmwQgSaW3bUFYbBn0tf2G7uCQLwMND4Bcpb6p6Sg/6fBY+UmlMnCgfjoW2qO2jTvjEtn74Um8wQugOFxsAUJrxPcRGagk+Y4Wb5yENoSJCPfkwElVNkf4qdgYRU3KwDms6QpVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757012898; c=relaxed/simple;
	bh=vAc8GWlbS1dNAlArdFmlz8JV/K5D/zFsXv7QiZpMwiE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EAE4B54glKBg0+rFYOs/gaOdFh3mxP7t+V0VxUzHIvCK1dkeJnCUuXNyPc1TVb71paEUrGRh27pzTTDUBjW+8iEL5zvFsOFI8w1hHhmEDnk0F6OGhZw8YLwMIODegsq3Msz0cwU6+J66Y2d1mANuNc5SAngE/In7of1qv3fUJcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=buIFpMzW; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="buIFpMzW"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55f7ab2a84eso1390774e87.1
        for <kernel-janitors@vger.kernel.org>; Thu, 04 Sep 2025 12:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757012891; x=1757617691; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vo5h9zWwGoqlYpJct4FmDo3z+MmmKvsMCfXCdRWbkd0=;
        b=buIFpMzWhzI1UteyKZo2+nFbuh1svmpvVoAMHuXy03PXBAXPfvBiNAV7T5LFChxUls
         Re38b2oeGWZ03aUrUSgLgPa5IGhfIb60IRGLbt1XfHWFypykZhIMWi74QeitGdgHbFgx
         r1IwH5uwiZvqxvMySdOx736Af8+pLyxzl3vmZZcoWv/vWXdn4M6hmjIhZhV+5D3tapY0
         rvFgj1iuIKpbfNDsIdVkSt1NRZBAbtZHuz9T5n4RqPFZllJzpre8ivLtk+Tnu0nbhW51
         JnnKq1cCBIJF92uTIAXYWiobXYuuJw2lkldiwINUpQ90SyF+hWqLJ64bh5VBTpXm4uiQ
         8T3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757012891; x=1757617691;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vo5h9zWwGoqlYpJct4FmDo3z+MmmKvsMCfXCdRWbkd0=;
        b=eu5oM1Y6b0M6vztNk5YkKv+sl1jEoiqHPzkoWZ+TAzQTYUVCv7pJsXh2SDreejnhk7
         5pZ6nUTc0radMOLiqoWGrCJzKoJQMD6Y71sUuR5F3MMD976uUjkZENOLkLZUx96EtUBz
         pohDjPzIWieMZanJQivVtQd+VfjGUmmkBdlJCqP2ukyk7t3L9dv+STZSlyKtpR78dUDg
         WynxIcj94mQczPZRXQHJD330NQ7R3DQb/gvfa8UCQqhkV4vlumi5XQpQC3mPjOweAP/0
         1gAaet9QdYW3QjxxPoKtwlpMjtNnifkNtiRh3W1K9ENghNKxdLP/QiEnV06nFYz99RIc
         dzxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpoNpojT5kaulHMg5gidDi3SjEqBuxm1D8Rd2NkGDP9ZOmR4XwWpEMO5If/36A/0G6IzuiGFbg0jUHkj3lxQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK7dtdS9OFZeb2o7SAVlPk+YfsQN1f5a0fOoD0+bzyWi1HIEFn
	Q3qEwIjtcxuKakNbMOv745aiSarqsc7tYpx9ME2FoMijPcNT0t6xo5dJwSzAYx57WncoPhY9FKq
	7TYvlzNm+939PHhhfIZfxmx6vdgjuqNeubtWi5bOFwQ==
X-Gm-Gg: ASbGnctyNIXdVpnZhuhgfEFYwP8LZFbOOnC++VX/lNmm5IWXJsYxZzrPjoSq/Au6mS3
	FDg9KjKeYNmWZYRWwAAMFWHe1adv6eKKMHcAYvW32TDD6YlEjajCpVpcfXY+VB9MNA6KziIr08w
	BCyTEKeQsZnxBHU28+NGkaWLvzIeFeLpGrKb2p7brGjd0a94T79q9jy1VKgJmRQU0aNCbaqgeSu
	hfQc64dLFFb6gPorXeOPgSIkmROgW4WDNh1UA==
X-Google-Smtp-Source: AGHT+IEjg25sWuO3bmaj5PHUknGO0S2JXM45w9uKMpw3odRt7dOKB/ZN0eWo0rVVU5lHI6RtH5iDMCEfa3X9yWzPwAE=
X-Received: by 2002:a05:6512:291a:b0:55f:63f5:747b with SMTP id
 2adb3069b0e04-55f708b4f88mr6505796e87.16.1757012891026; Thu, 04 Sep 2025
 12:08:11 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 4 Sep 2025 15:08:10 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 4 Sep 2025 15:08:10 -0400
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <aLnhbpfeweBI1H4N@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aLnhbpfeweBI1H4N@stanley.mountain>
Date: Thu, 4 Sep 2025 15:08:10 -0400
X-Gm-Features: Ac12FXysO6QNdjIEOI33bmHVFPgLJt02PCy8XpvyDgLc8P_ntklQBO8hfnzbYpY
Message-ID: <CAMRc=MfZuB53p2AMG_=zTzERL8+3cfZdXh+c-UhO9S8_aZJoHg@mail.gmail.com>
Subject: Re: [PATCH next] pinctrl: keembay: fix double free in keembay_build_functions()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Sep 2025 20:58:54 +0200, Dan Carpenter
<dan.carpenter@linaro.org> said:
> This kfree() was accidentally left over when we converted to devm_
> and it would lead to a double free.  Delete it.
>
> Fixes: 995bc9f4826e ("pinctrl: keembay: release allocated memory in detach path")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/pinctrl/pinctrl-keembay.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
> index 30122ca90cbe..3241d3ae6219 100644
> --- a/drivers/pinctrl/pinctrl-keembay.c
> +++ b/drivers/pinctrl/pinctrl-keembay.c
> @@ -1643,10 +1643,8 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
>  	new_funcs = devm_krealloc_array(kpc->dev, keembay_funcs,
>  					kpc->nfuncs, sizeof(*new_funcs),
>  					GFP_KERNEL);
> -	if (!new_funcs) {
> -		kfree(keembay_funcs);
> +	if (!new_funcs)
>  		return -ENOMEM;
> -	}
>
>  	return keembay_add_functions(kpc, new_funcs);
>  }
> --
> 2.47.2
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
