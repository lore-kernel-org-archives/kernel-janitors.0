Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F82716D335
	for <kernel-janitors@vger.kernel.org>; Wed, 26 Jun 2024 10:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719398382; cv=none; b=PMVxxGuudV5FnCOveTxsbvsnvElT8dadBtKR65oP/TLJE5nESgUP6FcbMcvZ1dWf6OnAYEWHxAE93tClEGOoukRFStfNwxUUsYlECnBV8d1X67wY4qkYHg3DbGY+acaPr10UtPCJIELxWRy5ibfbgZo7l6crNw/r1x4iWPxiYnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719398382; c=relaxed/simple;
	bh=dhzrmXSqkGs39FUvRpHqoDKx6vIwMQj8MYGTdhz07CA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cMyOcKPHu1Pldj/zbZZg8v4SlABiVPBvsRxyZmh3f5tdsYrVpvJNAtaC6+GooDR8nxh4tap1M5wKZkT+Cbqn8+YaQI1jfQkpXvCdoEtX0uVmvh6a5SzPfa8OPyVJXSjB14lIyOULMaBm1DAHmraNkoJi6eC+Jtftj8bhnPWINFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=On7RFdeG; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="On7RFdeG"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2eaea28868dso86307571fa.3
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Jun 2024 03:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719398379; x=1720003179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhzrmXSqkGs39FUvRpHqoDKx6vIwMQj8MYGTdhz07CA=;
        b=On7RFdeG1xPYwaPUbXA3LF4Lvo1BTHHGBkowyixrxTt5fNrtGWmx9mN7RwR5OJjCnh
         djJ2XCUKpGRfF0IkbLlekQe8zVSe1+gOLEmaDygCiOV+R2Jh+wXdvlYTnm6rScIrUoDR
         0F5uXpkukLnO8VR6w90w79K03Kw97O2WWsbA4S5TzVy/38L10DFZGuFDomc7bx+DBxsJ
         Xxru/nGDxoXjtRtbY7y/HI0nMWU2hSvxdbin/nA7Qh+V8mMR3Dma70toNnTLyjAtGTEe
         CCE/wU4F0802JoXHI19UU1ALKeZNLdwdUH6OYAhdbI4lbPUG8GY1sZPegNJdYsl8S2lk
         2f3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719398379; x=1720003179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dhzrmXSqkGs39FUvRpHqoDKx6vIwMQj8MYGTdhz07CA=;
        b=M/daPcHQxDjrUkOF/dFI7IQP/U8SxNs/wmAKxdHw1YApfckOMieSzkMzliprBI1ZXO
         XhIANOnpKA1Di5f3V1zLnKUHaVxv1foGQfZSpF1ud3nF5/5FAQ0CgvVNIo+0oWEkW2ay
         w97cnrkVCErjGNTnkeM7WjJUe0DEqpuLU3hki/ozTFs+03Grgil11EooAMaGqW/S/nNN
         WsMWQCkwBz9dAuTu4+PAK7PgbSPQUjCoLFOjrH/lY+bfgZocKX1vOTR1ypwgbr9nlRwR
         uuiWCthsJ4zmb1/BB8YCzzoaHyoXBq36W9qr1a29F7SGax/wxx90lg3c8C9L0RiNB7xo
         U+VQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3FQ1v2ODgMxOIle8jOrS3TpBrXFxdskfpaZhddqMkoch7eiDedR/13W0XkyXwSGShmwM90iy0E84sQFIz8VNLcFE9G5BNeXEqaqeA7xxx
X-Gm-Message-State: AOJu0YxIvDe94+1xkOA/wD706xjGB/6tcE+PRV64weZkhilxIhA79lQW
	9eu+y/CppPGP+xpCDcelBWRs11/BnqiwYTyF+Hg219JAwpUyywK63saP4yhwXOEGt8IV7fqLzL8
	a2PVzeorUWcXZGcJa63rmNe+e6w0rEi+J2Jkc+w==
X-Google-Smtp-Source: AGHT+IGYshSBJsGbHR85N3D0SqXv/Z+CwmWb6YgKDMMrKH9xuw/NNa4H4iXEgCzLOZ4A8G7yHxUcn65HQg/ShR4nufU=
X-Received: by 2002:a05:6512:ea4:b0:52b:c33a:aa7c with SMTP id
 2adb3069b0e04-52ce185ced0mr9513273e87.65.1719398379358; Wed, 26 Jun 2024
 03:39:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1719037737.git.christophe.jaillet@wanadoo.fr> <5668d73b92eb6318c7f094a9a8fa914c909485ca.1719037737.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <5668d73b92eb6318c7f094a9a8fa914c909485ca.1719037737.git.christophe.jaillet@wanadoo.fr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 12:39:28 +0200
Message-ID: <CACRpkdaXQ+qgXsZ=nUzz+MNzTWsK32YEpJH3FT5WzDXVS=hd7A@mail.gmail.com>
Subject: Re: [PATCH 2/3] power: supply: ab8500: Use iio_read_channel_processed_scale()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: sre@kernel.org, jic23@kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 22, 2024 at 9:05=E2=80=AFAM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> Instead of rescaling current or voltage channels after the fact, use the
> dedicated scaling API. This should reduce any inaccuracies resulting from
> the scaling.
>
> This is also slightly more efficient as it saves a function call and a
> multiplication.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Very nice!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
