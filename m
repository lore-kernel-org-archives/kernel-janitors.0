Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E08F350D41
	for <kernel-janitors@vger.kernel.org>; Wed, 27 Aug 2025 13:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756302204; cv=none; b=tY6fSmsPQfViHjJ6W9b2Zujhb/oTUREnS33M5VDuI4TxEoND8qBHB8/R8cTgFUi9dP4SkrC5A17F26WW+pdF0LjYgKCpARHruBTzKI+qvI/XntOd68xPFhy2ot8swQHT8TAm5xh3bALXbws8K+VJhuxmTE7NOWZKiXRoQeH7eNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756302204; c=relaxed/simple;
	bh=ROC+BxYJvxo4Ra+SaImrJ8k/XraQYmEOGcoclXesz9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s3U1sF9aWNxrqmxsbi3GK6Xj/P6cmMbWTbE+3lr7ALq5x+kAYJuIiushRrxRGdlua/xiVctB/ikDVWFihA80zEZlrOAqnw5vHRHnxMRduDdLwS18eE9njQuQ2FHjMRez9OLav8FsDGXUpCbf8cSsKjKvcWa0pVo487LA4A7iVZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HCL9JgtT; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HCL9JgtT"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-74381df387fso1862212a34.0
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Aug 2025 06:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756302201; x=1756907001; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOO5DJiHFR3uaAgcdyHCL1QPgCU//KGOS5fO6obbhFo=;
        b=HCL9JgtTNHQfyCP2h1cHz7pMZqma08BRAAK2+mSUQVzTxiI30rAvL+8tHZTZoOJxsh
         fIXrTLohDpP3ymWNnK7jvPbfV9godm63Gqgakqqi1qmPV00xbO1G8ZMQZVRSS/pF6Y3D
         OPe/93TvkXwVSp4hSUocup6eE7cYMcLyclMYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756302201; x=1756907001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tOO5DJiHFR3uaAgcdyHCL1QPgCU//KGOS5fO6obbhFo=;
        b=EDuSGsMru0gTH8y9MZBY4DnBD87cAC/O7IILQXKek37lSx8C/2qYAw2fFn4HFVMY5f
         VoLPzVnUWOTE5aE+Li45YIbqOZkFJPEwBzHI8QvD9YAViQbxNPkgqaYzx8VIy87XeAn0
         DiJA7oELIVczyVRQRoQQjPnsb8PQEkwrbIlizLjqTxAimpTiqL7KIts2jRFfdbS9gx8B
         5dxsfBUAo2xz/sGakf+xHDFP3l+oIhyDH6pves/FPDzGkdVxfHOxLnqkVryLh8GMWLNQ
         pTO08VTuuXkwW5ab/9eiLtKcflSMrElnyhpA4p9ohSH+yn1gRZZT5LhC8dxmTwS2vVZ1
         X4+g==
X-Forwarded-Encrypted: i=1; AJvYcCVSbGKB35N2ZuA78yXH7c6/nKTF+NeILSpq4o2N7rUkcziD0zfFUm2GVytXc+gIh0DA4KM86XMXhKWJnp2TucI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+mXxHqRrPB2MG3Gh41Rvt9b8oQ2E9KHzIl1Fe3k4YtClT6buG
	tr+YZsQPK9fWrW6AftiuNsHwpWbYEKm0HhX/2PPFXlRgxuz/3cbK4M1FM5XQYen+FiSnqhAht8h
	KtqFvfALp9kgdba4vAzzTrd4lqixExPGG87dSEO4f
X-Gm-Gg: ASbGnctmTIle1tGKpFOte5VddCimT+uZc/zJhXD5JojfsMcj/KaQEmrHRyYotYszwal
	y1ZbGNkoOILCz5VhOgAjOMmweHszsKIkml5IEBIZrM6D2DHjHCk2v/uMTk1LL/6RzqKipHYj2is
	VYs+3oXWnIKv3J+n/vzpOQlbV+0CW3V+8tWFAgDZQXq52aL6UPBOIcrTrjymXnAvystMIIfvEej
	fWXwJv+Hll9y9wSHkoHbFM3fdG35atJxWY=
X-Google-Smtp-Source: AGHT+IFML09d6OTln5JwHTjKrkwtVYwzmCr1Bxp6r1uvPPk8T241FrUzKZ8dLpbh9eYjr9tFvagSaaECgl+Ih/FJIJg=
X-Received: by 2002:a05:6830:d18:b0:742:fd7f:e105 with SMTP id
 46e09a7af769-74500aafdb9mr10828847a34.19.1756302201636; Wed, 27 Aug 2025
 06:43:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aK8Au3CgZSTvfEJ6@stanley.mountain>
In-Reply-To: <aK8Au3CgZSTvfEJ6@stanley.mountain>
From: Pin-yen Lin <treapking@chromium.org>
Date: Wed, 27 Aug 2025 21:43:10 +0800
X-Gm-Features: Ac12FXwM35V_oehyXQvReVca6XRrKSLZotqLpHmniBQa5j8YidPWQocMII9oIgU
Message-ID: <CAEXTbpcpJsL0te+DA=5PEJjkawZ23Di3v20hdMqUj3SeB_Y82w@mail.gmail.com>
Subject: Re: [PATCH next] HID: i2c-hid: Fix test in i2c_hid_core_register_panel_follower()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
	Wentao Guan <guanwentao@uniontech.com>, 
	=?UTF-8?Q?Bart=C5=82omiej_Mary=C5=84czak?= <marynczakbartlomiej@gmail.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kenny Levinsen <kl@kl.wtf>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Wed, Aug 27, 2025 at 8:57=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Bitwise AND was intended instead of OR.  With the current code the
> condition is always true.
>
> Fixes: cbdd16b818ee ("HID: i2c-hid: Make elan touch controllers power on =
after panel is enabled")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/hid/i2c-hid/i2c-hid-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c=
-hid-core.c
> index 99ce6386176c..30ebde1273be 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -1189,7 +1189,7 @@ static int i2c_hid_core_register_panel_follower(str=
uct i2c_hid *ihid)
>         struct device *dev =3D &ihid->client->dev;
>         int ret;
>
> -       if (ihid->hid->initial_quirks | HID_QUIRK_POWER_ON_AFTER_BACKLIGH=
T)
> +       if (ihid->hid->initial_quirks & HID_QUIRK_POWER_ON_AFTER_BACKLIGH=
T)
>                 ihid->panel_follower.funcs =3D &i2c_hid_core_panel_follow=
er_enable_funcs;
>         else
>                 ihid->panel_follower.funcs =3D &i2c_hid_core_panel_follow=
er_prepare_funcs;
> --
> 2.47.2
>

Reviewed-by:  Pin-yen Lin <treapking@chromium.org>

Thanks for catching this!

Regards,
Pin-yen
