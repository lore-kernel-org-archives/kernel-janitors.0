Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B093537FB
	for <kernel-janitors@vger.kernel.org>; Thu, 23 Apr 2026 21:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776978270; cv=pass; b=eHFSTARP+5gNd8xGDNZ4w5voKuMRyWw1R8HGcbWKKt/1ldBAnB+i0LIjLwUh9rc3iJwjdl3Jg1uYFqJGuqsfSrjLBpNXy0jvIxiQPT13JvtZiAYNNonVvqnOuSVmHVKSw3z3vykTo7EaVaVqOPK/UkaGXSVUXkkA8nGhCBhCjuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776978270; c=relaxed/simple;
	bh=l0dbYjKaXACLE+g6kyWGTzIuoHgSBIG/FDz5a+LM1p8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ra62FyBwm0TmzVh/rwywPnMervvV7Lx9KWnRd5vXtpfZGy351sM5WvnkdSaSKpwyMVIJB5SCHrDZJVEihV3WJ0ijKJxoi7lY1ZnESNnssYh2xE0+6GkP78HGzc6TCqPE6xc1+zDmgIRjs9M6/J5+X42TCSPNLASuxKjRRO6cIRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L1e0ETat; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L1e0ETat"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b46da8c48eso164085ad.1
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Apr 2026 14:04:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776978268; cv=none;
        d=google.com; s=arc-20240605;
        b=J6S+pIlq0T1NaB/x7EJMtq0fy2JS68hMvPh9CHrTD9EgR8kWCqtAa+F6cjM7hm/CBR
         Kp/byIYVxHVqirCd/Tc5WRFGZo7HmobxhM2Jd7srANJB8aXzQ8ar39rXE+p/U5wQawoS
         tE38qc2jWjIE/fS7xQfjG+NRnXUwxxvxrXxjWiisk1/PUylZ+KdCV9sndlClWxrMKhwc
         VNyS7i1x0GtXRrZttC6kYNZBMGjEyFPXio8RjuT/wG2AzPbpX1mv9pOhDLVcny2WuXJH
         LvaKR03DStnbYLUdrS62eDrfYGsyjIdYKelfRmR0YQr7eAaEzEJK/tttrP39Nu4oIKSg
         Tcfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1cWLkIeO9dgziLvD/Z/sVLy1HSqogwbal/nrc7rK6xw=;
        fh=Uoq5gxCRGu40UaIOS4HDZ94oCea0CSVPZDLEigdMSTA=;
        b=SinH/6jzdI2iTJ74fUfU4C+NnvBhlqcd4AMsdchxZBCr1LbQQhluUY8NhQDqdzEndC
         9ASepMnnA3Sz/0S3o4Nlv+gPD/edBkEyE+ybPRNRkmIObAw48Ei9yKJZHmu9HWb/1l+8
         6aoqbq54/Cm+TPnH5vlZ5JpYR76DLZfrFMPDLTP7MvmOeQuzsJ/A3U03Cc6y7DCPsWyJ
         6+bAjJir2HFJcmVYJFd7mwfOaxP/469HPKAn0Wr+REaSNw4iyIBLnZM/JxugeVHsdRIU
         y3G3knJRUJMEgCktrlUGsW5WYHzShCzZOsaSREt11r0oRHHrDBfum17kK4flbZl0CkFa
         DSbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776978268; x=1777583068; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cWLkIeO9dgziLvD/Z/sVLy1HSqogwbal/nrc7rK6xw=;
        b=L1e0ETatukCaAGKYOKmEzpg0l/CyxMvMZFMiR2LH21phe2vaAnWxjjINiAoMeB2PkD
         hS0/wY0eiSo++R3I8EYNimR6pk1d9sYVQp39il0d0sGQVnAkuYJ3vmTBSzMksVAAhFBB
         q9V5Cxe2zIKoVE1P2U0VL2g3mlNf/lmsWzox83lpUAef8LJBQvD5SUlqwTsr4ud71w+D
         Ygpr8xoSX/MwDlAsWIIX8nt6GN9ekQhxLhNp3yQa0rngUNHyrvYqcm3xuUiXvNuRJfWW
         AC0uX6x6PHWLZwoPDUiap9kaFfdYJDawZha7ek5A8XEp1yH4O+XyBrmkByYdxfKJaY2t
         uMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776978268; x=1777583068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1cWLkIeO9dgziLvD/Z/sVLy1HSqogwbal/nrc7rK6xw=;
        b=TdtzdGNeFaDK9GRoPnvFM8WBAAWfH8/mV3tJofp3cajVWAMQfMuo4fOyi9sN5B4/TQ
         wt5QVM4ijQQbvgT1McL7J5mDNcAGNbsHX56NZ9bimca/GfA6L6j8URKr4y0OiHqoiJCP
         W3LrU4uifV3rs5t9wMXuYv9MP0aEVoGI+MCijLaYAVamI2OpCOctvFc7lq5ky+OwgUf5
         mqmd02GoY/pQGBe050CuYOy2+MkcO1N9bpZM1M3CNYhCDEtkhYhP6hPhGkcm4ANNSuh5
         kbz5qY9WSCbIryzxzKm47fCSPtudAIX0VnUe9JF4bLGk0gJdNy6KLBrzDYbmje9k7Oqf
         PzUw==
X-Forwarded-Encrypted: i=1; AFNElJ82X0nkKcz7s8CypZL1iArQMky6zYvPWgyBk8Pc3DSH7KTipRxk9ocjckInZ5W0IkBO45Mx9ZV48ZYK7oNx/vg=@vger.kernel.org
X-Gm-Message-State: AOJu0YznzoRZdcNMIPq9P7U/apllb9hQtBR/u8RzD9jukAzfE9FtZPdh
	qhQ4AkDpA8d+weYNB9gjIl3EIecnYvobXQU1oS5IDEvTSemuvZZlQm0RGrjkpeRMH0z6VssDIX3
	W02WeoWppIr/zcwKHPvZZbNwu0AZm6PdLEpnTtwJZ
X-Gm-Gg: AeBDiet15YOF3kaasAXKL6fKu9ywekuJ0umUArT4EDj8heEhrUZBxibJKDddX90zhnD
	dur4Bu9rbO/Y1Z/F1WniiLZW6znFjQlG7PZ8Z8lz7Hmqa1Q4hTGLtQCzqvvGGaUqtTE5P05J8kH
	Ga7KLyW91R5PE5sfmHdn4aF/FJB1HfPPX/sv9jixFwgjlcwHGVTQfe9XQJ7fFddTA1/GZ/IDQZc
	ja4R87KsQTHSqDbEz2gAftiBd3kUjXZcpuPAZPB96sm8SrUgNGNdv8UB6qD4b0NCx6SKYO/bSIU
	0EVnOPP+csvcEoxwubpy8a8w4LoRo3/vAUxg3LZPpN20rC3mbm35086BRcccbzojgiJg
X-Received: by 2002:a17:903:1b68:b0:2ae:7fa2:6bda with SMTP id
 d9443c01a7336-2b603e99857mr10721985ad.1.1776978267781; Thu, 23 Apr 2026
 14:04:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aenFGy9WDllTEO0S@stanley.mountain> <CAP-5=fVL_qishriDrRvvXQQ5VSBZAxs3F-HQ69yEtEzdf+6MMg@mail.gmail.com>
 <aeqAypUUfE8jB7Uo@stanley.mountain>
In-Reply-To: <aeqAypUUfE8jB7Uo@stanley.mountain>
From: Ian Rogers <irogers@google.com>
Date: Thu, 23 Apr 2026 14:04:16 -0700
X-Gm-Features: AQROBzCNv8y7m_shmSeQzeQ1gvsdC7ZxfHk-9Me1GDtw-oRfFJO5phcWWkhoONg
Message-ID: <CAP-5=fUc+j+B1s0BO-xrUe6shv=xdGtoAyztFRrLwHR53yY_SQ@mail.gmail.com>
Subject: Re: [PATCH] perf dwarf-regs: s390: Fix an off by one bug
To: Dan Carpenter <error27@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Guo Ren <guoren@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 1:28=E2=80=AFPM Dan Carpenter <error27@gmail.com> w=
rote:
>
> On Thu, Apr 23, 2026 at 01:24:50PM -0700, Ian Rogers wrote:
> > On Thu, Apr 23, 2026 at 12:07=E2=80=AFAM Dan Carpenter <error27@gmail.c=
om> wrote:
> > >
> > > Change the > comparison to >=3D to prevent an out of bounds access of
> > > the dwarf_s390_regnums[] array.
> > >
> > > Fixes: 1e452dd850f3 ("perf dwarf-regs: Add S390 perf to DWARF registe=
r number mapping functions")
> > > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > > ---
> > >  tools/perf/util/dwarf-regs-arch/dwarf-regs-s390.c | 1 +-
> > >  1 files changed, 1 insertions(+), 1 deletions(-)
> > >
> > > diff --git a/tools/perf/util/dwarf-regs-arch/dwarf-regs-s390.c b/tool=
s/perf/util/dwarf-regs-arch/dwarf-regs-s390.c
> > > index 310a37451bdc..f79216a7665a 100644
> > > --- a/tools/perf/util/dwarf-regs-arch/dwarf-regs-s390.c
> > > +++ b/tools/perf/util/dwarf-regs-arch/dwarf-regs-s390.c
> > > @@ -45,7 +45,7 @@ int __get_dwarf_regnum_for_perf_regnum_s390(int per=
f_regnum)
> > >         if (perf_regnum =3D=3D 0)
> > >                 return 0;
> > >
> > > -       if (perf_regnum <  0 || perf_regnum > (int)ARRAY_SIZE(dwarf_s=
390_regnums) ||
> > > +       if (perf_regnum <  0 || perf_regnum >=3D (int)ARRAY_SIZE(dwar=
f_s390_regnums) ||
> >
> > It looks like this mistake was copy-pasted into these files as well:
> >  - tools/perf/util/dwarf-regs-arch/dwarf-regs-csky.c
> >  - tools/perf/util/dwarf-regs-arch/dwarf-regs-x86.c
> >  - tools/perf/util/dwarf-regs-arch/dwarf-regs-powerpc.c
> >
> > Could you fix them all?
>
> Sure.  Do you want that as four separate patches or just one patch with
> four Fixes tags?

Probably the latter as it will make backports easier. Thanks!
Ian

> regards,
> dan carpenter
>
