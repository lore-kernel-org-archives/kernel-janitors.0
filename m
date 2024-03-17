Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211CC23D7
	for <kernel-janitors@vger.kernel.org>; Sun, 17 Mar 2024 02:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710641016; cv=none; b=FrGIm2+7cRi1YfQXQs2rBAxBClrhfNO89agpJy1Fs/W+A2SlvEm9BrSo9sp9Iy39cWU4TqDcp14/tu4Co7jyrmNaEP+FrexRBIYSjaA46+hG5fvWxSvu8uPXcsHohSYn+Yko2vq3XwB26ZJr04CiVBKN+WakSMGx4yrK5fhFfFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710641016; c=relaxed/simple;
	bh=Kv0QSCq59fEtM1NO8t+yR1R5EVeHyVOYWIDdxnJijZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IE7Vx4auZmgRYyiZ0UG1kAQeUwra7NNl1BiwBDlJ4YY8Vm4dDcj489h97mbXYPJdxcIWairMrms5gSSL/D7I/Oo7d/vQtZARYsAp0t4tlwrxeCvLMPSGtseudn3xeUR5iEG/IyUNLWMb106QLycrqd2HtXE7ZePh1XINZCi3sL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fqvWrr++; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fqvWrr++"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dbed179f0faso3008065276.1
        for <kernel-janitors@vger.kernel.org>; Sat, 16 Mar 2024 19:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710641013; x=1711245813; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fDawv7n/Hl1MA12W63Wi04iWswIJUMGvTr6PyC7EIoE=;
        b=fqvWrr++tWaecfls5HihSXzGdXm8jrmk1XlhUUxG9nF3vjRb9vqNrSFUfFfLfpJv6b
         A32zhjjFHzpbquAGn/3JnW/zU4+TA7aX0e7VyOrH/HfNak5wHz1lvmU/I+YBfEnbIfKa
         8tscClynaME8rUu6b1EdJ23u1KGTapRYKvbPEl+azUMvS+sO1KagyQiB6lqJZix74ZS5
         OCy/RAURpZn7zUXjCUTQrnJK5Qvw/AeAkoUS9HvF5vjboJ1TS/Fgk1j8krkJnN4QChJS
         dNKN3mGQlL19qG1ekJCwPWTf7Bpiff+P1wBE/z5UfSHb0J8YyacRLHBKq47u/IutQeup
         rhdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710641013; x=1711245813;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDawv7n/Hl1MA12W63Wi04iWswIJUMGvTr6PyC7EIoE=;
        b=Yv5rqvSSyaew8hFV2EpqDaziZq2AeEiAC7iDGP4YORd+6aIFxMqtFHtz3keO5aXKVZ
         2oJAgG8N4bQgPTKG/nZXz1qsXiNbgqPbZrewPPJXtS4AYI3/AHXuxcOdwATMQ1WSBEFW
         8acAdq9ckf42TJSO+lP7P5XP/NOAHzAhR146Kr35ELVeuJ9GyTALnp5fWMK6NdiLV6l2
         +gFkbn+3L4sdmcmih4YFWaBF7hImFpHpyDv6ePTs5na2Wfmt04jCBeu4SAPnoxWuWKje
         HU6H+mB9HlYDKV6NcXomY2A/xCisVrDDjzsUrQel4167AV0kZHoepjdl5txIphZRsxkC
         RkzA==
X-Forwarded-Encrypted: i=1; AJvYcCUcatsWVRdRdhYpR5ipcxXvhl7Saq76kO060ZdfJmSeGMAolKlVoQqY0fiY+FCTbTDo2WUP+rbvX86oDZHmXZ/U5pV4e2Jp40w9nZDhrLTX
X-Gm-Message-State: AOJu0YyErE7rk8ZpVdqDhdanvZ35VEKSovVYPoD9Qn0d9LKamydfx2qL
	yC8WCEJnU4Gc7Rac8dUApPW0vrPU0NQL7cNkNlc0Kyhw2C9nurlH9wqsyWlEiPy03WZ95ACmvuS
	/sTUcvZUGyZ33WdnSIDydJhop575qqSEwZMKtZg==
X-Google-Smtp-Source: AGHT+IGKP5/QVTFeKJWp0LE2bmqx8+bXO7FoyJVOXlQK9kdHfeZzWq2GYg6yprxmFWn55gcVROku92p+nT0HUkQ0/Ik=
X-Received: by 2002:a05:6902:1348:b0:dcf:ecce:b2da with SMTP id
 g8-20020a056902134800b00dcfecceb2damr6226829ybu.19.1710641013131; Sat, 16 Mar
 2024 19:03:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e09122722190d052cee792a9246c274510f3b928.1710618660.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <e09122722190d052cee792a9246c274510f3b928.1710618660.git.christophe.jaillet@wanadoo.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 17 Mar 2024 04:03:21 +0200
Message-ID: <CAA8EJppcODOQPaP1=0hfb72egS=Nca82OZV1SH1gw9XDubYaSg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: lt9611uxc: Fix an error handling path in lt9611uxc_probe()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 16 Mar 2024 at 21:51, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> If lt9611uxc_audio_init() fails, some resources still need to be released
> before returning the error code.
>
> Use the existing error handling path.
>
> Fixes: 0cbbd5b1a012 ("drm: bridge: add support for lontium LT9611UXC bridge")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only.
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
