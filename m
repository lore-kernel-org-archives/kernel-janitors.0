Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1360248F73
	for <kernel-janitors@vger.kernel.org>; Wed, 21 May 2025 10:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747821773; cv=none; b=Ejf7aRxHqJMdP8HMF6pDM+PD56nlhw3TuS1F6YYX3nbJ9L2tRxR+FbEXidryLB3Z1jNIyidoy13IWDS6dqLqEqf5beIXNOLj0tL01TH8PhooQtDtRd9BZ2F1o7tRvGAUZBmo7QxAfASAsS6pp2Uu1VrGe3INcKsoBaquNEOl/uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747821773; c=relaxed/simple;
	bh=hGVCzMZOE97pm/+7xdNe3qSpEf0+u5dNQxNicc26ENo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ExheNRV27aLn+4uC5LPG60YB7z2wGKwNOkKjHrwcjrEISRUYksZfZN8zRE5j4RMykZTUPdjeiXdWlNdpvj+pDra2F81q8lqYEJzhwP5LgOg/J1BUlPK1BUcVtwy/ZODNus0UJeWxCM+QioDZVH9LuZoDQcDYFEyHgkdjRf9jNf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GY4SR1Zy; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GY4SR1Zy"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so65486016d6.1
        for <kernel-janitors@vger.kernel.org>; Wed, 21 May 2025 03:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747821771; x=1748426571; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGVCzMZOE97pm/+7xdNe3qSpEf0+u5dNQxNicc26ENo=;
        b=GY4SR1Zym8jWawgdz/Zh3Zty9cOr63LjffdNBMwajWn2u30g0cvg0lZOPdRDI63Xf0
         A5tDEFYcgZG/aGhkyAY9w/UKoeocOuoxZuupms18NbCCNpDv+Ad1Myy9fMTJ5kXzt1FV
         5oXfWRrbVB8xU1OG09IbgNDu0oQyqZou56GUJLhjOpjhrCo2viFGDRxj3WNNt+hntbM3
         GdR/Va/qE/f0/IBUKS2s8U+/fxINs1vbun3OkaqwpUgP5NA0GHBh1RVo3lSVjW52Ru2P
         M30OmLOq2dRiEvNYK8HPcFckoOoSJYuULKtGgQ9SKbTyzUbCMLllGoY8WO7q13pSqLpm
         dPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747821771; x=1748426571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hGVCzMZOE97pm/+7xdNe3qSpEf0+u5dNQxNicc26ENo=;
        b=bWIqepF3ii57wTcq7sbM4UK88wXtDRdaGk4C7z8AvkQpvQV9X2qDVxwxxDYNYEYOau
         UhJykRKptBZj+wBYzVb29ZIXfAD3YpRQZ6lbs+b6IQdGZi3yByk3nzMo5aUjr3NqJ52T
         gOvzk/4Czm6RDEUMejdfZq5yx097ZGZkmV/DkeVenAm5/RCDTv/XiFV66FSXh0HlJtdr
         ctTT0fkNjqT7FSO+wUyOUZ1YTDoWYQL30/8Or1iJccM58kOjbYeGy6seTlqfvM3DAmip
         WytHjTtuAUUVx2JhtQdOKLJuiy4pdl1+T9S2TTZU++FdwjqveOCCPc2QzMYqXmXcUT+h
         Drxw==
X-Forwarded-Encrypted: i=1; AJvYcCVb7HKcpu1shMN1alRL5kUxLeHvR7m31YRTbN8KjXxA/GFY59K6e0p1Nq1CMC8Wrred0L1Um2ydocY0/RKe7o8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1zD5cFh9P8+MH2kMI02ne4mcNYk+2AYhvVi8lELdFKOKHpvMp
	WHNQVaUTGE4UWV21fnirEOgTc4k7OOWJ47xq9XzjxogyqpIySLL8IZGU/QCNjE0aLSeVEShOSAp
	4xIshemO7FgejpjiqM646pEQL3qOXZRO1zWYbE64z
X-Gm-Gg: ASbGnctarlbF8vsYBUjUIqmE9xPJU71lRoRVwGFbYFjlT0/4ZgN+tJRK6oUPjj/3uwK
	ZQHmUhtpGp1NugvHGIvAbdtKM6WnKbcGBNE2ZAm95hxkGrxeED49UqoM20TEPzk80teYgvS+rf0
	JwYw72B4PdPDnfzGhEaiFVEKdaY9bo5ijrI+Ud5pH7iw2C5KSpXqMFdKg9yG23ff109OkRMqlQ
X-Google-Smtp-Source: AGHT+IEm4BKFb5X1q0agtW63FdYJCI40qvC1DEbS34ledOoHRbdXdLG/0r4eGJo+uqR/WgsmzZYCGMgXB6A4yApRqfk=
X-Received: by 2002:a05:6214:40b:b0:6df:97a3:5e5a with SMTP id
 6a1803df08f44-6f8b08ceb3amr357793746d6.28.1747821770566; Wed, 21 May 2025
 03:02:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507133043.61905-1-lukas.bulwahn@redhat.com>
 <20250508164425.GD834338@ax162> <CACT4Y+a=FLk--rrN0TQiKcQ+NjND_vnSRnwrrg1XzAYaUmKxhw@mail.gmail.com>
In-Reply-To: <CACT4Y+a=FLk--rrN0TQiKcQ+NjND_vnSRnwrrg1XzAYaUmKxhw@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 21 May 2025 12:02:14 +0200
X-Gm-Features: AX0GCFubuxvb81f_x5em7Iy6MU7avDIHjdMdNZqeGYpj71-tqlOCNdY-AOhiHCU
Message-ID: <CAG_fn=XTLcqa8jBTQONNDEWFMJaMTKYO+rxjoWMHESWaYVYbgA@mail.gmail.com>
Subject: Re: [PATCH] Makefile.kcov: apply needed compiler option
 unconditionally in CFLAGS_KCOV
To: Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Lukas Bulwahn <lbulwahn@redhat.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, 
	kasan-dev@googlegroups.com, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>, 
	Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 4:57=E2=80=AFPM 'Dmitry Vyukov' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> On Thu, 8 May 2025 at 18:44, Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Wed, May 07, 2025 at 03:30:43PM +0200, Lukas Bulwahn wrote:
> > > From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> > >
> > > Commit 852faf805539 ("gcc-plugins: remove SANCOV gcc plugin") removes=
 the
> > > config CC_HAS_SANCOV_TRACE_PC, as all supported compilers include the
> > > compiler option '-fsanitize-coverage=3Dtrace-pc' by now.
> > >
> > > The commit however misses the important use of this config option in
> > > Makefile.kcov to add '-fsanitize-coverage=3Dtrace-pc' to CFLAGS_KCOV.
> > > Include the compiler option '-fsanitize-coverage=3Dtrace-pc' uncondit=
ionally
> > > to CFLAGS_KCOV, as all compilers provide that option now.
> > >
> > > Fixes: 852faf805539 ("gcc-plugins: remove SANCOV gcc plugin")
> > > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> >
> > Good catch.
> >
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
>
> Thanks for fixing this!

@akpm, could you please take this patch at your convenience?
