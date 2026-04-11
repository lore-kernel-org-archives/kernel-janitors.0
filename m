Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B122264D3
	for <kernel-janitors@vger.kernel.org>; Sat, 11 Apr 2026 10:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775901833; cv=pass; b=BuChRTGnJt8VLMPsTokOz6RKbooezM8vQDfOnEEiMKwxxlRVfuuyoDVL18d5AzmIuEQPSfWyUy22sbCEHwCIfUGjSYiVCa8Dt9XEHB7kY19IuacHLysFl1UNCy7nN1LfY6B5lHJgS5XfkZ8/gzff1uQcrutNX31Mk2prbCx3wuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775901833; c=relaxed/simple;
	bh=tzdzv+Lu99UxUsiPz6Bj7C5mvvvg0kBPlXADJIR5SZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O7iCQvMWC5UZnTbx1ip3+cj4kU1PO8GejviGPrMaFDhaKfOJW7mBmiAZS62HwKMHsJJ6BINmwAbgNiZ3E6h1F80EXXgWr+U4DRL1a9OnLdLkcRwgaW4Rdy1tL0PZ3tAraDwN90JJMwOP8TUMGUZTwD2m6E63794tV3rn66bccJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFcC5sHf; arc=pass smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFcC5sHf"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56db63456d4so1062025e0c.1
        for <kernel-janitors@vger.kernel.org>; Sat, 11 Apr 2026 03:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775901831; cv=none;
        d=google.com; s=arc-20240605;
        b=bbRM8Ym6YmprZvVqMYQzqY66EtfJ915HB3qkSkOeis2TRCwmzGzBWFsTUtKBtHbHrD
         cqZe/L1IVuDFPwfbeyAZhEJwJgtUWTYF6uzSGYNE+NOt1G1/WZQ0oTJaXGrkWNvR56kQ
         iU5GwQ9y/zO4TJg2WP+9XvuS6tdTs/pthArexmwXaaaFF8l/8pu2vyIpmWfSQnv/9FIT
         p8/gfw5UbT5aLwt597EqZz6abzAML6rEabRxPI4FzdsvzllXASnNPehbYylyxL2PVO19
         ZdvmJqGd/R3/KBH2DfIcGQwwpHr/66NzSTxiRX1g2Vpa0VWs2qR5kVJFNM/36+PqVT0l
         wyFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tzdzv+Lu99UxUsiPz6Bj7C5mvvvg0kBPlXADJIR5SZQ=;
        fh=e9BtA0KkT04oPSgN/0Eceoxi93BFS9go6Q3UfNSx1+Y=;
        b=X+Hg5FzJ0b6S0JH4EJ6z5IA/qrOqOWfgM85CyXy8t07zKGoRhk/AUMz7v0TKlf5CxO
         dLI7M3g5672zjbe56472JyGjrM92Tc+MF1MkKInnrkT0y8N9tx7AYby5sp8+dKgjWTnf
         d+4tawrOrobc2taCueVGE3Hsa2I08QcjCM8Io7CxOl39C/IxGCKqRxGj1IXFt9E3TQ7l
         XrWvJXZvjKAN+lAZ1CTtG49f7WfzwGl03aV2hb065LDVV8qjS0NJ4SogO4J0hKsX5Kq7
         swC/TB1fvrFG3tAUmWWxGSuFhn6OdVb6vFsnOpg0aolFRhVSB24quBMPwwLE+uqWVdrN
         NCOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775901831; x=1776506631; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzdzv+Lu99UxUsiPz6Bj7C5mvvvg0kBPlXADJIR5SZQ=;
        b=DFcC5sHfJAqb0d6OnOOIunFCWleiQrmBURyHzZ260ftZxF5k4pkP9f9VhmllhU/qlL
         FSKl+UN9EmHp6Hn5gCAbnhpl82qpiRWSNdlj8hcASjd6LAAsQdYWEPgprtl5buY83JZn
         D38Fbxfyp8mVdk7GxZ5DNX9JX4F88uwqOVXJR6q7sNZDbdL8v+gxMdFtuyzR3DlKV7cN
         zNVPDPB4IKpPAT//sWhZCXbrnh/SnV2dhBuKg5++KpKdiWAq0gpV6EgWzjRvE2EezO4u
         WYObvwiousz48vMUWgzf/d0toXYxIz05c2t0SmreZhVQsrOCGTIoUTfO23PU8+ARDkcy
         PB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775901831; x=1776506631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tzdzv+Lu99UxUsiPz6Bj7C5mvvvg0kBPlXADJIR5SZQ=;
        b=CgKYdxqIxKVhmWev158TXdeURayCoTVxHWVwMrQRyUwikIH+4qw7q+kyttf/R88U9Z
         yyIoWhKVV8RX68fT85GEZMhTgjzzCkMAruKO4yCZp5t7kfi+qe02FV14gOfk6TcjKhQr
         wrRQjFF+iL+Tk5OgSGqEEw/Sk1KqMn8vMU29giQ5mwMBEB3pl2nesl+zMgAjPpw/BbVu
         sGwRPWIwnaYy785ZYzvZmQwiRXzqd2g4gouyB+L2s6mn+2K4JL51zsR6vrO86di1QHpn
         fm2TFOODhp31Cm2gD5XCK7N7cBJ+JHFSEPYmLF4tCVFHnW9jFhnvYRqU2dAJqxL6YHEa
         ul/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXv3cI4YxeWtutzBoGJh8vmLZnv2kdDUqAL6QpVyILhGEL8hz6nDk3BuqBLhtj4l45TKYdX2dfH5E8Gt7ye9cE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI8/tAVghZX6dJZMeTI1v0YauGVw/lsgXGoCcNSgah4RYi2CTe
	NX1nSTFVs4mAUEfJPEJrqq63aC5993iulPLTkWqVYxRSstjqNiRSYusjU1sYgjGltWH1J7/0qFZ
	VvnoGmVCtdMDmHqcIvzKvZEXeKi1X1Ig=
X-Gm-Gg: AeBDieslRoWX6vHpl1PX0mGJZHbNc6qrqu+bTDKbhzTem1VOVTJf6t4aakJ2UzoNSts
	uBqxyrFMIAUvJcX005lv0U0HZmrvtK6UVTCRBIi5Wi74cP31VUsqpipa9ICScX5e+AmsgL0PDDn
	bN2GzVp53ZjJfMsWD3onNSpyEkSwgxGK8Gs8gAvhrNXxX0+zuNgXN3a2OlfrOI/RwIJa8gqPpii
	bZwI4jihXiV5WyOa1VVbvq3yr6xDQHU5QO+CsgHVizr2jkqxTJ1MKFLXlaz/JIDsM8FfWHozixJ
	w/ZEjD7ho19f7dBrM8e48J/kf6ZYTJm8hKG7tMzr7rI80z4Opw==
X-Received: by 2002:a05:6102:6044:b0:5f5:4055:4558 with SMTP id
 ada2fe7eead31-609fe48d9d2mr2627787137.2.1775901831007; Sat, 11 Apr 2026
 03:03:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <adjM-IhvtrghMDnB@stanley.mountain>
In-Reply-To: <adjM-IhvtrghMDnB@stanley.mountain>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sat, 11 Apr 2026 18:03:12 +0800
X-Gm-Features: AQROBzAyYZuFVagVc_vBOi-Hx99ZeQPhqfSdTs1lmogRFo2Oryli_H93NDHjpRk
Message-ID: <CAH2e8h4=+qATNBqQDgADjctkjtabt+8zpg0z8zBRSN6bzBwxcA@mail.gmail.com>
Subject: Re: [PATCH next] drm/panel: himax-hx83121a: Fix NULL vs IS_ERR()
 check in probe()
To: Dan Carpenter <error27@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 6:12=E2=80=AFPM Dan Carpenter <error27@gmail.com> w=
rote:
>
> The devm_drm_panel_alloc() function never returns NULL, it returns error
> pointers on failure.
>
> Fixes: a7c61963b727 ("drm/panel: Add Himax HX83121A panel driver")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---

Sorry, Chen Ni had sent it.
https://lore.kernel.org/dri-devel/20260327021728.647182-1-nichen@iscas.ac.c=
n/

--
Pengyu
