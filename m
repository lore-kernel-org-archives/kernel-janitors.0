Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685B84B5DA
	for <kernel-janitors@vger.kernel.org>; Thu, 29 Feb 2024 13:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709213926; cv=none; b=sZr7o1dM8Iij/AeOzk8Q+x3HP6OLOcXXKWorCkHneiFkfJ9tLqvV4rHoB64j4epRkj+JK8DADnxSsf7OtnAw2AiYqqeMDbmkHUsh6lMDH5+TNwMSa7z4lsDqZB+DV1rrLmijH9gfPP2tPUwtAGWvrgCfHmAiUA6RTa6Z1PCMJlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709213926; c=relaxed/simple;
	bh=IgTG61UP+6FyhLCLuzFpVqoxtaeq7U//LN38utfZLxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J9LJaL7DiX3LAbBxa0RWYwtQD5yr0UAaIA/L004QrFzlC+V7p7hld2qxrkJ/ltIcve4gqOMCsX0Fw0RkxQ6jnclSlkXJ3O+XNPbXd/OiBDyItnIWzXrrApnzKW5qCLK67h7CWPvJNFZegPs6fyIm3/chCaHZo2aDQuZa3oS1Xxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z9Kqqr9S; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z9Kqqr9S"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dcbc00f6c04so948114276.3
        for <kernel-janitors@vger.kernel.org>; Thu, 29 Feb 2024 05:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709213922; x=1709818722; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgTG61UP+6FyhLCLuzFpVqoxtaeq7U//LN38utfZLxY=;
        b=Z9Kqqr9S/du3pt1DwFfxkty40yun2kbpGuXsls5dArBUx/N5nf0Re8a20KcqiT6fKW
         lJPnCUJNTM8zXDByFbLsjX/fYGj+/ppiHliocmsw3DrOf1iJeMYH6JfrH8O6VQBFRRRF
         exkm7IL+683UWpHoESs3jDULwNysjpRgaD3bF7CZk3KKLx+1eQ3JZI8DG5UjpomFTuAH
         04v38upX79vjFkOi4+uR/k4BkT6PT87/39Wqel3+MxKxbWArEG4Wtu3p8yh8mIu841Z1
         hx7EdqH/FJJLtS/vKp0nWNlIRQpvD58AmGICvJEcpHAhH4MO/KCZtaJYvfUjcv/D3U//
         JIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709213922; x=1709818722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IgTG61UP+6FyhLCLuzFpVqoxtaeq7U//LN38utfZLxY=;
        b=km4nqgIJfFJ/jLeLbAsAwERdXnbWiZK9elgslCedfcZnA2fQ47uFvk/sS6XVnAkcxV
         PGRE7QmoKLniGCTyAuIzbwO1t5ps4XyksALQiDnlAlMc1Lej4ALiszYqX3KaZGAottv1
         w8LvPqEu81T9iMXKO+OcXxjkSWN8nQvWZkCEGpMCn7Yg0wy2Jlfea36hvP0fV8OqDOjc
         p2Mggg2t/WFCJDwBoHRWeRnYfMjqirWuxtajRTMkkJ1svAvaKtvc6kULYw3YQHB15iPO
         IZkmPhF+X+KFpT8hI0p7CMygToo5AMLp8tB3Dms5ujj9+VeESqFLpgLXcqVrCBZvQ3Xg
         rSlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwKSpaeGuKoMwHmm4OuTkSy/tZleGKtWOYCLOAbqvHqUy/MYtulFH2o3XmqYazSe122+l2qqmR+JnqTF0FEtC9vPs+s5QbQnN414fstbLO
X-Gm-Message-State: AOJu0YwjDkcdrDLZgou0R7hnA7+gkSKAQKJ/gNbziEJc/17H8V4ONT7n
	MdSz1ev5w8hwiG/PV5acjC6Ni+oMjVLDvLZVF58d6RMAh+jUHMYwQcw5P0TSbcbdvHekxXsedEr
	6UQphGPMGnx2lxkWr0D01ipQHsZYsbEW8Efi3UQ==
X-Google-Smtp-Source: AGHT+IHM+r25TrBY9AX9ipefyLXUMLaheRjIdWYWuABgl1FVp0VyIn45HlK3V83H/L/hgt8QY0zg7MnvQFGOqbohVwM=
X-Received: by 2002:a05:6902:2193:b0:dc7:4b0a:589 with SMTP id
 dl19-20020a056902219300b00dc74b0a0589mr2680154ybb.55.1709213922539; Thu, 29
 Feb 2024 05:38:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223162850.3914349-1-colin.i.king@gmail.com>
In-Reply-To: <20240223162850.3914349-1-colin.i.king@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 14:38:31 +0100
Message-ID: <CACRpkdaPxGX249Uu5GsP79+ga2=k40u2+oeGUYpEaXAnh4+F0g@mail.gmail.com>
Subject: Re: [PATCH][next] pinctrl: ocelot: remove redundant assignment to
 variable ret
To: Colin Ian King <colin.i.king@gmail.com>
Cc: linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 5:28=E2=80=AFPM Colin Ian King <colin.i.king@gmail.=
com> wrote:

> The variable ret is being assigned a value that is never read, it
> is being re-assigned a value in every case statement in the following
> switch statement. The assignment is redundant and can be removed.
>
> Cleans up clang scan build warning:
> drivers/pinctrl/pinctrl-ocelot.c:1404:3: warning: Value stored to 'ret'
> is never read [deadcode.DeadStores]
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Patch applied!

Yours,
Linus Walleij
