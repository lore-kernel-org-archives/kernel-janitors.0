Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF4937702A
	for <kernel-janitors@vger.kernel.org>; Mon,  4 May 2026 09:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777886430; cv=pass; b=fXctEhCCuXMzDvaDB/H7IBjIw2sBWSfigL9pcVZ9DZBwqLvB4xrep2VyrY4KhObZ2Hwh2yZmEQ7FexQzXux/YmEgZoDMahkxdcJaJCPust4+qH1dO1XOPJmD8u+fc7up5+e3fng7X+FrGPn5CvrPVUrN8dNJYmt66GNBhMGwdoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777886430; c=relaxed/simple;
	bh=D9tCbnW0i20N/tR3jHVoWVTWl/svTuRQ4UfTrpD0SzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KOTAt0e0c1jDoAc1pCtxWMNQRejqs2qBMgah0iH76/WpYUTEf/OlL0Lp5hJgolnuivf92NCPtlm/p1N+qaKKyOmv8hbtqxJRFnz7/PXhrUmHkANwVpL70/Dak2yKSrVoO05oFNz6ngCrEWSlVxA+wBgvZ/V8LeFN4Vs4kBavmwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KDAz8vKp; arc=pass smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KDAz8vKp"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8b4eb1fd5d0so36333966d6.0
        for <kernel-janitors@vger.kernel.org>; Mon, 04 May 2026 02:20:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777886427; cv=none;
        d=google.com; s=arc-20240605;
        b=Yht3kU9bEP4dgMM1XiFQ27AuFI3h99AGy2w0iIVGkMECvJhel/BPg30GDEuab18GI0
         kzMneMqj+xb5LStF+qf/AQsFOuXN4xl8axCjJ/XVPCoIK4EvGge6qbYmUKCT2qs2LUyw
         XnPFq4JZI6EavdOEhvZ44CwTaMhTMdbLZxqbqAf93Tbe/OVrjvQPaJMudZY52ZSR68zC
         LmeSpY6m388IusG3VkbsqVH8KY/w/OECcHDW/QWc6yFLY7RFVhzh4Il0z8Y5hIm1a3jq
         UFBRmxXZ53/tx1NXTYDhvVzgC2WIruv34b5ZkcO+t3aPOp26P6VIrGpZ3h2NZNzE3p12
         AH6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N8B6r/Hn9uO5i+eQkOdl6b0jxnEXI3YBQPKXVdON6oc=;
        fh=FTvXpjA6C3up+qKK4OM9jKvjHuIcgHsoVjBPQ0QrvPU=;
        b=LC6rfQoI6w205DvHSbzrav9jHx9iiTz0+OR1OflAazEHBOMEzDdey8BfdPSs5fvqZK
         FHQt6R1y6Sqceett0HchzLc5L0Vj0FtjhEdUdITerhiJZDJgO691XY0NL8BJFI18zQLZ
         TJCD50jXG+LXciPBRTKGjgbhhfhNCwoL1133yRenbX4clNRur/XICZJ136aAQzy4f/4b
         6wgcBo6BKcoJ+5kXZIj1DJ7u008Gbs8TFhpfOKaBHhJjIttMiGb7boCsgNNGex0K6zSd
         HSzbgBTLxsBw23ZJ50/e1ARd5TKsgn3h98L47HKazjRtIpIa/w/LvqcS29RD9Hf8rFRU
         5I3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777886427; x=1778491227; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8B6r/Hn9uO5i+eQkOdl6b0jxnEXI3YBQPKXVdON6oc=;
        b=KDAz8vKp+DXmwXKeU/0+YgZXmOXldyjR02VV6TIC3/3GZKWf7MZOrwx8ahqkEdp+6s
         QGFkdWp4meMNnpAWUAfs9qm4n5EEUyVYt4HeFN35IL5bIWQBJidqnbKAlqCKBeLui4vM
         KJDuZJBjmIN1ShsmiqAb5i7zU6gugs3j8/thyXPzERhyESK2gGX8hz0tCbOo4pV2g9DY
         3uaEVwmbZHMxGLQJ3rWuURT83/J/hfvEAl/Pm1zJeWB3y4D0axC6iHERcp5daYpkAgRZ
         KYS2Ati3yb40yqe34vAkHUxhQDmNqbc9luwU4fEt3VMAjk3gk4ZqfSHrC74OEUPzibow
         jfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777886427; x=1778491227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N8B6r/Hn9uO5i+eQkOdl6b0jxnEXI3YBQPKXVdON6oc=;
        b=HyLmRdCAVi0yyubKgrUfuS90OyM3R9YuhxaqfHGZXuWzO97vLj/zakaCpjXHRSVMav
         R8kKjTYUdQVI9Og9kh9N2cG50o2H/3oiJYfQ6KleqAAVhR++r9AFMRdDjMVf/KcxRFmZ
         Wy+nEE73XKMv2y39HaB1Bo2TKYrhSSjfrr63QGvyNoICezV+g7scUQVybFwO7WOCfDJ9
         x3z1MbkLPWv7+n6FjpdqaPmHDzqqY4jaNEVPFbKaZa6LT1lgbhx6y96M0ZEJsnLbjoTf
         /vi89vQYVibrG6LQxYjhBkRApRtNJyvDsATbg2HrlYFgcNrGegDEcRRKWDZELrC1gSoY
         uyqg==
X-Gm-Message-State: AOJu0Yzy6XgakIjovl68NNsUt04ZK/RzEqL/2lyeyh4GgfJ4LAogAAZH
	Ghz8EyWsqfFP66WPH4eRcIAS8MmwdFCBd0Xyyh7MvcMCZcE5XbbGp91TUDRQa+rps85cceTOdgm
	f52qSaN/CaGdjtvNahRZcYyRg76ju+FGAsLqvE2uOx96NvYMaf4Ldou6zP+xrkg==
X-Gm-Gg: AeBDiesg1LeM/zGY5XJfsVk9PWIayaNg75eT1t57zfzKaYsJ9k9rRGUAp8WN1FA/wkR
	QvUllKqhCHhSVKGxOPv6ruuO9m29UKxiD8BDiuYh0NUgR2ZqLkaCb7otBxnH2sdubUsAHI31hmy
	PLNerK2IhEwkrNAph4EjkUtfG7bwNi9h5AmkC9j27zOWxDmOJRgWGKS8HQZgAio2NFeIvcLLNg1
	SlZdUAqUe5VcvILjPuf6EQFCh9Ub4q2NOPKy81rZy2DG6MiUyj/vm9qt7YHXGsTNg/OWQ10/zOq
	hsV/uHbRWGZsbBy6KQ1od5KOETMazhyO+GlowrDQEtgD6VdrySLF+dYtmTkLH5TU/6EGdQ==
X-Received: by 2002:a05:6214:2261:b0:8b0:2910:a365 with SMTP id
 6a1803df08f44-8b667698bcemr158855396d6.29.1777886426499; Mon, 04 May 2026
 02:20:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <afOcIan1ap9kD26M@stanley.mountain> <CAG_fn=UfpLZt63zkZutfwY_VpQi65S=B4ZJcgzA=dbRK-XVDcg@mail.gmail.com>
In-Reply-To: <CAG_fn=UfpLZt63zkZutfwY_VpQi65S=B4ZJcgzA=dbRK-XVDcg@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Mon, 4 May 2026 11:19:49 +0200
X-Gm-Features: AVHnY4KAV2R8bNGaVKynNvRMEPkFxrBBHFo-qkC3KAQEpiwPA8H5UYqSUZ_mae8
Message-ID: <CAG_fn=XMAqMqD8Qd_U010_m3_q+C5C=ww=92AjJa1PFM4oK4GA@mail.gmail.com>
Subject: Re: [bug report] lib: introduce test_meminit module
To: Dan Carpenter <error27@gmail.com>
Cc: kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2026 at 9:36=E2=80=AFAM Alexander Potapenko <glider@google.c=
om> wrote:
>
> On Thu, Apr 30, 2026 at 8:15=E2=80=AFPM Dan Carpenter <error27@gmail.com>=
 wrote:
> >
> > Hello Alexander Potapenko,
> >
> > Commit 5015a300a522 ("lib: introduce test_meminit module") from Jul
> > 16, 2019 (linux-next), leads to the following Smatch static checker
> > warning:
> >
> >         lib/test_meminit.c:390 test_kmemcache()
> >         warn: bool mask is always false 'ctor & zero'
> >
> > lib/test_meminit.c
> >     378 static int __init test_kmemcache(int *total_failures)
> >     379 {
> >     380         int failures =3D 0, num_tests =3D 0;
> >     381         int i, flags, size;
> >     382         bool ctor, rcu, zero;
> >     383
> >     384         for (i =3D 0; i < 10; i++) {
> >     385                 size =3D 8 << i;
> >     386                 for (flags =3D 0; flags < 8; flags++) {
> >     387                         ctor =3D flags & 1;
> >     388                         rcu =3D flags & 2;
> >     389                         zero =3D flags & 4;
> > --> 390                         if (ctor & zero)
> >                                     ^^^^^^^^^^^
> > This is like (BIT(1) & BIT(4)) so it can't be true.  Was && intended?

Well, in fact I think the "(BIT(1) & BIT(4))" part is incorrect.
Both `ctor` and `zero` are _Bool, so their values are converted to 0/1
before `ctor & zero` is calculated.
So while the code is smelly (because it uses `&` on a bool type) and
needs fixing, the warning generated by Smatch is also misleading.
