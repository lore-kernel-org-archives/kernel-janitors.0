Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEAB27BF93
	for <kernel-janitors@vger.kernel.org>; Tue,  9 Dec 2025 14:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765289683; cv=none; b=GkFSUCVU5tehLce68X0ba4kwVAk6pvKodksS//DY9zxhQRtFGCtuaGPaQYUG7tlcU6J/dch4y6pKKn8Yf3vGeRKzusZiQ/Khu2NO/abErmf1Yebyv1msly09CaFoV5LstPpf6Yq54zro879/IX3youCh/DExc7/d+zyYNtEIufw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765289683; c=relaxed/simple;
	bh=p+MnXMxY2ieuINKDW+qcU42qclFHOt/7ycs9gddmvKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Drx+O0rbT8P2AzzgcyFgxHncz47825pQiSsIWpiYP4y6opw5/nNr7EGU3HwOR8I+uOTosGs4HR1/WRAtluFQciS53bA9FOfQffJxRF7qD4Zf+XS/4nWSl3KBngZhmpg/CYsyGtbKfpi5qTh6YCwMx6IcWcYQD57W9RFVErWN+mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJrzUsLW; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJrzUsLW"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b72bf7e703fso964897366b.2
        for <kernel-janitors@vger.kernel.org>; Tue, 09 Dec 2025 06:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765289680; x=1765894480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmfJkbH7xP/snHtbfubSpeIYpZRSL8H97Un9pUNUfhg=;
        b=nJrzUsLWcWVtPph2cTv2gAxxL3vJpcVU2HosFhlnRRmcojvudV5pdPvg696LPN7lGj
         y4kMnRC5xYXbHf9fqDBHE9wjyFULunpHMLxMnwjiBpeg10TUhPdqj2Dd1uX+zZM5f/nb
         U27R6Zh/3/BBK6MyldQoadI8DeFF7LGDVhu+fOGq8K2l17U6qYgVnKMVxulUOVw9Q3yY
         uQeXJRAWL9+PkzGDDqCtRyppGCUMRahQPJx1FJRLUkPqOiqDCzOd/bNz4V3StsYy9mDr
         aodVT1V/7NuQ8nyMwsl8xVH1g/58ylAyycgKKO9MIOPCcPQ9Om9Ne69uv/izsS1n7qxW
         ZkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765289680; x=1765894480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FmfJkbH7xP/snHtbfubSpeIYpZRSL8H97Un9pUNUfhg=;
        b=oStiqPQKVBfIGviBbteozZiJQjD7vttoryWLQ2MjvtXLo0n6Wc9wPfBWA6s2q5pDxr
         3kT9AllWSJSwYP5kBhJjgsxVO86WvEA+HGZxdU52qETaaZHITRYrNbl0JNRx4sVcR8bv
         hvspah/jlJPMLkV78BThGofe0x71A/o/y6L99B5F6+ioAErBGaEuIqeYJbPcmd0ks6Qj
         BgQmMb9pjrfb1Mrf1Axk0D4KJ2LJfvkl+FSEuceSRefxR29CbcAiKCx64oDw88NB2hcg
         o+5BE58egyrQXfIkyaRVmP7c8m7z/9xKhodAx6ImIeXRxQXm1ovvbWpHCsNIfrnPvDbQ
         v53g==
X-Forwarded-Encrypted: i=1; AJvYcCUzUbqTilGXQQCS0qvRO+JOpCxUeXu19U4gMwi3bCM/Ar9OyEyw1Ez/HUImoG5Q2E0YxrWEIXNkCDyDZBynz5w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1i2rBJh5YXxo0N/mnOzg5kYN3O/1NCCM3R+7Iq+k+ECwsqJhc
	OHdaFiBUZLtbu6XOZIWcN8WfiybyXq2Xh8odgkWDgO2q8G2syBd7s+WuJ9s3Suwl7N4U/eRoIIy
	ckM8mL0wuUo02SZBPRevQAzkvARXhHx0=
X-Gm-Gg: ASbGncsMy7J4bd9+HWkXpklpbTPGgcN7/DJuyDG65O/sa7VodCfRHCPCUJ2lRV3vD1r
	0bJGdUIuxEPJLUfxJf494Z10EtOrC5VtFvMXq5ncPYOFC13mDvuGUD/SnfRcfAc+1ooS+j5sijm
	pRbqtb6Q9e+stLbXq9OY9nkEce1JKsXb2JJsZNZmhKdaf63qqX4mPB9C8LSs2iRa16tbr/gY7vx
	THWG4MvaRJs9Ak85SY9CtdUw3/kqG9MosDQPQgbZiT/DSOjG0onTk3PPyNoBIkZ8v+RmegwjzL0
	ekdCiw4TL5r28iGdijFtfPkJEYzYtkwf7a9NHn7T6JRAJ/92LAc0/9wPe4X8WEfWs+Tb4mY=
X-Google-Smtp-Source: AGHT+IF5UkCJdJKXlr6Gth/qwcAe2dPAWhiuJkFRY5Ifo8BeEAGB6I3vdou2q1Tu4uhuVuZOOpDIp5dIYPVIef5NDe0=
X-Received: by 2002:a17:907:9707:b0:b53:e871:f0ea with SMTP id
 a640c23a62f3a-b7a247f6120mr1199899066b.56.1765289679946; Tue, 09 Dec 2025
 06:14:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aTfIHE_2-iKIrwqv@stanley.mountain>
In-Reply-To: <aTfIHE_2-iKIrwqv@stanley.mountain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 9 Dec 2025 16:14:03 +0200
X-Gm-Features: AQt7F2rhjNP1srDjpyNtylnlt2n4nXE0BQJ1nV4SdGEvG-2omw-a6EWOmFv0S24
Message-ID: <CAHp75VdHEVsj9o1UPSS1ikJYofDuiA7KwUaj8v79cJ3Xs=N5xw@mail.gmail.com>
Subject: Re: [PATCH] leds: rgb: leds-ktd202x: Fix error code in ktd202x_setup_led_rgb()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Kate Hsuan <hpa@redhat.com>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 9, 2025 at 8:56=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> Return -EINVAL if the "reg" value is invalid.  This is unlikely to
> happen in real life because it comes from the firmware, whether from
> device tree or ACPI.

...

>                 if (ret !=3D 0 || reg >=3D chip->num_leds) {
>                         dev_err(chip->dev, "invalid 'reg' of %pfw\n", chi=
ld);
>                         fwnode_handle_put(child);
> -                       return ret;
> +                       return ret ?: -EINVAL;
>                 }

I think the better fix is to split the original conditional to two.

And make the message something like
"can't retrieve 'reg' property of %pfw\n'
for the case if (ret).

--=20
With Best Regards,
Andy Shevchenko
