Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16BA34BA42
	for <kernel-janitors@vger.kernel.org>; Mon,  8 Jun 2026 21:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780955503; cv=none; b=NpB0H8jL0ox7on7BsM1Wd/MoQEuXrBCIvf3mJjsyrxrLd/v+FizaHT3HQgOg/lkShWaUClgEoe9yWYCLO+hnZ8wZEuCIrIyZUfi9JlBDbWRgRa+JCJeRSIVBliHIlLk7fqAbwL9n1mh/56YsZBp5GY8O/N+/XCcUhNIGdEq5XGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780955503; c=relaxed/simple;
	bh=xPoeKvwRcR6Eki/nGosErpDBtUaK/l+m2ggZ/c5Hd0k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gup+bH3+gFBu6VaLwSB3rNMtfjrLjlYxXAarBehgZFVdo1YziTadMCVDPgHQVhBVlqh6yFL1f9aUzoap9aHWNevlHAkEoTmS5GswzwoJYNZwDktnL+znM2kyVIcgX1nJbTFNPijMlYdlNa+y+sO6GsB1mghrjrEZc8qoKrFp7EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ByBhrDnz; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ByBhrDnz"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7e615efd7d7so4290185a34.2
        for <kernel-janitors@vger.kernel.org>; Mon, 08 Jun 2026 14:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780955501; x=1781560301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPoeKvwRcR6Eki/nGosErpDBtUaK/l+m2ggZ/c5Hd0k=;
        b=ByBhrDnziytFU9kj75nniIPUFI22bHGiz9mlRKzIhSLcO2YR5nhVBbxnb3pFzPCdKo
         0EQeD3ctBpE4ZoP4dx+XiH9Y/F7r2iF9HeOsbVfc8jAvou8VAQoSF0IrFB+Gyh0ZMKJk
         8yPXVcYDTmxqZeVVZYAx5KJ3/cOQVwaWGhuaL9uOuU+40GGrxlE23o81i3se6rYEX54w
         SvIX3yCpSl3Cr0EPAbp96sYphqnb7latbkCMHZwuCNsUY/nehqmM14stAfavsQ41JSoB
         ILNWfpyYzL2NtKr8cd/rWbueGnirvff1TMPV7xvPttbcOS2DzX29GM3XqvSGuyINP36+
         C54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780955501; x=1781560301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xPoeKvwRcR6Eki/nGosErpDBtUaK/l+m2ggZ/c5Hd0k=;
        b=DYOx27idg+JWoFuT8nyDvzLycCu27mtbqzl3zD7m9sc3dpRlaUwzPSvi+EkSQwMJmu
         iHvtzZlAxtBBVacZCCSZKzycJm5mG0i1xKRTKJ65jXOTTunWlurdG+5S9W73QYTfwjqw
         Q857uRVeZBbFVHhnu3cgxfDRoK/8hc0ucIM4lntE0QSVBSpE1aCikyL6P3vuhgH2u5/B
         qyBNWi6yg9eFEtwU4mqYdXCADXTUPIav3vJhS1h/Ptd9VOfadqSJL10az91kx35xriIU
         bE6ndIQhxU5eW0bczDsxHs5RkLfYeMZrt9muTZ0CkbR3Z8sUAYvJb/BveRq5DH4PIigT
         Skxw==
X-Forwarded-Encrypted: i=1; AFNElJ+kVemYlZf2kZPhMw0lRVD3brRPHxDuHIg8sPtwCeiLvFxL2kQ402thH+ANsXz1iI/YDYN9UR1Dt49wTYADKO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyckZNqdektpXn1Ff7838bAZDUrRAVEmY9WEGX3a6B2ROBNltic
	lT750cjfJzseH4upLdLrRzwXIxTNNaA5IF3KY5zzhlE2s9XvjHcwiB6g
X-Gm-Gg: Acq92OF0jbXh3SENWmKYBmzAhrfsbyMSZc3TJQc3eT0wq/XaSizhaDKYA7KF/Iv3ZLX
	B7+LwPjAaoll6le/cSJEUO5XufqaQSNZg2DkfPj+OKbUrgFhbhqCPwH7D0KdqGqS8QXXCN0eO9d
	VXJYZ0Z6d9S+Zz4DG5W0hPrWPRzZO6zB6rQ9xvzcs69wn5xiFRxoGguak+NooHzYVxe9gi6nvfj
	wRzrp3/xeOG81Wsx6vRLUnwcLxgnKQ/oaAGONnJ79iJINDVqzmzuniHwvYes4FlFxQv6LHtSGyN
	GJIXv+YWNqgHFuwtL8l6H6+cP70Hj65Tj8jQQyoF291pWYsUBvso9urKP/i4MW48N+ZTtiLRtfz
	Ni331XMFH8Qj5LrHZZbaThOqD+Mtuv2zTTe4tSt9gXyZ1OW0FiI0ZKFsA0+nXYI9vvkdGs+m2Sp
	s94T5ZriTJOOnz5/ooDdXUzHR4YRVVHSJdnJ4X56WdK3C+owKvdMhGdakAG37jqlo=
X-Received: by 2002:a05:6830:640b:b0:7dc:d0e3:5bc1 with SMTP id 46e09a7af769-7e70c772c1bmr10801726a34.13.1780955500991;
        Mon, 08 Jun 2026 14:51:40 -0700 (PDT)
Received: from linuxescape (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6e7965006sm13343504a34.23.2026.06.08.14.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 14:51:40 -0700 (PDT)
Date: Mon, 8 Jun 2026 16:51:38 -0500
From: Maxwell Doose <m32285159@gmail.com>
To: Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Dan Carpenter 
 <error27@gmail.com>, Jonathan Cameron <jic23@kernel.org>, Nuno Sa
 <nuno.sa@analog.com>, Olivier Moysan <olivier.moysan@foss.st.com>, David
 Lechner	 <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iio: backend: fix uninitialized data in debugfs
Message-ID: <20260608165138.16b88dbc@linuxescape>
In-Reply-To: <da949cdf51727f74d1f0f5b3e8248d5dc34e2219.camel@gmail.com>
References: <CAKqfh0En4pHqSfxfd2FHSDTxfWx6BfJLfeQ3xup4bwfLSTrZRA@mail.gmail.com>
	<20260526191946.409160c8@jic23-huawei>
	<aiEpmqKwFuIMRfdl@ashevche-desk.local>
	<aiEtIGOFhF8AfUCT@stanley.mountain>
	<aiExQzpIOwPgwd3-@ashevche-desk.local>
	<aiE3N6zErq2WcCvS@ashevche-desk.local>
	<aiFVuvVtaWbjfVzA@stanley.mountain>
	<aiFWg6vC2cVbONTK@stanley.mountain>
	<aiGRzFrSU6QUL4R2@ashevche-desk.local>
	<aiJo1kjN3_XDUdBc@stanley.mountain>
	<aiKIoqR0IQBZ-1ZD@ashevche-desk.local>
	<da949cdf51727f74d1f0f5b3e8248d5dc34e2219.camel@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 08 Jun 2026 21:31:14 +0100
Nuno S=C3=A1 <noname.nuno@gmail.com> wrote:

> On Fri, 2026-06-05 at 11:28 +0300, Andy Shevchenko wrote:
> > On Fri, Jun 05, 2026 at 09:12:38AM +0300, Dan Carpenter wrote: =20
> > > On Thu, Jun 04, 2026 at 05:55:08PM +0300, Andy Shevchenko wrote: =20
> > > > On Thu, Jun 04, 2026 at 01:42:11PM +0300, Dan Carpenter wrote: =20
> > > > > On Thu, Jun 04, 2026 at 01:38:50PM +0300, Dan Carpenter wrote: =20
> > > > > > =C2=A0=C2=A0 168=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ret =3D sscanf(buf, "%i %i", &back->cached_reg_addr, &val);
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^
> > > > > > Uninitialized variable. =20
> > > > >=20
> > > > > s/variable/data/. =20
> > > >=20
> > > > With what I asked in the previous reply and what you explained there
> > > > (thanks, btw!) I still think your patches are not fully correct. Th=
ey
> > > > will require to atomically write all or nothing. If we want support
> > > > partial writes we need to go with that differently (reset ppos when
> > > > we got enough or more than enough data). =20
> > >=20
> > > Requiring writes to syfs and debugfs be atomic is pretty normal and
> > > works well in practice.=C2=A0 These are very small writes. =20
> >=20
> > Perhaps. In any case your patch will break existing partial writes, rig=
ht?
> > I'm still considering that resetting ppos is the right thing to do. Just
> > need to find where the best place is to do that. =20
>=20
> I think anyone doing partial writes on a debugfs interface like this one =
is very
> unlikely but it is a fair point, yes. But can't we be more relaxed on deb=
ugfs? No
> userspace app should be relying on debugfs in order to work (though I kno=
w that
> actually happens).
>=20
> Anyways, this is one of those interesting edge cases and easy enough to g=
et wrong. I
> guess we should either:
>=20
> 1. Improve simple_write_to_buffer() docs;
> 2. Or come up with a new simple_write_once_to_buffer() helper?
>

When you say "simple_write_once_to_buffer()" do you mean a wrapper
around simple_write_to_buffer() that also checks if *ppos is 0 and
returns -EINVAL if *ppos isn't 0? If so I can start writing that
function. Though I guess we probably want to ask Jonathan about it
first since obviously he'll have his own opinions.

--=20
best regards,
max
