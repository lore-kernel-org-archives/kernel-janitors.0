Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740FD16EB7B
	for <kernel-janitors@vger.kernel.org>; Wed, 26 Jun 2024 10:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719398289; cv=none; b=nrtcKevzTmYeVGTr4HC2HRCzgGTqULVov4pCu3E6L+78kVLOy+0lvMnFoDSrC07JXCRRthlPfh8YHM3dOJU0beAzNBb1rfaTYTALR577zmsj5DdfEouXBhEItSuRBaOMY+0fqwhVzrcV3axORytHb2FJnIBhSBYHGtgnmH7/P/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719398289; c=relaxed/simple;
	bh=VYUz5N4gtv8iv/6U7Fma+w++MYKM4dTro8aD5iMAqJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qwgi09MAOkS/Hr+0Y8fTVrQdnVLvs1YUYfNxkl+p8hcnVwm56FgFA8ss2srNilT4clA3vLOGbtqopBV7OvkGYlEMVPQIq9QzCyuWmJc1YElP+azIhnIXD4Ib+NIuKrRZwODms5X6lM3su67Ugyhr7BoFBmaJK/UwS8/r+QFC9BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gCVi/Odj; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gCVi/Odj"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52cdcd26d61so4706500e87.2
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Jun 2024 03:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719398285; x=1720003085; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KAP7Avo0NqErHhw/LgeqaI6OS2BfZZmGrKu2N8kUgqY=;
        b=gCVi/OdjXk1Y+PwpYIimpHcOd6rlm3EMdwPd+qg7wNDxO30YSdDKf+Wy1sJGxbJ/uo
         1m7IWGK1Q6YNDxOOexYKXdCB51zrmPR4r/wYD0/kNtIdvw1Z8O2i1d9igV/bOwf8PPih
         pZtEX55l1npz7Tm25GTml+EascAMpqfmopNa9l+ALEFPoBy/YVRJqerPoRSZaoS6ODS2
         uYIlDuIki+ZaWyfnfeOMNHWZV1sDzcbN4zxAaYTDEIqvcall1MIVi4ytLDITCOdWixG/
         dWSTeD/RM+3XzC+qJnhuh6HzsQaWw7uqDIFAcIWFaT0P58/Qtkp7mA3xT9RkK/mqcne1
         b7mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719398285; x=1720003085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KAP7Avo0NqErHhw/LgeqaI6OS2BfZZmGrKu2N8kUgqY=;
        b=qYnuRZHYheuvzhsA/ZfALvxpPldAXNNe36t510pxo7q0gmqoTqrB/fhSvTIkPeiBzJ
         gCLR1x+UX5CaPMW9GP5Km+0/lavYjsA7LjmUHeDNAEwIiseox6SJIoYof7DF5MXSiKBK
         Ve4cvH6zK0seUrLmWykNiEruQGFTrzTeUOvk32PSjD59wb0vIlbKC0/L3rM5C9wbB1o3
         PJ+jhbWOPiJgV3DMgNB9yPUuciOMUe5VEgYvbcaZNtD2y1a4J/hZbzLdATOiqu9acvSw
         edhhhfsRDxjyC7P78jA649dFO0Jqkh+kAuhCSEP3155/TCSc8NJSxEzo9feL5WfcDatq
         ZJUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeBoeFt79rZ02Ti0PtZt5sgyI5GQXEp8jL7zMGCcFUGll2g2wugmaXg0Ubk7ULHgmbZ8mhFkgqZODwdECls7/UX4C2QOk9CCd2pyrBuYtX
X-Gm-Message-State: AOJu0YypVy8zI9HWyoDTZPWMbaKSgC3YrqxCl5hP4np05eb6JMec2WDm
	kPuN0q670+YXxnHj8TovNzhWl8oZ/1t+Av+7u05PXh4MVX2xkF1s5DPpDlYfMeassEdpNOp667l
	aUSayXkZgV9avthehhDQSXKXpEJ3MfQorN6T4bg==
X-Google-Smtp-Source: AGHT+IGzCEHmUW20SzJfj/AOkF92f/FKlba7gvSlxZWz6Yna1JEIXVmc39gid0pFCtGiZI+oDk6MEqv5XprFAgIE2Tg=
X-Received: by 2002:a05:6512:3091:b0:52c:e54e:f84b with SMTP id
 2adb3069b0e04-52ce54ef9fdmr6615691e87.14.1719398285525; Wed, 26 Jun 2024
 03:38:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d01818abd880bf435d1106a9a6cc11a7a8a3e661.1719125040.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <d01818abd880bf435d1106a9a6cc11a7a8a3e661.1719125040.git.christophe.jaillet@wanadoo.fr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 12:37:53 +0200
Message-ID: <CACRpkdZ-DOLV1ZHALCDKaUjj4HjwX_qLJ9GttKMvrRJ867q64Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] power: supply: samsung-sdi-battery: Constify
 struct power_supply_vbat_ri_table
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2024 at 8:45=E2=80=AFAM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> 'struct power_supply_vbat_ri_table' are not modified in this driver.
>
> Constifying these structures moves some data to a read-only section, so
> increase overall security.
>
> In order to do it, some code also needs to be adjusted to this new const
> qualifier.
>
> On a x86_64, with allmodconfig:
> Before:
> =3D=3D=3D=3D=3D=3D
> $ size drivers/power/supply/samsung-sdi-battery.o
>    text    data     bss     dec     hex filename
>     955    7664       0    8619    21ab drivers/power/supply/samsung-sdi-=
battery.o
>
> After:
> =3D=3D=3D=3D=3D
> $ size drivers/power/supply/samsung-sdi-battery.o
>    text    data     bss     dec     hex filename
>    4055    4584       0    8639    21bf drivers/power/supply/samsung-sdi-=
battery.o
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Really neat!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
