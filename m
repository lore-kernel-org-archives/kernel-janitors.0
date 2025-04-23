Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986CC26B0B6
	for <kernel-janitors@vger.kernel.org>; Wed, 23 Apr 2025 10:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745405999; cv=none; b=ncQ0wBjoZBg4ETjXyQ2D65TC2WT/I0/SR7TOpyl7nHrKZOFHBd4QkZ4S/KPnGqNdXrPdlYM5G9kQHPVwSIzOSMj949mdub9ceuvst9GbZJ2YJ40Yi4qfFscuBNcTYmhf8g4stwoS+y9n7CRsL2fDCY9vQocE/Q2ogYAocwS+7n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745405999; c=relaxed/simple;
	bh=1yGreJeglvKuZD0fGUj7A/qJS7yybhnwZk+WL1e6ipU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SSLUrf53ELrm3OtLhb+ECX1PJdZ4JHcyeuP7d043yqafVmT5R2LqyFnOSFpUTE6x/Dp9mcT4fnt9edC1UPFd4kypnu9mZMkOp/su9Ucvr3ocpgPpct/MjRIOvTJBsA8olV+ilsDT0f+d6VeCyyO4wHU/J4u+u8Kb9PC3KnGbsAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cy6m4utv; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cy6m4utv"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-549963b5551so6741374e87.2
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Apr 2025 03:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745405996; x=1746010796; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3cEhVrVTg0kZTdvS2evoNFsbjUG4Yiqw/nFRP9UnlM=;
        b=Cy6m4utvPD+xBdA8LKOxfUSQIZ5rteDxmHyOiMvSAxr53hJvFrTIx/474M8UqPF5cU
         8GNQifmjLVE6I+R/JOP1C17I8iACQC+byTCBSyoU7seymtXbPQRKyCRBVDwHN+9L4tUM
         pxxTTrL0NnQLdWLb4W/MyZ3Hhg8NCl72xBThZtmkBh5jQhcLS86knf8AohtXOxRKrMhe
         Rgz5wQwE/4lH8FB/8fsLqEX/Kd4FUBP6Aqo5IJ0bzOKnw4EjZCvyXTJwkPl86jaJB7cs
         pbIooZVG0ZM9ldKfe/9Icuc+KbHA6y1jBX1fWPgPTHuLDn/ufuIgkO4hSZYcM2oUpsLv
         q+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745405996; x=1746010796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3cEhVrVTg0kZTdvS2evoNFsbjUG4Yiqw/nFRP9UnlM=;
        b=HdufmFupFRxWo5gQSQo5qZbgsxZr5awIeuwDmTmT4Lz7Dl1PnVpGPnfcR0cSjvTZvY
         OSysTgZrnRvPB0vqWTtOGE0YP2L+2SoQDOb31IiIEk8LP0sMwYk6kAplzw8hElPhPFoF
         jGcMvBHGubxBdgpGiLlnqhvcp9gM9yn8y5lg5bxlXrz5xC9Fq2olUTpNbgw1sHimxfpK
         Z59QwMLFetJJkhqBUp/dllK7iw36vcAalwVMZvRtNOrQcWk8bXDTxdyVnVR1yE10iD/i
         YzMbAhQe5MlnGYfLydutZc46+wfmp58jh8NrZjit4KBH+7qGMyYkrUi/UKBOWH1TmgEo
         Zhmg==
X-Forwarded-Encrypted: i=1; AJvYcCUlyVLiIAoULV8UvEIGX/Q2XVRajH+kF4+8i26nbH1cXFzitvGejLwmSTGHN5ytwsOqes8+1IxJyCZsWOPcYag=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR7LWcpg2tmn2pyAtKtKq87vUaxghuR1R9oHX1NhUt4CFJpraD
	RAitAg5es6NeZipVoFOpmVDcERmShBV5tP1MPn2Xg8ouiMYy8reiV1ZH6ERLLQ6WyxSzUkFoV4n
	V6vTYBVhxYaZO9Jl6sIuTuHBpi330bCwVqjIPFA==
X-Gm-Gg: ASbGncth8e5uW3tHqDF+egNMKVuyMEz7kJv7Q+sKijsHQ27nuEvmgDChFfBt/7PuHBK
	pO5nK5QbdOhkXZmmXlo3rbU/vZxp9KUxA853/mvsTEwYpngHmeSTEVJBl+i4ldRq44nQol1zr9L
	wxspraD3FdnmjSoLFyHwvjdA==
X-Google-Smtp-Source: AGHT+IFtzLtF0BmAxKelCLV2/wocCla2vyxucaLxjvgEw30Sch51eBsux5LzRyNp/HGiwEeiD7kURWUr//rXX69Cxn0=
X-Received: by 2002:a05:6512:318c:b0:54b:117b:952e with SMTP id
 2adb3069b0e04-54d6e66cbefmr4418385e87.55.1745405995686; Wed, 23 Apr 2025
 03:59:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aAijc10fHka1WAMX@stanley.mountain>
In-Reply-To: <aAijc10fHka1WAMX@stanley.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 12:59:44 +0200
X-Gm-Features: ATxdqUGhq-8Df0lmzkXAKLmMqiEIc6uB0ArJmTsIwn6uONHy8hOiVyiU37DBzSI
Message-ID: <CACRpkdbLwZuFKqLvdkuCodQrNb5h-W9567eA4CLOP1FrV+PbZA@mail.gmail.com>
Subject: Re: [PATCH next] pinctrl: mediatek: common-v1: Fix error checking in mtk_eint_init()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 10:23=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:

> The devm_kzalloc() function doesn't return error pointers, it returns
> NULL on error.  Then on the next line it checks the same pointer again
> by mistake, "->base" instead of "->base[0]".
>
> Fixes: fe412e3a6c97 ("pinctrl: mediatek: common-v1: Fix EINT breakage on =
older controllers")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Patch applied for fixes as a fix on fix.

Yours,
Linus Walleij
