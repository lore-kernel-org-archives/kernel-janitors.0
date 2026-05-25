Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29876384CE2
	for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2026 13:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779715417; cv=pass; b=CvImjNtPtgFZEP4LgtXPixzMo6ePTZCFNqn3/exoB1CsceLTXAFuNX+b9JAK/ulAlEaHEEGS+ihPB9fMw9z8La9Ccg5CGB5zW0GmjvPYeXeuAvwQAGAthZa6IzsgzOub0pHrgIeOSU8yTJGczHobVtDrrV7yL5vf0mtr+IzOw4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779715417; c=relaxed/simple;
	bh=+BdezTZZ2xJDU1plnc5GlgQRS1RzxYkyrenMWctrdX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MeVquFxxw2xIt+DoHaWFQEhCEa59lYZ4NodYoXke5mMd40010jqczfys+V2NBlqPYyJRDl/Wc8+DeQx5o2TK6Wu+x9LEP1Kf58kNlTzE5xgzWk11hrLUhao8LnSaoHe8++SgOWLMYsCfxBMJ+yFOOQNmL7r1OhLE9lXmEmiYrCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o3qKi6tb; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o3qKi6tb"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7cb343d343fso88080387b3.2
        for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2026 06:23:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779715415; cv=none;
        d=google.com; s=arc-20240605;
        b=Ugek11efEVbgfbkU6rpqUnurwG+9/PnjMe5ky+EmMp+W//FQouw+XzQhMBXFSUePCO
         KbE+l1g/Mb9JFBeZLo81AtkwAtOYrvTqN2BPDkaXLLV4hIS0+8htmyGjX5HEfOMyST8C
         U99lHj5LlPg6tUiCUgOUyFeboPNFkpaNx2n5plHezoUbsiAnd0Z9Oe53BC3LCKbj9jpz
         Ntbx0srWOgu0wLIwESoLla2b2RkeEXyvrqj76qjJOgXX8CyKvS/aUxqMAfLWcldjLyW0
         cvyADMI45Zf1ogyOnSVj20ADL2qTdF3x5SpJ/WEfQl12xqsqS7JGMYXRwH5dn18rL7Gj
         wMOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bZlVCaPkKYN85O4NgITQHjQkGhUnieAIagC6kg3O9Os=;
        fh=IkGrtr3YqKfTqEdGmG65/hAqQFFBp4dQ3u6zIxl6y3c=;
        b=Ztyb7LzdabjrjRCfQ8rPTRi8Dg90iPF86PbrbeSOUJePA6HBamghIqlDAU9rQluRqQ
         eTVsvhwNBHsbmqZEgQ/L1jXke9cj7kIgMXEC4qAm9QhPagUkC98vWlWa5AASvoXhPcDR
         wbqjG1JETwaKkI3gLKQUmQeiswFLs9wBEydE47SRHVReQC3BKkKjsRKf2fB/LFGvD/kE
         x8sE2Yt511PoD6nzkfz62eotTn2WTNcI4Xg2a0C6+AC6ClsTfqxAG8gegrVnQOWwqOJc
         zSyRE9xWawD1qZHVLmxLeeMm+qpZ80FDRD21jP1lminBTzvIVIqcpIHOwB5C8VoeKQbO
         5ggA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779715415; x=1780320215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZlVCaPkKYN85O4NgITQHjQkGhUnieAIagC6kg3O9Os=;
        b=o3qKi6tbhy6mP8W3bDryxKx2J9ZHqmDDE0y3V/Tw7rjeAQx4NDIu2J52ehStSi9qTl
         xU2mUWDGmJhIL0nl74RmEcgE6+jobVvFiQla1ik4HNZNIYyYgVN0jEi+vcvu1LMmHdUA
         qXE6M+K7zGHz5IgE7FJquLzGuKl1/+Sjs1jNLEilzkC5bzVORNRIKvA77BLrg+Cy8eEv
         4y1d7qWI/SLtBg8ScIpQG5IBHN4if3Z9WiNjBqtMGku9J11199E59k/zXpb9HqF9Oy8F
         vYbVU5D6i2ahSMjf0Gj6Bymlgkaw1nMgEYalrcRe8w9JiSoSFAefgjgcrKdDbrp1WMcE
         AWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779715415; x=1780320215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bZlVCaPkKYN85O4NgITQHjQkGhUnieAIagC6kg3O9Os=;
        b=EvBajP949LUrvoQN5dRo6D5sYZJ5Los2MC1qch2nSL4gqXafWZ+vWaQiZ9s5HjKJko
         BpnfdYUuGhaoB2P96JVWND8u/C6jL4/NBoSuxn0y8jhvsCkUgh4n5a8TqljtncY7AFmD
         m+1hibIK/yqNV9ODt2pA0dZj4TK9FXYCXGpPBoiZdUInY+ubTUnqaSgHMGiuncMSGyGl
         58Xjpr+aafVpvG948qDBDo19AngnFHVjeoDvLEnekjXXv1t2cI+w5BTWqnro/NzCsD4E
         HGPWVA0sTHpPvPkcBTGz5H6onKL/9Wj7RmIg+o4Z+VX2WJ/WTXATP0H5W0i7aUXpS1RX
         qoCg==
X-Forwarded-Encrypted: i=1; AFNElJ/gZ+zmTAKqoYQOBFiBqsgpYiSycpN4dCneUeon/mLYdPumb5TuNP2pTSZZpEfgmZfDRKj07jdpjDl0F7CvbEE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd6nScfIdPYcWNQ/W8UQn7QY0CGEIBzYAcUvMSlNHDwssXMI2N
	VTsvJEcu3ZE60dCOHd6k+tpaBy3Uz/5XJk2yDGV42Mz8N2GIOjbnSug5pK6ZeVo8v6KPoIPlHCz
	ERlBMHZR6G4hK63cWUVFc++emRMtxRDo=
X-Gm-Gg: Acq92OGgtfQlAT36pzn0X+e5rVwAemuMSEx7ilJKXWKdt2UgoomXn4kwjkOkrLBi8cc
	HGZsBvBaAtOugqU9y5vNvdEhLpXslYsHpK3TLrUMgNZyqdrTtjD2gv41BIAR1BlL2vrfLemS3hV
	kD5qhj651MxSCYa30DGjhAB/kHTuExvFa4omzmbW/ty9lOuxjfKwR4oTwjBhoHHe5b30XrNDyHO
	lHxSp0s/OoX0p4c2J1x/sMwe2iT+rxPjmAbB1plNcP0/1YwtGhLdub2Iof5rnY1uZIvZSyabIkw
	hOfj9Ns=
X-Received: by 2002:a05:690c:88:b0:7bd:5c77:1aa9 with SMTP id
 00721157ae682-7d330de95ebmr168149997b3.0.1779715415111; Mon, 25 May 2026
 06:23:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ahP3IjYJ87bNc1De@stanley.mountain>
In-Reply-To: <ahP3IjYJ87bNc1De@stanley.mountain>
From: Maxwell Doose <m32285159@gmail.com>
Date: Mon, 25 May 2026 08:21:51 -0500
X-Gm-Features: AVHnY4Ix5-r5MLMK4Wc8I9sdlBI7sguJNq-iT4KeCM14tJZaMcIUgMB0PpPnph4
Message-ID: <CAKqfh0ErCJV9yV0kbgmvpRYzD5sFEaUxTrXxDKVVeEA8m3WhRQ@mail.gmail.com>
Subject: Re: [PATCH] iio: dac: ad3552r-hs: fix uninitialized data ni ad3552r_hs_write_data_source()
To: Dan Carpenter <error27@gmail.com>
Cc: Angelo Dureghello <adureghello@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, linux@analog.com, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Mon, May 25, 2026 at 2:16=E2=80=AFAM Dan Carpenter <error27@gmail.com> w=
rote:
>
> If the *ppos value is non-zero then the simple_write_to_buffer() function
> won't initialized the start of the buf[] buffer.  Non-zero values for
> *ppos won't work here generally, so just test for them and return -EINVAL
> at the start of the function.
>

Please see my other email, you're also returning -ENOSPC instead of
-EINVAL here...

>
> Fixes: b1c5d68ea66e ("iio: dac: ad3552r-hs: add support for internal ramp=
")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/iio/dac/ad3552r-hs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/iio/dac/ad3552r-hs.c b/drivers/iio/dac/ad3552r-hs.c
> index a9578afa7015..6bc64f53bce9 100644
> --- a/drivers/iio/dac/ad3552r-hs.c
> +++ b/drivers/iio/dac/ad3552r-hs.c
> @@ -549,7 +549,7 @@ static ssize_t ad3552r_hs_write_data_source(struct fi=
le *f,
>
>         guard(mutex)(&st->lock);
>
> -       if (count >=3D sizeof(buf))
> +       if (*ppos !=3D 0 || count >=3D sizeof(buf))
>                 return -ENOSPC;
>

See above comment.

best regards,
max



>         ret =3D simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, userbu=
f,
> --
> 2.53.0
>
>
