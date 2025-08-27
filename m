Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6DB279915
	for <kernel-janitors@vger.kernel.org>; Wed, 27 Aug 2025 15:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756308400; cv=none; b=TIrdYWhnnesYXYS7DkrHkZ3XtzSgZ+yVfgeeiYLKf/nhRSQV+0WrAkWR4fCRAVQkBz5yPFZvxxTz50IgoVceAX9XJ/6qPb7Vtjvr1m/WAf6BHao5uIapGKQ5L+9kUDqGnGR63r9V8fLrZy0Ua8AAJrXHMo6SsxT7ZAX2xvCN3rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756308400; c=relaxed/simple;
	bh=VKuuQQCW9goFCxDxyheaqk7T10+zbATvmX6hEvwyK0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aY036/CbYMISbad4sap8tNansgwib7yIP8Wj168JPusxOH8XI9RuR/llRCyu/NYiytCNBoUIOEetptP5AHulXq7Pr5/faFNtz8EpFDPTZDUXTF9JMBgbhEFRZMKyf2zde5Og/gbbLtUWaBhgBnlBfxEEb4FknssXoc20UGygFMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FABCc6u8; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FABCc6u8"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7718408baf7so3850307b3a.3
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Aug 2025 08:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756308396; x=1756913196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DLrh1j2iqdsWB2lnt1a0koxPADVPet1wRoykvV46kQs=;
        b=FABCc6u8vLT+l5P5SUBtihxdKvzvQ/9vc9kHdoWDfVrlRtYOeIOTTbuOvW2VUnftVo
         L7KLYE7DfFHuBKw2cxyVHtffGWr3Ls34jjWKRuiGbsM+oPkdwR2NlYg+w6SZ7lEclbpB
         rvovb3W1qD1i3DRXlSzX5QOLFtkV4AYt4sAbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756308396; x=1756913196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DLrh1j2iqdsWB2lnt1a0koxPADVPet1wRoykvV46kQs=;
        b=CT6/IkdWvuUQT3yc+sCqp/v8Uc4MgJKY2N4z61lp48KEJd//43tN3UDJTuKNuwqAxp
         e23Bdk24f4VTGRy+jsrhcJevbmlT32jmx8WIwxJK4P3vsQVE01qO1u5k0oD0sGAM7KhX
         nUASh7Fvop6kAU1Yp/yYe64Wks2NIucmrDzZS65Cr/KkHqhWOi1ONVxCcG+xUSuRX/Lv
         5UyLgKTV2DPtJ35Vv4+v4bYvC3NyLACHOMXV0Um4gVnnW7OBe413B+5dLj/9uJk7n9YZ
         T4Pd++I9Mf86Ov+SteeuIOZIkb04jGSP6bXwJ26gb6mGTvKXpFpagz3+BLMUe14ON5CY
         AjUg==
X-Forwarded-Encrypted: i=1; AJvYcCVjZ9opBOgFGVKKO2j6DxjkrGsaB7pW6h36/lVTtgJ5z7lEJG+7bXrJR0w56d6R/mi9GfLP/7oeTQpX8g31cTU=@vger.kernel.org
X-Gm-Message-State: AOJu0YySyNTVqSED7Ai2d4HNDY57R2BDs3FUnvdcUIamoGbwb13Pt3z6
	d70rAXiNtE4xSWBMOqCuq2+T4202YAzcWImfaWQ9TismFK8BYtZ5L/CMSABK/co/S0EFr/+imhD
	7dwA=
X-Gm-Gg: ASbGncsaRUD53lepHAvX2LTnbVUSFSr77eHvRFatUeWh+J3+T6bzVBW15bl/5hxVmut
	+Pr/QO9SP1ZxxA2F6+IrfIJKnCFXZSP2mEPouoa8AEbQgANl8o2W5cM7f4Ln9Sh8pcFSYEop/tF
	z1PfKrrk6Vae3tmZiBRGRBCPcNlZxHbSavjRaijrVxuQS+trvSFnSvHHgNdKzzPFBDoTyc/DQNv
	/EkdbvNlPH3GDfBME2YCg/ncIH1q0BGEOE8ae2QXoCBwiSBVV9nWGp/CdCNYG1sLAQmr8u4PJO0
	LwaodBrzLFVVizB5baCuFizqr8oV3z0MlDrQqsWug0yxKeRdivjyaZkvV//reQpGm7O9XpJ4guu
	pdrwlaUNdUamhpIwtUdPwAFrMLBqHbhMz6Wi9HxPbeIOk4Rmy9G8Vka1hxyJrqOxXcw==
X-Google-Smtp-Source: AGHT+IGR05bCJwDhYBC6UOfWz9I6sb15GcVHO3Kze3pBChMwLfnXVpeuHqfckJIb6vcC/9E3vK99+Q==
X-Received: by 2002:a05:6a00:9296:b0:771:f309:c04f with SMTP id d2e1a72fcca58-771f309c572mr9185631b3a.10.1756308396213;
        Wed, 27 Aug 2025 08:26:36 -0700 (PDT)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com. [209.85.214.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-771e6fdc374sm8033732b3a.91.2025.08.27.08.26.34
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 08:26:34 -0700 (PDT)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2487a60d649so20395805ad.2
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Aug 2025 08:26:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3zSSRPEjfiDGNROhAuZ7Eyq99CpEnWBZaCmXyndDp3Dntn3DSAnnZMd9LcQWkhGShICssWPJmUOpbN52G3Zg=@vger.kernel.org
X-Received: by 2002:a17:903:22c3:b0:246:61c:a67b with SMTP id
 d9443c01a7336-2462efc84a4mr257613985ad.58.1756308393826; Wed, 27 Aug 2025
 08:26:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aK8Au3CgZSTvfEJ6@stanley.mountain>
In-Reply-To: <aK8Au3CgZSTvfEJ6@stanley.mountain>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 27 Aug 2025 08:26:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WEQf=PX52Uv_bjzhnUipKwcNY+BBTOfDHucv=EkBTzgg@mail.gmail.com>
X-Gm-Features: Ac12FXyOqAsTB-Ef0CSpdX5fkDPZp5ZPV2zuiCMnpU52NE9UK-HvdLXDXVbdv14
Message-ID: <CAD=FV=WEQf=PX52Uv_bjzhnUipKwcNY+BBTOfDHucv=EkBTzgg@mail.gmail.com>
Subject: Re: [PATCH next] HID: i2c-hid: Fix test in i2c_hid_core_register_panel_follower()
To: Dan Carpenter <dan.carpenter@linaro.org>, Jiri Kosina <jikos@kernel.org>
Cc: Pin-yen Lin <treapking@chromium.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, Wentao Guan <guanwentao@uniontech.com>, 
	=?UTF-8?Q?Bart=C5=82omiej_Mary=C5=84czak?= <marynczakbartlomiej@gmail.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kenny Levinsen <kl@kl.wtf>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 27, 2025 at 5:57=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
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

Reviewed-by: Douglas Anderson <dianders@chromium.org

Jiri / Benjamin: if one of you can give this a quick Ack then I'll
throw it into drm-misc-next with the patch it's fixing.

-Doug
