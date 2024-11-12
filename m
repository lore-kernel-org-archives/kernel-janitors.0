Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297271FEFD9
	for <kernel-janitors@vger.kernel.org>; Tue, 12 Nov 2024 22:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731450597; cv=none; b=QSDzmFap20igAIBa3GA4RTJ87WGjVGDpmMmdb1JbH8LVk6TnjvTTlYiy+icJbK+6SiZ5D4tZUkhFaPglQWE/RzdCq8FUUp8CEFimSiqdUYxpmQ7TmjKInO1WMrzXR0L+zxvrrGsbVSwX78y2vTrTLpcZUj6jzTHTKocUTBfuapQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731450597; c=relaxed/simple;
	bh=qjBP7bdvStDQrKNammPad8Fnlc6kW/7F8hV3YzwDMZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fmJQ+lOcuK/miXszt9EGlVvllBoagrIS7Uz4OPEnNf4Qpy94MmRlGb2O6vYH/UYzfDkRa/gO7NDoepIab5gevu9WX9Fu90FHmrRO87yKaVGNPfbTZW03DetFVFC5Snih8fE4cJNutiND68XzzLxNj6x15Vb4H0zdUrjz9cYX/QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FtkvhmsP; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FtkvhmsP"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb5a9c7420so55451491fa.3
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Nov 2024 14:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731450592; x=1732055392; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMLlYAFDqKDkf0WiPqQcIBDe5t9vWTyk5bdOv0ivtJ0=;
        b=FtkvhmsPnR4px0NWYjCFGA6z9iQGnabPPefbRwUr/jfjDqGHBL+dBotOFImsfCS8uR
         +jzYhNzKSrAjo8AyMGJhtEbCsEPYT8K8HADELlVGCGBdvs9FJDdgfuToMB+Ibne0A5hk
         YFLUloibaEN6F8N0p/6vOUoBZqNP5nS8pFRYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731450592; x=1732055392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMLlYAFDqKDkf0WiPqQcIBDe5t9vWTyk5bdOv0ivtJ0=;
        b=hrf48VCaqZVPHerSLl/JBpTp+f8oCNkxutH3pZW3d3BKswu2H0dbLm+taXSrhnHxOW
         LXrXOsgyphFJwJdSL/zZRDDPRTjbtJKE2gG4lBxZy6PzmO1cVoGULd4sDEAbPbcNjbQB
         /zyZDiGzYNy/18wxVOYLCivrGT9vUgFtcxybi2eMjFoXN0TCHpFGbMS/npN9m4o50r6x
         LOwa9QM8++BWzdb/5xhqFUz88kiopxXLWHORHzONgF664LP0vFVRYp3fRSVk5nX/iJ3f
         bqkH6UJ9tdSB0jKRTd6HwRm4u6YiWi9qrlIIMFTBDjZvg/e1u3fHEu7EGRhOhe+R1m75
         G2BQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3+i5eCGjsJ8YZSBp2jV368VAomI0U4tt0OnD0BfgtCuhL1UM/ZcMa4V/qORPORa6qPhCPWF0RV5W70a/k0Ic=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRavH30y2DzMQhYc6LZs62wso6PMepGqpVAfFY0KAZu0VG2GkK
	WA3BdhPmo+sO0n+EYSA4JppZVu/MUHE5nVKVm94aRC4xNkvxX9JPTFqtkXfkyIfrWet6IBQtI0g
	haw==
X-Google-Smtp-Source: AGHT+IG4E2SAG34vLvyhjHb29//bFPm1q3bz6NHDjpxkuCD8r7AT8YZ3PpnOgX05XnU6PUpqv47OdQ==
X-Received: by 2002:a2e:a586:0:b0:2fb:5688:55a4 with SMTP id 38308e7fff4ca-2ff2016d735mr73482381fa.17.1731450592225;
        Tue, 12 Nov 2024 14:29:52 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff4dcd757bsm88151fa.82.2024.11.12.14.29.50
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 14:29:51 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb5a9c7420so55450961fa.3
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Nov 2024 14:29:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVAu+TFqB6F1NVVzFH1hH4iFMCrIDqgnW1emZI6gKSYZRmwfUYXJyk1oZsG0B+9+ocgECQDjKF12DK+9PrBjQo=@vger.kernel.org
X-Received: by 2002:a05:651c:158f:b0:2fc:9622:794b with SMTP id
 38308e7fff4ca-2ff201af817mr81726791fa.24.1731450590306; Tue, 12 Nov 2024
 14:29:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bdba1f49b4b48e22628482b49ce81f8e1f0d97b1.1731445901.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <bdba1f49b4b48e22628482b49ce81f8e1f0d97b1.1731445901.git.christophe.jaillet@wanadoo.fr>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 12 Nov 2024 14:29:35 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XJ=KVbopwovCvqR=WKi-pdpj3c5dZ57c+uUMh1ryk=+A@mail.gmail.com>
Message-ID: <CAD=FV=XJ=KVbopwovCvqR=WKi-pdpj3c5dZ57c+uUMh1ryk=+A@mail.gmail.com>
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

Acked-by: Douglas Anderson <dianders@chromium.org>
