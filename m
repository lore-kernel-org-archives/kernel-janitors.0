Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4093211C
	for <kernel-janitors@vger.kernel.org>; Mon, 28 Apr 2025 23:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745881548; cv=none; b=fX6fqTtPmE6MxHWsJvnJDTxUAt57+fxQnnR4bDHi3l5RvtGdJQJBjKhvV2y3M75kvoeAOilPI0w01cn6slOxbRyMm7tkzHBzgpWteg7vnPZUq1ha7P2ZNToMM/CRJ5sx6C1ta00eq1EWyq/T6vknEkPEnL9GN9U3RZm20i3oNCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745881548; c=relaxed/simple;
	bh=0PgKhQbGjNMa4yQ9lcnfermV7YSX85o0Zl+7gzx5SiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OmA5LEq8vCFWTAFMAutH2Pnp2pgsDlbUP3iR1eCzX0nRmhVsXXWAHspYioFaD7WmOZi1IAsL/x108OdLrjHG5mPuwRywJ6UZheX+v0UrOa1AdjKmuBHhvSBOTuXDOdaNL0sizx7BD1QMy3Q5InUkuqDVhRF7lZou0KjdCYx+kR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QtGr9xTm; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QtGr9xTm"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54d6f93316dso6035934e87.2
        for <kernel-janitors@vger.kernel.org>; Mon, 28 Apr 2025 16:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745881544; x=1746486344; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0R4S0korJIrkvFdB5mdwO4NQZalt4RfkVbC62YLqZVI=;
        b=QtGr9xTm6A1F24pnhsy1Y0+CnQhY5Dro3t4OV1UlOkywGkksYSs0Csu5BJfNHoxbFf
         0+m8bee6y/QfLjWVVRoumT+VkyJAi/BsmSKGOWDTGblb8FQsyqxrVfVtpv2w40rr5e6a
         s2F3Z4jtXAV3hOUOuX1z67NZRWEUA7KBJRzZVX4q7JqrLtcDZaqWKBhTDZ9Y3Y3NTeYc
         7qvX7ysbeJS6Q11e0fNNygxOCJboUqJitrHwlZDFtHHkTaqygCwgndwxgmk1owxNTsM+
         xVxYaZc2uH5cBCJOYtbVw9Naw1pIH0mJ/m2+Sf0iM6VrgSZIntZWNwav+CADtSdzFYe2
         lhbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745881544; x=1746486344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0R4S0korJIrkvFdB5mdwO4NQZalt4RfkVbC62YLqZVI=;
        b=aIsiSM66v3z4K0Fv57j2og4EDu1qSXk7ZlrTF6Yd7KaVNmA+fmjtii0krhRrRPLqAR
         LklRkLBp0kyC43Wm/E5+v2hjDqyRxqdwTIRFhO8fgQDKnx1rmm3ccFwwBBeBp+pTXTBa
         4CXiwHcZgY23EzFhRnPdZqd9lVvVa85LTZgg2WtQ3rsp34TwlkMIoMO6GH7GDUxrwdB9
         AfvrDyJLuEr/H8kseexiNsUJWnGlapbwt/iLAei6+YQBXd083Bkndiu0aRMoIltw6Fg6
         1rAWMOEafvOnpzWIPo/h5cisK91OGX8wlx42uj/NEQGvyQ6Br/vSPXLjbKaYnBuBEd4/
         jIiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaLnJaJ4Exdr5lkrpnxn2M9Da1MfV7YZR8uh2WzM4LcvyWtXtM3HbgyvMSeR2lPw5nyKToe9EXCXV90HuE96I=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywarh2Sb6OoHlk6bPPGRlsiYj2AI0iXcfH5NOjK2W6Dvq3l7lzZ
	mLcPrBaTphq+GiClqctClXb0/VSQeeP8sJuDHy7F6g9pld9DflTf1lvz8jPb1s2+2tR4pdOoaSU
	I0aHSYdQ0pgDRovMTRk2+9SaSGhs1WSL9VXg=
X-Gm-Gg: ASbGncsuMeINx/XNzHbp9ZmNP5O4768QE2wDmul0kj2CJjzGHMftvKAeJ2k3zQxmvHX
	bmnax/KkCru5ePYZJo2v8TUTKrfzNJelkH8/E84XPeAhpTjxO5QTvwvbqpVNoBcS9EZ6/5vTJZD
	fb2D/kXFUJR+RZOuVJgQwtvsM+fZeyc7jJDfaXUF/2KcZlft3Ja+s=
X-Google-Smtp-Source: AGHT+IHMtZ2H3E9dDAX+Lx7o7uEqvP6SiH/aFQ7OE7orf6EiGXGqwg/UlqZz7z3mMAwYhKQt1ZTox86LKxCvfNL+L8A=
X-Received: by 2002:a05:6512:b18:b0:545:b28:2fa2 with SMTP id
 2adb3069b0e04-54e9daeabb2mr386730e87.7.1745881543829; Mon, 28 Apr 2025
 16:05:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250427113529.1473800-1-suhui@nfschina.com> <20250427113529.1473800-4-suhui@nfschina.com>
In-Reply-To: <20250427113529.1473800-4-suhui@nfschina.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 28 Apr 2025 16:05:32 -0700
X-Gm-Features: ATxdqUETLThP5uo4PFWVkPRipIHv_RwOQNEBYPTINWSsM8VaP1HCUT0gsYdiilE
Message-ID: <CANDhNCpg0WRm6=7cb2pTqNswCE=3__7k6oFeGKKuZD7oQ_rmkg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] alarmtimer: switch some spin_{lock,unlock}_irqsave()
 to guard()
To: Su Hui <suhui@nfschina.com>
Cc: tglx@linutronix.de, sboyd@kernel.org, dan.carpenter@linaro.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 27, 2025 at 4:35=E2=80=AFAM Su Hui <suhui@nfschina.com> wrote:
>
> Using guard/scoped_guard() to simplify code. Using guard() to remove
> 'goto unlock' label is neater especially.
>
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
> v2:
>  - Remove some guard() usages acrodding to john's suggestions.
>
>  kernel/time/alarmtimer.c | 56 +++++++++++++++++-----------------------
>  1 file changed, 23 insertions(+), 33 deletions(-)

Looks ok to me.
Acked-by: John Stultz <jstultz@google.com>

thanks!
-john
