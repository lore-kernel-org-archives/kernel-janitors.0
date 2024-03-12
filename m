Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D9279DA7
	for <kernel-janitors@vger.kernel.org>; Tue, 12 Mar 2024 11:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710244376; cv=none; b=t9Iy3cnWwkxykAm2962ickU9lPl+8OmafXxUXg0ZpLx7gKC3A1QI/oxm2EmahB2dcztsZ2+VhK/FXy2gigqk0OJNmaIe8IQFfcNE7PdKVwFAu6SHhrU2n24tD+o1/46ISi5ijF60cE5LqmUzwhDXXpqrnqQpHp+Cbf8amESkb8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710244376; c=relaxed/simple;
	bh=JWULMh7o9qtF+RsBiOf3B41hJfHZ1YtSIOHKt7eEqF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JnAejwhl8cgD/ULBpypBWwzURqgdp7a+CJNkIbWm/E6HC8fG/0HToQ4fvBX2/I0YtB5tTyW4+moImCLiZW0w9zfe8t3ZvEVBe939Htnh84tX5NXBs6PvCvrdRmP0b55ad8JIoEcL2nUf9vKTNGmj9Ho7N1yv2ow6DK7VtJ33NIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yZENlQaD; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yZENlQaD"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc74e33fe1bso4883908276.0
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Mar 2024 04:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710244374; x=1710849174; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYh9NgFiUlDSRFh0N6tnk2Yai7KZlV9KzVjtJmtqPwA=;
        b=yZENlQaDzlx/kvHDBhrtvkA4pnGAmJ+dTWbp/c6NJHi5zG5fb1aQWnofvuCtgwEoXx
         f526ph+FDmbKC6AiAadWwltrVIGGLNA5zMW9KJQM3nipF4ssFV2K2GGRwqPcouDt16Qu
         QLdkpSFfvRx52yqkWDMvfaaInDlwACBbbsu/4TEo7JLu1Ym2HruaiwAFw01S0KB9LQf5
         xZOGEgQB+VwyfwMzydkXkBQMaD2BkCMn9c1I8oMalsLNOh4F0u0dC/ONrWFX4HoGCqAx
         bn4Lx9X6HOiUiIJ2xUDI6yeLwR7YRPzRZd9WW9hsTWBofm6T+wU9qy7TUOP+JXfybLUe
         WkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710244374; x=1710849174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iYh9NgFiUlDSRFh0N6tnk2Yai7KZlV9KzVjtJmtqPwA=;
        b=lfS2cfyGzvkP1IVaYtznMCekINNTVXyd88kRlDiLPDv17yrQUaZd/GtHt4jpjj0TGV
         9X+PCvnx/Ay5uBSpe9HXwentwadsdZ5kWMbBxDOBd3DomWhFLoGDXkdSNgBWG5rw/gCh
         tsihNUhJIQ6ZfThI/kBpUj9fmi1uzdQQwcbevBaqZrMexgXegBfmiuSS7rvBLRpjVwlC
         e0/Ucc0fVK35pFFeov9On2l+UkvEzaBiPcVvyysb7kvIVAnyFUb/owRQLQiEGSpMpcRo
         zFepCX8re5kA6lNQGxisiqt1Rpd61XKuIRuClYUz23wDbpkn5RN6IJoYp2WGzHuvdLyq
         qJFg==
X-Forwarded-Encrypted: i=1; AJvYcCUEHa+2IL33Af9H5EDzpe7VOY2aBzRwL4MGhw9CFT7Y2radzpCo21nbnq98XK9yeuRLY/VW0NZSlBM0EwSFWQkkUenpiA9eZm+7K/WwWVgn
X-Gm-Message-State: AOJu0YxB1ZgS4RVZDMI9a/wQLCBuI8tlqfQYZ2PIe5d3m0XkFVCNXNpV
	susAK/GSU/1561blWO7/ZQ5nvd6i5p/7l8Q6mxmhz2FVR5M2m9TImqyi54QYY4IVZftSoQIQF2G
	6nX5goB+61OY1fA4y+dsQvWked1hWsbZL6+0B4Q==
X-Google-Smtp-Source: AGHT+IHM4+XkGrEr4TR1Ej4v7sv8rnNzednJ2Q7ydm5WMikNndCuOBWPz9jPurIvtRqHtOuQiNrGRxmNT6kHIFbRmWU=
X-Received: by 2002:a25:140b:0:b0:dbf:23cd:c05c with SMTP id
 11-20020a25140b000000b00dbf23cdc05cmr6527345ybu.13.1710244374125; Tue, 12 Mar
 2024 04:52:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae643df0-3a3e-4270-8dbf-be390ee4b478@moroto.mountain>
In-Reply-To: <ae643df0-3a3e-4270-8dbf-be390ee4b478@moroto.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 Mar 2024 12:52:42 +0100
Message-ID: <CACRpkdYtiyHgvtPJYxq2BNb9UxthwPQPHyUddQ5Q1eat1NY4XQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: nomadik: remove BUG_ON() in nmk_gpio_populate_chip()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2024 at 12:00=E2=80=AFPM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:

> Using BUG_ON() is discouraged and also the check wasn't done early
> enough to prevent an out of bounds access.  Check earlier and return
> an error instead of calling BUG().
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks Dan, I applied the patch to the pin control tree since the
rest of the stuff is resting there and Bartosz already sent his pull
request.

Yours,
Linus Walleij
