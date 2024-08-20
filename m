Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456CA18A6C6
	for <kernel-janitors@vger.kernel.org>; Tue, 20 Aug 2024 09:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724145586; cv=none; b=F7cyRHkHmvCs1WzPwO/wQ9eACaMHZxXIt7vi0BNhNc+jmQY6GyF3RIQTG4TZMj/WyyfPVL1zp5+czhXIjZiCItVVvKWQE3tbfHdeXmnkuhCC8AySWRqFyd+ww3mRxV34v+zg4vhNeq8BlhZNUZ6nXoDuXtXxLb+Wo/m0HOcAuDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724145586; c=relaxed/simple;
	bh=0MV9FrI9hg0tXVB/R3eu45u9Q78QI3UyLxdQGYcO0ME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SkFYNmY0hpezwffIbge1JOEZlsoGfzADEHhK3cxNsKcjLueQQikfcL+LJw++a0AtqwMwAEm3DB8JtqnYKfPY+jaNzRCeavdfhcWMpoGUv+MPX0q2l1LG5umRqdkO3v7JY3pvTVp8/hgIEFLvdkZrN+MnoIK47eQMlLLBZ/UrgVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=SWZhXGNK; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="SWZhXGNK"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-39d2256ee95so22368475ab.2
        for <kernel-janitors@vger.kernel.org>; Tue, 20 Aug 2024 02:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1724145583; x=1724750383; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwPbfctzRfZa2/zhqSrtwrO42MOMX85GRmKfc11Yv8c=;
        b=SWZhXGNKuSYcSUEuFcqmbXccpN09Xc3E0ToiQ9K0AkH+p8uevuD0F3fRqbhSHiwpMi
         WZJkjYUjw9f4y01WszDLEM6HNqQNHSMrxOe5RRmcCQV32VE1IoqTEIMbesr6cGqJrozM
         T8ZQbDtUvltTFQfRY9K6mKtNkY3bnv7UnRxS0MTP069ac/9mIIcaEgfZanuLOzFFWfv2
         hk7wEZf5zmeC55wm7WV+BUdkNpuIxBF10HAQB4R+XFMIB9Doi30sNYCOp3i7rDql1jbu
         vhsEBCef65PRuISh2DyPAngLt8RVem8KFRsOYJL6Sy9dQaInmhDMQ5ZSCnLhjILShQiK
         UuCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724145583; x=1724750383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zwPbfctzRfZa2/zhqSrtwrO42MOMX85GRmKfc11Yv8c=;
        b=WzrQxL1AGx5CBNVUFV7PnV6iF0L5tJ8xYHLeQJmskD6Zn/RxOJVLN4MZfZnz3s/poI
         MLFAqb5/dzsSleKj0UdLEgu7glzuvndzlSFWJy4HErFjWw5kUuRkKZF/GDNiLak5kaHA
         NfJxukzefPlTXE8aqaMlGJtU3BKBjylfprCXZNDF0svzn0U5dggE3i/GbtJqzneohX55
         ifsysNAzcmJZ9TM+BBTyiujBxwvC5TXcTzniNDMbVfLZ4zb7Wc5vcCekGY/fm5IVvNUf
         2PQaTERz49R0xmOLQuSQNKuMJHMGgKPIO+I0uemNAy5r+sKIqlYssRn/WWs5wlEgBGEQ
         3lyA==
X-Forwarded-Encrypted: i=1; AJvYcCUa7glcLhA0HB3qKMwJiX94KeTvZz8HVoVTcc+GCGMRR3b8z0ddFogEHoqPvO93ADuwznWaZ/D3Q8x7XC31y0Kerk0Z4KfLWOWFBvQI2SNy
X-Gm-Message-State: AOJu0YxHnTmlexdXGLnIfJ8jaMsJk8Ic9J5p882+vIQrZnw6ms9ubXvm
	FxZgUvkPb4YLYSZoy5JiUsxC5QurmhuY86z3sprKcsnMY5FO6JwFkgXt9iVCwDLK9qRX9hHqfk4
	KYrYV3BkTpQbxDnz8CI3pgzYgahEeF6278UCPjQ==
X-Google-Smtp-Source: AGHT+IExX7dzgemFOY+5Vhm6vcIRzonwTa1j3n/gS7/d7T+aopXOQDlPfujd3coFGkXkPVCcQNAlbebtpfJSDbgjJjI=
X-Received: by 2002:a05:6e02:1fcf:b0:39b:1ed5:4a55 with SMTP id
 e9e14a558f8ab-39d26d64ac5mr163368045ab.24.1724145583225; Tue, 20 Aug 2024
 02:19:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a5a628d6-81d8-4933-81a8-64aad4743ec4@stanley.mountain>
In-Reply-To: <a5a628d6-81d8-4933-81a8-64aad4743ec4@stanley.mountain>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 20 Aug 2024 14:49:31 +0530
Message-ID: <CAAhSdy1n54TxAiPHwrRBmvNZrijoFGXbgq3xb8LXVtPCD8udow@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-aplic: Fix an IS_ERR() vs NULL bug in probe()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 2:12=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> The devm_platform_ioremap_resource() function doesn't return NULL, it
> returns error pointers.  Fix the error handling to match.
>
> Fixes: 2333df5ae51e ("irqchip: Add RISC-V advanced PLIC driver for direct=
-mode")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  drivers/irqchip/irq-riscv-aplic-main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq=
-riscv-aplic-main.c
> index 28dd175b5764..981fad6fb8f7 100644
> --- a/drivers/irqchip/irq-riscv-aplic-main.c
> +++ b/drivers/irqchip/irq-riscv-aplic-main.c
> @@ -175,9 +175,9 @@ static int aplic_probe(struct platform_device *pdev)
>
>         /* Map the MMIO registers */
>         regs =3D devm_platform_ioremap_resource(pdev, 0);
> -       if (!regs) {
> +       if (IS_ERR(regs)) {
>                 dev_err(dev, "failed map MMIO registers\n");
> -               return -ENOMEM;
> +               return PTR_ERR(regs);
>         }
>
>         /*
> --
> 2.43.0
>
