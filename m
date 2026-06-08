Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E832B3B0AC8
	for <kernel-janitors@vger.kernel.org>; Mon,  8 Jun 2026 20:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780950611; cv=none; b=dvJrKgHZMdEO5XlAHiO0jgOq9L7u0gEpSSKVdYlWQyp3V/5T3M4dvFvQReoHaa+Xv7s7wFD8xTxTDqCKcTmJXQ0t5NeCNVcKKxJW48NsWkmKzWeucna7fwb629mqzshSMgNjv/GSqS+wH2YoCL4ickJuGURonGsSqgUVxSWpyx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780950611; c=relaxed/simple;
	bh=tBO6EHZ7m3EmVy0SfD+RfgsKaS54zMv6O+QHMuDtz4g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fdgizu/pVZAuqkW9Gh95vtI8rNU1rVqDOIe6qc14QZE//s8h3TX+Fcd2VBPfF20RGRkIaEi5Acy/sarJcQCqqu4UoW0204yurtWxb1t7TvBc9xeQOOhjlqqW1C+38gsfNEx9rR2Q5h5dXusbWlyCYR2t0cmJYl0hw+a7kaUYNv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KcahCdKl; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KcahCdKl"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490afc47455so24493315e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 08 Jun 2026 13:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780950608; x=1781555408; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tBO6EHZ7m3EmVy0SfD+RfgsKaS54zMv6O+QHMuDtz4g=;
        b=KcahCdKlB26orKlkAyhz/qS7aphZDrI8ejkrHrYcTCbhqiZOrUXn5SGc+2t6QtAP6K
         98mFQwAyEPki1e0Li3liy42sKS2cAKObJ0J9bh78igv0/c6gKHgYSzePbam+tlQUoDzy
         HPuzDIE/+/MtQBR9R2mv/H20TMeFLraji7VL6YyDdFilqRwXVk3jAN7Glv58JwGQIWWu
         TUoyKTYmfZKFjXKdkgPz8+AcGhTiRsSeAGksxTzWJS3Qrl9NrgPnb1zI4qJIKBo4VO6a
         KUaFfVEh90es6rdedwThAbjN6AEtUc4/xo8kqYiaSFU5wi3hbpT9Q4HPXgqpqT1TeH7+
         ZwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780950608; x=1781555408;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tBO6EHZ7m3EmVy0SfD+RfgsKaS54zMv6O+QHMuDtz4g=;
        b=l5rhEYk2kzDyk/PzsUa4bSsexGCWioa5vJH0otoi/Bb0OiJXb6gp5GvXDtad9RUQya
         hpaGFOAjhJQhaFYQCnST5o4OB4OdqCIApOy+jwiTaMtv3oxqFX2FSEpxuDKKOgvQZUxF
         kTVMoLw3YFSy3BoqF5oZJOe71LbNq4kAI4sNGSNrntbCb0x2JCFSQ+YbowbdKm0TRlhP
         W6zF1P93sPYOgEwDfhyFJa6FrsFsa2xl8xMf0Bvgn/gz3F/LKMbdLqd7GyoBN+Umnfk4
         yt/XLrVBziaYOaogp4ii9ml+w4AMFx8hLnqTxuPqCx5E8bR8nOgoWYv9+IJCK0tu2LW8
         Pzrw==
X-Forwarded-Encrypted: i=1; AFNElJ+4mglP8JU6n98gAog08M60qaIhiSQmGa+R5lqS0gOTx6JYEtD/TLZBBmo0X9hnZ6fyxSNnkaGPFxb5Vf1cjxI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+qGAIjjNB7Q/Z9ftg1AYdkEI4ujftHAqJ9mSz7YYxPM7oF/lB
	GW0QbkaN2RLWeUQ/0YUZ7UGsPCMBCgHomHxxWuHT3dP1iekgZG8DHsgy
X-Gm-Gg: Acq92OHb1RLtOrGADmU80NNMxig+VFfZV7QSOuc6X34CI14cx0H/cF2I7EbjpWeIELM
	7GHjb+Tj9X51Q4y6OKKOa8GQsngnu5BVv2WkxUZ6UAao+GxBw0/MRZ+rtBrPaP7FzSHtGuS0tXd
	3yhdIIxt3oYyiIZydLaZjjpbtRvucmoeQS15a3V0pdnfsvLMnUJDlMBGpgIVdyOG5DiR5t+MR+K
	5sEv8wAPj7NJHRyTPt89kIVryBeobYcvdhoPF86Ax/e8YxonK/HhMhztJgZpdvQtIOOcRApgn4g
	LyIpKgBUYbR3GWpmQ5LArhBOLrNsy+5inFLvmvPMmXjGSMfoDM0Ttso77Xleni9IWxbVlZ++Hf7
	s4jxZPfo7grpvdXfvsZ6woWkortKY+SbRazXIi04rsTPG5d4Y6vMj2UfgZ7EW5SM+GMVeTuQh2I
	xG6kIQCwBDbXHQ6NnAoOdZ73vgCkF1BH2qgNAcoLQ05o4rL6q3v+4gfX49MkrDE+hD4PgbVJTSt
	Gurx01VsXpn
X-Received: by 2002:a05:600c:3b1f:b0:490:b9c3:6c48 with SMTP id 5b1f17b1804b1-490c2621dabmr295540605e9.29.1780950608202;
        Mon, 08 Jun 2026 13:30:08 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:56e0:ceba:7da4:6673? ([2001:818:ea56:d000:56e0:ceba:7da4:6673])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc39eb04sm430313545e9.6.2026.06.08.13.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 13:30:07 -0700 (PDT)
Message-ID: <da949cdf51727f74d1f0f5b3e8248d5dc34e2219.camel@gmail.com>
Subject: Re: [PATCH] iio: backend: fix uninitialized data in debugfs
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>, Dan Carpenter
	 <error27@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Maxwell Doose
 <m32285159@gmail.com>,  Nuno Sa <nuno.sa@analog.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, David Lechner	 <dlechner@baylibre.com>, Andy
 Shevchenko <andy@kernel.org>, 	linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	kernel-janitors@vger.kernel.org
Date: Mon, 08 Jun 2026 21:31:14 +0100
In-Reply-To: <aiKIoqR0IQBZ-1ZD@ashevche-desk.local>
References: 
	<CAKqfh0En4pHqSfxfd2FHSDTxfWx6BfJLfeQ3xup4bwfLSTrZRA@mail.gmail.com>
	 <20260526191946.409160c8@jic23-huawei>
	 <aiEpmqKwFuIMRfdl@ashevche-desk.local> <aiEtIGOFhF8AfUCT@stanley.mountain>
	 <aiExQzpIOwPgwd3-@ashevche-desk.local>
	 <aiE3N6zErq2WcCvS@ashevche-desk.local> <aiFVuvVtaWbjfVzA@stanley.mountain>
	 <aiFWg6vC2cVbONTK@stanley.mountain> <aiGRzFrSU6QUL4R2@ashevche-desk.local>
	 <aiJo1kjN3_XDUdBc@stanley.mountain> <aiKIoqR0IQBZ-1ZD@ashevche-desk.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-06-05 at 11:28 +0300, Andy Shevchenko wrote:
> On Fri, Jun 05, 2026 at 09:12:38AM +0300, Dan Carpenter wrote:
> > On Thu, Jun 04, 2026 at 05:55:08PM +0300, Andy Shevchenko wrote:
> > > On Thu, Jun 04, 2026 at 01:42:11PM +0300, Dan Carpenter wrote:
> > > > On Thu, Jun 04, 2026 at 01:38:50PM +0300, Dan Carpenter wrote:
> > > > > =C2=A0=C2=A0 168=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ret =3D sscanf(buf, "%i %i", &back->cached_reg_addr, &val);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^
> > > > > Uninitialized variable.
> > > >=20
> > > > s/variable/data/.
> > >=20
> > > With what I asked in the previous reply and what you explained there
> > > (thanks, btw!) I still think your patches are not fully correct. They
> > > will require to atomically write all or nothing. If we want support
> > > partial writes we need to go with that differently (reset ppos when
> > > we got enough or more than enough data).
> >=20
> > Requiring writes to syfs and debugfs be atomic is pretty normal and
> > works well in practice.=C2=A0 These are very small writes.
>=20
> Perhaps. In any case your patch will break existing partial writes, right=
?
> I'm still considering that resetting ppos is the right thing to do. Just
> need to find where the best place is to do that.

I think anyone doing partial writes on a debugfs interface like this one is=
 very
unlikely but it is a fair point, yes. But can't we be more relaxed on debug=
fs? No
userspace app should be relying on debugfs in order to work (though I know =
that
actually happens).

Anyways, this is one of those interesting edge cases and easy enough to get=
 wrong. I
guess we should either:

1. Improve simple_write_to_buffer() docs;
2. Or come up with a new simple_write_once_to_buffer() helper?

- Nuno S=C3=A1
