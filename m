Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D53F1BD9D7
	for <kernel-janitors@vger.kernel.org>; Wed, 20 Nov 2024 23:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732144709; cv=none; b=gXcKm/rOgtLGULbccmYbX2XsmA8kOS7j7kA1VUzRYm6k8ZVFtl+l3GrZ33dVgPsrfj6t3cKwcFU6PnlI0WL8OfHST0Vpp2FxcJlmq2Y3iyBdDcbW/SFq5upqweyy0/2SagUAEsLFDSCFAPCr3+RvPBvLYULICXUzk0KWQfTbCMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732144709; c=relaxed/simple;
	bh=DepY0erriSZwBVNkVSrEEuXyb85a2Qm51ZwsZJ0A0+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sjl2jjAEs7CxXs6udjeyWbQe9InkZZer4v6fZegJX9ZeuvK8PQ67HW9DLZa11eFlUY9FVuvYmVpDMd0fuO9cvfifzld0w9aysV9qjeD4jcTCQaNy0+Syrzwyr+cpqU000z+BI9Alr0fV+f+gr7GTVlJD7l4QoaPRJ38TWPotT1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZgurKt0G; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZgurKt0G"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb6110c8faso3343761fa.1
        for <kernel-janitors@vger.kernel.org>; Wed, 20 Nov 2024 15:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732144702; x=1732749502; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qk9xg8NxsXbSQYsTpmZ0ltyqprizEJtz7wq8qhfk4DE=;
        b=ZgurKt0GFpxH0LCJ5SyfwXTKtWv68lbhJK0PZJFNgEAxJn1DfUWcjyzs8rrAfuxhq3
         1YVmvRzCML+ufxxrkCOCCRrhWwEnzMCBuGKYpa/cnP794cJ2jvw57f8hqrmBw4e64m2l
         SlF6Wyj5LaxKDBovb8LKypXKvYJR28VmFF/KA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732144702; x=1732749502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qk9xg8NxsXbSQYsTpmZ0ltyqprizEJtz7wq8qhfk4DE=;
        b=J9CmyiRQDPjQ25ey4aU6Wj+s7CsB3qcqK8T0Vxcq3ai84wQQx7F7KN67cDOieB+U91
         WPF06L/hxSAdEhF++PNV2jiIEZCYTFck+30VjYeT4m3FvgwzMNTnSf8sWesflS4K+Tbr
         fsNFaldXSYtdOn+co+AOp0erO/0Y/asGF4dLL5EqA4bRcAJXY5L/azaq+uj4al5nuN1x
         CgL+jpKK1HofLzv+m4lO2npnTiniYQYe8RMafsj70tg+ovQeAGK7vEvmAwqH2om8O0xd
         h2nr40kk6bs3wkQ2xWaRqLPZs8gyOgH+dNhGYMXjMk1YQGo65d2tmg9fVOQFxehFxoio
         1+Xw==
X-Forwarded-Encrypted: i=1; AJvYcCU+3p7aBPYMLfjotILKLy0U/HFUXj/5jRsWl4HqgLcwxxZ5+gvbEFY2s92YQn+NDdINQHCLdT8k6JZeIimks8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQQHORYZ39jMF2yks1v1EHURqXaboRWRMJo7oPgp7GvWoi/spS
	CfE1R7JSdr1r5/4dTN0dAe8k5f68SpND9bycUINAyTuzv4i4ywgk9tSPqPP/mWgoEtAX7VGilhv
	/oA==
X-Gm-Gg: ASbGncs7idbnwYnNyuPyd7RCfQq54XEwjg3GQWUXguEdgNvHf1YZ2iIY3X8CamVQK+g
	5eqAmX8JRfkpq+I6UIdAqzitpomclQ0KZ0DYPGKIExfxvocfJKzH2VEENpMHHgq4OfsyHSXjzOQ
	HLWtKruGy6wYxO9fQGkhL8I9gRVC50wUmUbgJPmEFVLBwE5sxGJIU/rc57l8sIOxg6tKgl9DNov
	iarWABQwQDkq9+rFh0hCXSu1oAaZ7Vbma4baj2zhzlajP+xLQZAPKgN7biiFc5iAk7/TOfLX4Ck
	RpEeayFwc6koG5sy/g==
X-Google-Smtp-Source: AGHT+IFBBAnXsT5cpD8mGzffSjQzysMfUgEggIY3FkWNUk9oIVV+kwiuNY9MR4CQ+GVglDfiz/U7wA==
X-Received: by 2002:a05:651c:1990:b0:2fe:fec7:8adf with SMTP id 38308e7fff4ca-2ff8dcbc107mr25831401fa.38.1732144702252;
        Wed, 20 Nov 2024 15:18:22 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff694b4773sm16741501fa.0.2024.11.20.15.18.20
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 15:18:20 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb518014b9so2670641fa.3
        for <kernel-janitors@vger.kernel.org>; Wed, 20 Nov 2024 15:18:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXQ7BdLTXmjn8NWBjhY3j6JT5F0DqlyTgTBhSrOTp+N3NqgWqofNhpqqyk1pQHYC0egSt+e6L7vaHqQzyIB4aM=@vger.kernel.org
X-Received: by 2002:a05:6512:2347:b0:539:edbe:ac86 with SMTP id
 2adb3069b0e04-53dc1326d69mr2039832e87.10.1732144699638; Wed, 20 Nov 2024
 15:18:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bdba1f49b4b48e22628482b49ce81f8e1f0d97b1.1731445901.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <bdba1f49b4b48e22628482b49ce81f8e1f0d97b1.1731445901.git.christophe.jaillet@wanadoo.fr>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 20 Nov 2024 15:18:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UQxLkr3vm7F0KtzKw9Kq6=yf8Q5jg2c3E9ksV+Stv4Ow@mail.gmail.com>
Message-ID: <CAD=FV=UQxLkr3vm7F0KtzKw9Kq6=yf8Q5jg2c3E9ksV+Stv4Ow@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: Constify struct i2c_device_id
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 12, 2024 at 1:12=E2=80=AFPM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> 'struct i2c_device_id' is not modified in these drivers.
>
> Constifying this structure moves some data to a read-only section, so
> increase overall security.
>
> On a x86_64, with allmodconfig, as an example:
> Before:
> =3D=3D=3D=3D=3D=3D
>    text    data     bss     dec     hex filename
>   15566     987      32   16585    40c9 drivers/gpu/drm/bridge/chipone-ic=
n6211.o
>
> After:
> =3D=3D=3D=3D=3D
>    text    data     bss     dec     hex filename
>   15630     923      32   16585    40c9 drivers/gpu/drm/bridge/chipone-ic=
n6211.o
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested-only.
> ---
>  drivers/gpu/drm/bridge/chipone-icn6211.c   | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt9211.c    | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt9611.c    | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c      | 2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c      | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

I figured it didn't hurt if I just pushed this so I did. Now in drm-misc-ne=
xt:

[1/1] drm/bridge: Constify struct i2c_device_id
      commit: dbf7986f8a56ce47465bb6e0f2b2d166b931d707

-Doug
