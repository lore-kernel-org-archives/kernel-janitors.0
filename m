Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAAE198E75
	for <kernel-janitors@vger.kernel.org>; Thu, 10 Oct 2024 19:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728587649; cv=none; b=cwI7/U5s7wAKNR+qvzmzzb3m5Bqm3XHLVdC1sXQ3PT5dWXNhLWv9hiHADCiz3DQ+uwSDFel9QSoTWWgESUu+Bx7M9SIoHCr2AIa7kilpNTc7MmTxsbi/C17GZx36SrtgJbHi13UZyXWmCdXUKRwT1XW68il8UGeJb8XVEywtCFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728587649; c=relaxed/simple;
	bh=lBkM62Uf8D8hipuH2exP+YuvyI6m5at/29z+OU9H0so=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QZuSSXPm+F+H6PKQEIsg1U8d/cRNBOj2JjuWxpiNl+O5BYdunL1uyfMkIwC5zPoHkuTbhPp3e0ygy5LZV+236tQ3ECQAYHAAdkSFXRFd/ICnePepJQFl9+ZiWHwiiHh0/URSbcKw4r2pQHm4LGeX0ekpj5QJtD1/XuwiVhn1RGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iEoXIubN; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iEoXIubN"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fac63abf63so13761211fa.1
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Oct 2024 12:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728587646; x=1729192446; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBkM62Uf8D8hipuH2exP+YuvyI6m5at/29z+OU9H0so=;
        b=iEoXIubNWA/00BR6qgdlM6a6CuWLlOjndTB58zlrHD9cPDSkWWGVkwJq4RK04x1pH+
         VB8RxVP4+Mcq/gqvnVJ9MumW9B7AtZJXAKkACuCmMn11dcPktE0JpwZhI6nHGM5DPj/8
         JaHNsV6ewop7NU7HKT04V4WspLcP+R8hkKdMEaAib9pG6B7RdtzLmNJehBC5xBmWN70H
         7YTYaoXEf7ixkX3p4bb6C1qDhPyJibnPrw5ytjg2chQYcD/J0vywotA1/6ioQhFa+gN5
         rSxBnpoQ3d2XNxDvU/bHNDP5ZcqFKlQYHKJZFxffwnYZuk503MDaNPolKIbVOAIk5ctP
         YLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728587646; x=1729192446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lBkM62Uf8D8hipuH2exP+YuvyI6m5at/29z+OU9H0so=;
        b=tuf+7VJ/MTTtWAeTkFAflL/6JqRZvMX8RBpDYhcn7igiK8hN3agZJNXpgj2G9qjwjQ
         //gNQ6r38TwAtZhlW8rURwGfYU/SaHp2GWlwMRYVuxQCpF2iVQ4Y0QDHVhPqssyduJOJ
         nztb51vRFV4sPNRo961CaGXcXvYsoInCfvseRQ1tJ4kNrf7qPXfviNg+LvyvAOmfELGB
         7n/zt2yBntfiC8+tpV3VR2GB5uvR4EwZwxHarnuiLlQwdgg0Rm0tEPUsFGQrKkILza5M
         IIOdspMiUNmWgYGBTANLzOqU3eFRTNmtERlMdX1iMRu94IhDphhn7wdMnStqmw1I/30+
         Ytmg==
X-Forwarded-Encrypted: i=1; AJvYcCW3hfNp8UYeN+yZi+fIfyg5FCf+VH7u7TBUrajGjaM6HcFieO2UkcXmsLwVZukLJb/xpR4gOGsL0ufiVF9e0/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyut4ngQh606xak8V0YiDR+fRp4lxJBIOX0rdJx0Jr6wtGlQYDw
	QjT6icy/Y/qXUhbcqslkxTXrQGFyIakqiJYJk4vYlL34oDEIdH9d2Dv0TCihmlNcq5tFIDmrxO5
	InEnbRPpa/xv6IJz3rMnZDJX/Bo9dWCpzPTatuw==
X-Google-Smtp-Source: AGHT+IGYOggXOh9XepD9Y//uWBU8LvHdBKPWy+BsszcaeSthF4pIcJDZgS3LzuK0LgzQT8i472E+9VsKzKw5ReDQJE0=
X-Received: by 2002:a2e:b8ce:0:b0:2fa:be5c:8ae8 with SMTP id
 38308e7fff4ca-2fb2f482b65mr2900631fa.41.1728587645756; Thu, 10 Oct 2024
 12:14:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010111830.3474719-1-harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20241010111830.3474719-1-harshit.m.mogalapalli@oracle.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Oct 2024 21:13:54 +0200
Message-ID: <CACRpkdZgA=+ZOq+shF4pWcGZ95=Kj5pxBtvywpGc_kkYWVgqMg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sophgo: fix double free in cv1800_pctrl_dt_node_to_map()
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org, error27@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 1:24=E2=80=AFPM Harshit Mogalapalli
<harshit.m.mogalapalli@oracle.com> wrote:

> 'map' is allocated using devm_* which takes care of freeing the allocated
> data, but in error paths there is a call to pinctrl_utils_free_map()
> which also does kfree(map) which leads to a double free.
>
> Use kcalloc() instead of devm_kcalloc() as freeing is manually handled.
>
> Fixes: a29d8e93e710 ("pinctrl: sophgo: add support for CV1800B SoC")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

Patch applied for fixes!

Yours,
Linus Walleij
