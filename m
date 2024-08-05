Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3401494C4
	for <kernel-janitors@vger.kernel.org>; Mon,  5 Aug 2024 07:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722842623; cv=none; b=AC4qrkgEYmohK2OEK+TaQ46OE+0tjyR2FPyZp71UEa2JNLAwMImyO3QdeweRzPncspAi4pT5P2Fx0DfwuzZdeDvaXFyseNIlv3YOVgwRqZqKkeYq3Ts4JbqyiJ720tPQ/vHa2irnhuS2e8OfUdnCAvqt1jve+g8E1GZWOFq225o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722842623; c=relaxed/simple;
	bh=umFpxCUn+au3HF2NxksXKJAeihuMffW9VkiyHlVMD4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GgRKXU6fsnp769C5nC8VPCUjh07/7hPqBI9M9yAIQwWNAcJ+iZm7hSB+bSOkyXkuMuGixqMZbDMgJIM0OkDYnONhXGxQcwk5MiluL3d1tJjtPC4E4CGWYlHoF95ken/lQ0+SB5xrRXOANMhjoyJVF0orZStTOZXDU4YHrdOZV20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qVIMX+Fk; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qVIMX+Fk"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52efd530a4eso15765538e87.0
        for <kernel-janitors@vger.kernel.org>; Mon, 05 Aug 2024 00:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722842620; x=1723447420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sodQ83Zi4tI79ZwD9QYiXR5Km+yKuCSvXk/CIGbleQQ=;
        b=qVIMX+FkpbZYvB6jCVBNdEUBQEIbK/X9wSg+XrJq5sTIAc+fqFP5jFEFTBYI5Lo5fl
         /9uuQvd2wIoOe8kFrOhBAjPTRoQdWk4a85H4hQ3fjVrxDPeEasEBWx/9D0N5n3qPu4Cy
         6U5JGsAmWru0Ia0D2X1xrgbB6Y99vdjX3poeLLMNoospA8IJbsE1UMfaxrt+4fET+hfK
         NMWvVPs13mJd9w6v7VX8vdWqJReErnYcgw3E6qJkuigZdMiY1h4lOFerCoQxD1hsb3Sn
         o9wVZsDRetagQcNrnhmq2ArTPXYvKUJiGQTZpqfkiHAATPZUp3x6gmdqnfJW/BXHCdJT
         vLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722842620; x=1723447420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sodQ83Zi4tI79ZwD9QYiXR5Km+yKuCSvXk/CIGbleQQ=;
        b=bJfTofeuGizTUzmzUG67xjR8zVg19HbSi6gDyN8d5Rw2UAoUPTafG5g0PiU+D/bwPd
         iTR+Ce3xfldC1cTrqHEZQpBOSFfK/t8TOvoeTn7eNS2uGdM7GpGsps5pMWGm+JtwHuoG
         n3dJmy4Cxss2BbgU2mBCbv+74/0P/JEMLXihlRnMGAsRLOuj0Zk8R+nB6D7Wdok/yNcC
         TD1HL8p1Ywn5arwNrx0TqdyAZdT+aAYUXe3jAYfVeIlnlHk5FIvvcrU2MSgXpnG9HThd
         BqVVLrpc4uSXVJHezR5P8A6MjzTbOVNJPUMqHMm09GjNwBvDBjrPxFkTEQlvTiyJOFox
         O41Q==
X-Forwarded-Encrypted: i=1; AJvYcCXu9pHYG2qmFku6gpCetmk3ELaB6Vy8DKh2jJErlEtMsl+Dfjw8+leuxBwRbR9dzMI/S5bTq6p0LMutXLkRqo/QQhVD29obRaoN1LXSnP4l
X-Gm-Message-State: AOJu0YwKMj0iEF+5MfdDvWh7VXrOcv8wrmb7v1vGfdYuFkX2xCt1OlmR
	EVJUk5L3JU7C60rSJe4JExK1HnGi/nI38a84QnLkkENnzvPUdu/LAEUJiRBQUPnKq+mc5BgJEcS
	ASaByEjPtIVqcDJ4WcBTJLDm43kOjCERMoLtsKQ==
X-Google-Smtp-Source: AGHT+IHMEDV/XB6PuAMs/y2jmCQDs4ViBP5jan/yA0s8errZ3yGWl59Dy3YOXALgdmE/wb9d85ASLLh4iw4wGNH8EhY=
X-Received: by 2002:a05:6512:ac6:b0:52f:159:2dc5 with SMTP id
 2adb3069b0e04-530bb39b813mr8199730e87.42.1722842619801; Mon, 05 Aug 2024
 00:23:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1720556038.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1720556038.git.christophe.jaillet@wanadoo.fr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2024 09:23:28 +0200
Message-ID: <CACRpkdbp4HhXNutMgA-tBbQSzzO0zq9Tia3WS_fXNtgJ6Xr8ag@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: ti: ti-iodelay: Fix some error handling
 paths + 2 unrelated clean-ups
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: lokeshvutla@ti.com, nm@ti.com, robh@kernel.org, tony@atomide.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024 at 10:37=E2=80=AFPM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> The first patch is completly speculative. It is based on static analysis
> when a function is called in the remove() function, but not in the
> error handling path of the probe.
> When looking deeper at it, it seems that part of
> ti_iodelay_pinconf_init_dev() also needed to be fixed.
>
> /!\ This is completly speculative. So review with care /!\
>
>
> Patch 2 and 3 are just constification patches spoted while looking at
> the code.
>
> Christophe JAILLET (3):
>   pinctrl: ti: ti-iodelay: Fix some error handling paths
>   pinctrl: ti: ti-iodelay: Constify struct ti_iodelay_reg_data
>   pinctrl: ti: ti-iodelay: Constify struct regmap_config

Patches 1 & 2 applied, patch 3 was already contributed by
another developer.

Yours,
Linus Walleij
