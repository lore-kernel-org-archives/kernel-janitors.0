Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A242E22AA
	for <kernel-janitors@vger.kernel.org>; Sat,  1 Nov 2025 14:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762009064; cv=none; b=aPRXY+hVuuhVO4EGYsYSTyhfqY8Brbs3Uch6d8zmHbah8KrFsyrexTCXSyA+r/B8ionoBM60FGRbot3lB62AiEHgZYI7cm8vyeKbwQRFcZp8kTBEXfhYMkIJ+MdMEETnYyvlOPYMQnMQFg3bmCrpuojctSYhO8Mhoxw67W7+kk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762009064; c=relaxed/simple;
	bh=UX6a+St/oon0bMcSt/uBqo7nx1nv8SZZ1H93Yc3b+SI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nOUN/4i7Yo7ye9q8jyu3Dwv8KY7t6Rv9urx3bzEKLV+0P1Nqk3nqPhVq3kidxtBMIVwCZJhQFblIcmSEcKDFQwOgzAoYosnq+rbLVXnmAir8EuBe+u5ViSRzoC+mbGL50qr8tvJUPwE8Xf/JtMB+jyc8hvTPipjc5kTifqGb/qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TdDfrxOX; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TdDfrxOX"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47719ad0c7dso27249185e9.0
        for <kernel-janitors@vger.kernel.org>; Sat, 01 Nov 2025 07:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762009061; x=1762613861; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EqDn1RC8UO2IDPb+c3+sWenx5mUO6CHUTILYTfEVrJQ=;
        b=TdDfrxOXABmnwYmJsbmvsOTDRN8kbHVybjpzZ2voku/A61UwiZJxqTsozHVBgePjwW
         mlMXUsfxIcwB55ZSTTiP5WMcS7Ls7mF0GH0/wd8C5OxYbPDs9gjSGDlP/eJqBdg+yePH
         GPWREucDb+mz3njA/Ll5ccZBdQoT/oQOOmOga5XcKHG+5RNWXyQv99QjH4C75eugw6so
         CLaQo/t54pbvb7NUYzQy9GEauogQ2v1cr6JDSrXUpIWQr1kt+L7/Au0odLBvdXnWl3Lb
         PQb9/LJQDjAV27diSXW+27td4Ib6tfWRWptklA88C7+w4YM8TsXPw7hrDoB+rYuZjTiw
         OGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762009061; x=1762613861;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EqDn1RC8UO2IDPb+c3+sWenx5mUO6CHUTILYTfEVrJQ=;
        b=MQ+Ap6zV33HCL/lLoJ7akeYh6QetN3icOnd1bMNmpoSdO3r+sgRXHo9c41ym13ITNc
         Sv1q6coLREWPePJVi4VxJhDRcu7O0Cld8q+N4qRCuzlBeC/ZufPu06ehFQJ89f1L+bZu
         ZJh6BbRXYSc4RUmW44xjy8alDz+jEpygthChACS6+Nw52zvlwZDvQrwck7EtxUz3XIxp
         I6i7a3tVkUg1L6tC0rMlTGxVakIkf+1aV5ria90+kleHA1yK7VbaCpgTI8+wN4wZYS8Q
         GU2ZO6SuiipVFCMQeqOe7Q/hOL81Ue5DkF94kdFTs0ETk4Rflfz5bW4A/uoh+6DfyGX3
         lSaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRzkc79R/ryp/WoujxtIXG7O11U5eoVIovBjvOLJZRXCe5AEVhOQ9vK2EPFzA4fNy27W1o9ae4dAfCO1kFf2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXLjIZk0GflAeFqpaIhrW0RBCtHSp4UACbF9JuWd1H9nERhewG
	T6zODPfxwzypnrj5aEUcUNCLDS+YdH71Mn+QC+84QGFCNFcNuJdluxozrz82mpddWp8=
X-Gm-Gg: ASbGncs9KznfBQAGq3VU5L8H//5NmExr1Okk/Zrz8ptzxPmLi8ITipehsLLbQMl8Ydx
	oErdtMrLb6Kmj/FMtoLrS7OnYZMmUDXsrHO7l36WlWMeaPoC935VPxMZ5qycOfqZEPKMw2k4guA
	4RkzIPJdqkOua9VQUWPBPHq406NwdIjfozEFD4Dfg1HVhjDBR0encerrupbww4zOYn7l+6F+gFH
	0aucBSvV/96BOv4H0HSDQ8YMdjcxiQfDTMmvfQb4fnX++EiFaSFvEBqCdyeAfopbJd6LuH55wXm
	uSm5/qv6G2pakXrtPZoI2U1MeL3fUaw8upyE4FKYaAt5kVznZCfrbSfAUraFEx+edRoXEO4WME/
	Oh26HFu68+f5d1VZzVXwhbRvb0Tx3NCVp1qK7iZl473j1oBWq0bRS8EziXkB3XTQR90VRtegwdg
	vFmmYMOaJw
X-Google-Smtp-Source: AGHT+IEqIrsV+gOof4n3Jx/bwouIFoZoJa8acq7wXUb7wBmEv6oMx40rV85tqc9myqKF+jTACk906Q==
X-Received: by 2002:a05:600c:3b9f:b0:471:6f4:602a with SMTP id 5b1f17b1804b1-4773086bee3mr82378005e9.23.1762009055927;
        Sat, 01 Nov 2025 07:57:35 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c23b8d9sm60335475e9.0.2025.11.01.07.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Nov 2025 07:57:35 -0700 (PDT)
Message-ID: <5d306cb4-a383-4efd-a3ff-add07ef28e8b@tuxon.dev>
Date: Sat, 1 Nov 2025 16:57:33 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] reset: rzg2l-usbphy-ctrl: Fix a NULL vs IS_ERR() bug
 in probe
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <aQYKqxD6qCQwFCye@stanley.mountain>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <aQYKqxD6qCQwFCye@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/1/25 15:27, Dan Carpenter wrote:
> The devm_regmap_field_alloc() function never returns NULL, it returns
> error pointers.  Update the error checking to match.
> 
> Fixes: 58128aa88867 ("reset: rzg2l-usbphy-ctrl: Add support for USB PWRRDY")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> ---
>  drivers/reset/reset-rzg2l-usbphy-ctrl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> index eea56687cd0a..4ecb9acb2641 100644
> --- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> +++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> @@ -158,8 +158,8 @@ static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev)
>  	field.msb = __fls(args[1]);
>  
>  	pwrrdy = devm_regmap_field_alloc(dev, regmap, field);
> -	if (!pwrrdy)
> -		return -ENOMEM;
> +	if (IS_ERR(pwrrdy))
> +		return PTR_ERR(pwrrdy);
>  
>  	rzg2l_usbphy_ctrl_set_pwrrdy(pwrrdy, true);
>  

