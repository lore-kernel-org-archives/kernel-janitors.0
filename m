Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61262EA731
	for <kernel-janitors@vger.kernel.org>; Mon,  4 May 2026 07:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777880245; cv=pass; b=XyAS3MbLh7c/6b84lT+wSmfIlJ3N4NYcCSUeFZcOGLBYDUFwGOJ5w5CdxSWIWKKyRvmUiA8T29QW/uDglUCcUM0ykYbDnKMg+seBTuRTuGdlxUMSAdi6VC3WmCaSk6t4Nf7n14KAoWK8xTP3N/tHmb/wveWbMmCFlP7nSGnCeuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777880245; c=relaxed/simple;
	bh=zdE1vJQEktDqwgQR8dLgWDeJgWrJ+rcLT2j0LEEBao8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ranj/SAmxv1SD9sTUkV6TM9QxbmDKshOhGBs9CwCM4/MlNTxxqFUFYRksn98CcKz5AnJxp32IYInzJ4ouUG//k+BkpAMi6D7AvU0RO2daBItjUFcRKlEb6fh1usje4JUBVtSm1b4T3faOgCykHtoSLSWH5d9UXiWWG6cqh335ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t5K1MhLi; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t5K1MhLi"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b4583f0a1aso22275335ad.3
        for <kernel-janitors@vger.kernel.org>; Mon, 04 May 2026 00:37:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777880244; cv=none;
        d=google.com; s=arc-20240605;
        b=SQ5DfxM0lJcivqt/AiEyqyMC19AsrNaT2xaYoFe0QE5L3K+3YH/76yJSD5PUuj2irK
         2PYkllneh4Q0LVEMRbkxfn4BuMj7kvD73YPfEK+QdxJQTgjODbs3M5xOJqBT8dQvWTn3
         E8nSRUIxuIsaHeS9EP2o7mAtnKrnW+bfGxcEHSB6vEWAzVfWcl34dT/hKZn7D7s5hjm+
         nlk5nYfkip6FZ1tE4DKtwIuTxrcvief93Jpx4yLgUu+uasMKkoX1YK+SxgPJ+eu4arBD
         30QD6v41s1AlzqDaj48QxeGlZC5YK/wc2/1aQ+9dV7y5UDEA6P8kldLSTorLjDBCTWAi
         x0kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fDIUOE+GUmzr8b1GB6XoDppnhkOmNhmWDiJK7zfauSU=;
        fh=FTvXpjA6C3up+qKK4OM9jKvjHuIcgHsoVjBPQ0QrvPU=;
        b=B4m+4dxXoOXQmrYfjndAr+F7YsLzSrUnEFF3z9CAvJAVvqcjNI33QXW3flQvCv3pJh
         opAs3g81eMozyBTXejeBrkvtQT0P/vseEl0QYncfPjx/jTuzYgHc47fyyvLA/xaWK2hO
         rN01G0Vvi3ceM70/Ex6jJh/31OnROsyG8Hw0/bRPlUaKGvHeyxFCcfTXsH04yCRGJ/h0
         W2g7fBecPh8gB7SA1JaxfXVoRHq3qVJ1vO3jPyd2LN3NCCeHtg4uGHL4sBGLq81bBVx4
         y1pFP3GH+zCDSVMUdozSZouofkZOq9bA/cqtBZgrL5oxjIDQ+1QZRTPe2LwOzdbuRUFC
         p3iQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777880244; x=1778485044; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fDIUOE+GUmzr8b1GB6XoDppnhkOmNhmWDiJK7zfauSU=;
        b=t5K1MhLii1NuzFnF/Q9hta0lPyVqkQMXxNwVCZdhJX6HyulEeRzuYzJ7PRdTkqNUW5
         jmoaXu0vMXaQPcSdW7n/p+8BOAiIdvBB1EBOJNZMmcXEtzBDNgmKPBpgJJfpUmyS6Va2
         QKebN5vt47Z0VFiNdQkLWZUC+D4156g+79P9GmOjZtpJivKFjUZ3RY8UtBoVERFWTT4a
         yFIF+FWZ2gzQlQ7bg1LlcSAtbuAusO5z6Ewzj9A9lcv3Iv0C8HVOWp6lYf4wBAAyGW7M
         L4ndvIBCEPYWfLUiOs0JvV8xiZy3YN15busoSQaXfIHQ1bIa4AoOz+qMDKy+f+5Fn5Mv
         ep+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777880244; x=1778485044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fDIUOE+GUmzr8b1GB6XoDppnhkOmNhmWDiJK7zfauSU=;
        b=Om9Soc8NTx9ssbOIXhb+uYu+ifJ8HVZRkG7qVXwS/jvU8Dbux6v+fUriBdyXBMPZF7
         vfM4bOd3xJx/Xs/Y5M4Gvizvq9Pb9GBkiKGDsP6xtKOBmPUPIN0Z+nTWQ3/rncSRosVx
         deB5rCtHckPdxXM8XLXBLbB9Of9M4YebvLzbCQvvRJvOhJT/TmFy6cpC+aiQDkd5iw5a
         +MsraHrRLsadwJ465eHjvkRfovAUQU8/BrV36td1AALog2/nvoVt3yavgbOsvFFD46tz
         ir/36/exDxRAav74E0M+fwxgDQaw6r1clNnibOEJf8ZkPMhoj1MuAbF+x7nq/C1YDGSu
         vJBw==
X-Gm-Message-State: AOJu0YwGfh1mLvDjBddZaCUjWLvVkO5jK0ijL27+SgiMdgtOAhKTfh1s
	TpRuq1+KdXaXXlp0FlF2WTk5F+iazN5GYJ5NXTQwweTda/hYy3sWW6hnVT/H2FEjEurEN57w2nN
	chWNtMp0CMaED8znYaNvDAKNfDbNS+xMjGzTn4z1ONxgU1j5tAgrLoQW0l/g=
X-Gm-Gg: AeBDiesLlbPZL/Zgh40jDBGSw+NF+bt5DYwq784yGiNO1cGsbPWQ/74I4EJ13NF74eg
	TXxbJjQjmjaNFF1U5cr3OjKCKv3+9KxrH+Fd+cNXi33kUiP4I4TusZUrx2lIFb0Og942ijB/TA/
	RAqo75294a2ZxkHj1tFR/c7bF3Ep/4h4g3yOCgUYEahqN7j7nFQFXS/eHDlWGEA68FuuSCYZcEP
	9n4IKQGZQvxPc9O5Bi8Ld8VOMt5mTLX1TvtgH39xlM+ZOYZsZJ5FF2zcVqKqLIA+Bc7fk7GU3uo
	DSN5jp4WYHZejxd2YDcE3zAYd9YfIrU6l4+U8OWX+9EpCjIhKWTMNPDmfIc=
X-Received: by 2002:a17:903:1b4f:b0:2b4:5986:cd80 with SMTP id
 d9443c01a7336-2b9f2812383mr86219715ad.26.1777880243432; Mon, 04 May 2026
 00:37:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <afOcIan1ap9kD26M@stanley.mountain>
In-Reply-To: <afOcIan1ap9kD26M@stanley.mountain>
From: Alexander Potapenko <glider@google.com>
Date: Mon, 4 May 2026 09:36:44 +0200
X-Gm-Features: AVHnY4J18s2Ib09O_igrfzgzgPRTtzgbKv9A2SorusiLIi0SuIFKtHhn8f_gZxM
Message-ID: <CAG_fn=UfpLZt63zkZutfwY_VpQi65S=B4ZJcgzA=dbRK-XVDcg@mail.gmail.com>
Subject: Re: [bug report] lib: introduce test_meminit module
To: Dan Carpenter <error27@gmail.com>
Cc: kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 8:15=E2=80=AFPM Dan Carpenter <error27@gmail.com> w=
rote:
>
> Hello Alexander Potapenko,
>
> Commit 5015a300a522 ("lib: introduce test_meminit module") from Jul
> 16, 2019 (linux-next), leads to the following Smatch static checker
> warning:
>
>         lib/test_meminit.c:390 test_kmemcache()
>         warn: bool mask is always false 'ctor & zero'
>
> lib/test_meminit.c
>     378 static int __init test_kmemcache(int *total_failures)
>     379 {
>     380         int failures =3D 0, num_tests =3D 0;
>     381         int i, flags, size;
>     382         bool ctor, rcu, zero;
>     383
>     384         for (i =3D 0; i < 10; i++) {
>     385                 size =3D 8 << i;
>     386                 for (flags =3D 0; flags < 8; flags++) {
>     387                         ctor =3D flags & 1;
>     388                         rcu =3D flags & 2;
>     389                         zero =3D flags & 4;
> --> 390                         if (ctor & zero)
>                                     ^^^^^^^^^^^
> This is like (BIT(1) & BIT(4)) so it can't be true.  Was && intended?

Whoa, thanks!
I wonder why Clang never complained about that.
