Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3JFzdoVX"
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A47C2D71
	for <kernel-janitors@vger.kernel.org>; Tue, 21 Nov 2023 06:05:39 -0800 (PST)
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-58a0d0cdcc1so3570766eaf.1
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Nov 2023 06:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700575539; x=1701180339; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/TcEF+FhqZ2nz6qvi/9iJUZggk71Tmqu0as2U0xGu4=;
        b=3JFzdoVXCUHDirJnVsMkGwwuXQY4e9DuM4YaIHoZFNPMSxUHoqRySYBWBdNqSMjEOu
         0kUmgIbpNvUMjVL7sWaN6vP6VOy374WcAWPNBTCq2sk8O+Hd83vgoMzJ62pLwDdVKRcV
         a0VrrFm/BROgonetQIH6hKq45kL4OqsJVRI6JYKjft4fxrMGxFdjY189G2cw8VQ+IfNW
         n7s/Ox1Y0BWueg/YmNGtZA+CmEb5iuvunqdYCCXla8pFo/YExJdVwSz/jTjYBpK5HQOg
         ZZwfNmcBe5+arf9u5/MVNaKxAuh24I560SfJH0zTPcKBcfnG6LI0AmFjrHVMmej//uBP
         ZnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700575539; x=1701180339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/TcEF+FhqZ2nz6qvi/9iJUZggk71Tmqu0as2U0xGu4=;
        b=vSWj7TJKr/VzMsFgylFRhOmRqn2emvAzabP7LTvwAsPpH/yx7VLmu1EI9W6YRSDUey
         WyZZBuLvq6ZWij562it/a1qkgDmZPafKFlwLFURsPGec9gbRU6uxEGuRh8h3jwu06AWH
         f75NkVEBStkm+u51M0St75pLQ9c1do4eLh929ioxkhJDeJdz0MrkEQ1KOcMJNyr8635G
         i+OPUhP7J+KNDws9AZBZ9mjwe81IwiQ7+XFTd5fC58LN0L1lthES1dUXpv/9K850Pe5y
         7I35gUuFfkuPAvI6Qj5ckBfz8MbBbxzgViojaimHclYX8Phwr2ePMooDcNu/KeBKzJcF
         Y9WA==
X-Gm-Message-State: AOJu0Yyus3qJOuGRvO38SdIZipwz0khbvz3VvQdDLXI96hMwJtH3ZGir
	mgMzzLGhOdHI2sRveIuKXkjKzotYrFk8KBSXT3jGesj9gqNdRKLi
X-Google-Smtp-Source: AGHT+IFdtzRXzXfVy2Uyhi9mLRyDdjmHGp1/Reyrw5PR3wZ9oCq2hd80cAXzSj382UrLHy3w0bEY47RRQFKxOu/bww4=
X-Received: by 2002:a05:6358:199b:b0:169:7dad:fee1 with SMTP id
 v27-20020a056358199b00b001697dadfee1mr4692933rwn.4.1700575538944; Tue, 21 Nov
 2023 06:05:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231121085024.15955-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20231121085024.15955-1-lukas.bulwahn@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 21 Nov 2023 15:05:28 +0100
Message-ID: <CAMRc=Mf-F5vRPwtV37tuj1-Nwm6ncWM9xfgY-DvYaXXfK1rA7w@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add TI da8xx bus driver to TI DAVINCI
 MACHINE SUPPORT
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 9:50=E2=80=AFAM Lukas Bulwahn <lukas.bulwahn@gmail.=
com> wrote:
>
> While doing some code cleanup in drivers/bus/, I noticed that the file
> drivers/bus/da8xx-mstpri.c has no maintainer.
>
> Although the file has not been touched a lot lately, the git history tell=
s
> us that Bartosz Golaszewski is the main author. Further, the driver's
> config depends on config ARCH_DAVINCI_DA8XX, and that is defined in
> arch/arm/mach-davinci/, which is part of TI DAVINCI MACHINE SUPPORT with
> Bartosz already being its maintainer.
>
> Add drivers/bus/da8xx-mstpri.c to TI DAVINCI MACHINE SUPPORT.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e829dbac1e99..e9cbf6e353bd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21707,6 +21707,7 @@ T:      git git://git.kernel.org/pub/scm/linux/ke=
rnel/git/brgl/linux.git
>  F:     Documentation/devicetree/bindings/i2c/i2c-davinci.txt
>  F:     arch/arm/boot/dts/ti/davinci/
>  F:     arch/arm/mach-davinci/
> +F:     drivers/bus/da8xx-mstpri.c
>  F:     drivers/i2c/busses/i2c-davinci.c
>
>  TI DAVINCI SERIES CLOCK DRIVER
> --
> 2.17.1
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
