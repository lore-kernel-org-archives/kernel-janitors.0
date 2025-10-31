Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D4F335554
	for <kernel-janitors@vger.kernel.org>; Fri, 31 Oct 2025 10:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761905338; cv=none; b=V7ESzNEorpMg/iTyjjHqcTigv8YBeTtjT4qQcW4FjUNiC6/ekJHnuoggIKCU2EN3A1exPBHVeeXw76BsqFHoy4m4oBKR69kmdsaCpa0E280fFhL2GjUf14MCCExrY6XZ+zyIeIHA0dFedKwTtW2P1WJF1IVXmmxlbzg+egygtkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761905338; c=relaxed/simple;
	bh=GXjp8ZBy18xilUA27OFjILAOQ0YF4cNrnmbDvM8+UwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dcfyS0e5uGlcAGjZmgJtyziZbfzqntn3wwN+jNpaIA5wDHgnG/mTrXr/Nlte6r5We4nEFRFwCWr9H7oz9Qq2pR19XDfQRWEdenKFBq4nxSMcZ49jMdslFKANFumW0xi6KursHXfb1yttRDV17BNFrQ7MHtxMrXI6edaOY4x38tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-89018e97232so766349241.0
        for <kernel-janitors@vger.kernel.org>; Fri, 31 Oct 2025 03:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761905333; x=1762510133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3JTKGjcvpUO09DKaENRtxv+sRC+3x6y4adxr9X/nJ0=;
        b=b9kS+kmtMhwDF3VDNVMnNAJ04mozrooGjNNmYiyas7ncgY0y9TihCu6I9Q9OVHGYCE
         HjjUA/XIjFLMp09KZVtnzIUpfy8i/Bv71Wb8EjYwI78ukpmBoQk+GTuolIeKkY2lAkw/
         obq5OjVvDiY6H42fHrxEXcmuZRjjjN/gKoso106+6BW+9dB+bs2N3RCLR+Iv0buFaFCm
         OKXTCQ+bGb+r6hFUlQYsr+/CJB+JbL5+VGGIAFDL2TXU6SAeDBPxwZFYqaLk/hjnOcM3
         bH2DJH/86DJvA/bNYrGdXUAv2TrpqrlsC2p6MbRdVknLizIw2EHlOzu9Tf8nezr88Atj
         EeDg==
X-Forwarded-Encrypted: i=1; AJvYcCUDlLZILgfEElxxuJLA86bDssannhGWQa+TSbzDN+S5Z/tHHFXtg9iwBqpbNnEsbs6ere3R8zCDW2uXlae8S+o=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa9wDFKbmvIcE0qSc5SYVqSqiGyrM979i18jct2XIYgpLqmuDy
	LbdcAt1EjXcZnX0upsil544F/Gn3/V/Usq9XtCWXgIDAqVHi26pB5EcIiG5O/9ei
X-Gm-Gg: ASbGncvo2cwigRe0gmFFtGIViWUZQBto2pKWho0HpBF4wBkafpjzoPjPoyU4iK62UGl
	SVsBncUi0Hh7xCXTIwW4s3TfWQAISYcxNTIeqXl+H3aE7q4wnRdADIqnovD4cqF47uykzdT+pyQ
	Hidi24audr1FSwmOTS0C+bMKw23vI0+p5pU7UWD91GfBVlHTOB5/OIEl1l20X8dW+e4CztVI+aM
	T1qPzq4LKKfCiaPPcXhpfjjgzJAyIdKZYIDNufCg8jYzX1+8qLEw0rd5kKI1j3RZfhweLhS0Luh
	lls0ZGVo9redbPmBLja5q6mfg1NpsGODX76wwWI039/dEHXR8mBDp1uyFErC/o95bx4xP9aQDML
	fZobHUcA6rINLOQHX5J/rxsSXn6G/Z2LnSe7kqPgT2SV667Z67oz6MXYyH6yETfgkN+OwpRO+Uv
	4pJ1rbBMVSZKDDmyydjUVWO4Wf5D7ktJFrDbHrxcaDvJ0sOowU
X-Google-Smtp-Source: AGHT+IGR3LnDb631BsHZIbpRaMOABAXISHy1edlkMZiDT0n05WzpbooebWwQn3FPcjpHh7cGjSL9Tg==
X-Received: by 2002:a05:6102:442c:b0:5db:3bbf:8e62 with SMTP id ada2fe7eead31-5dbb11f0c91mr725542137.1.1761905332610;
        Fri, 31 Oct 2025 03:08:52 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dbb64bab89sm438349137.14.2025.10.31.03.08.50
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 03:08:51 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9310a7b2668so731275241.3
        for <kernel-janitors@vger.kernel.org>; Fri, 31 Oct 2025 03:08:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVDAb5lUp2Gd9zZZ32uD+Wdy2Pg7XWA29W3zhakoXlmp+OXFqpY8GI+L7F4YWpre7p1bzXDhN6fOOkGdPIL12A=@vger.kernel.org
X-Received: by 2002:a05:6102:6216:20b0:5db:b35d:abcd with SMTP id
 ada2fe7eead31-5dbb35dac5dmr303555137.8.1761905330752; Fri, 31 Oct 2025
 03:08:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2fa899eb-60b6-4637-9035-aeff78e261fa@web.de> <CAMuHMdX-uKt3-Lb2NaxmONEqWdtFgTOqXEo1nOfGq-R8ysHfcQ@mail.gmail.com>
 <33199802-d83d-48e8-9032-f1c4c61cfee7@web.de>
In-Reply-To: <33199802-d83d-48e8-9032-f1c4c61cfee7@web.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 Oct 2025 11:08:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXL+YXxwAM+HkawzTMxL2ez5O4bQ-j-LCCXTjz=NoLOKQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmfYw_9WSYikEEtVKPAs2-VGkHCdHdb26XN5HT-568_sb09UKD7rIRpQBo
Message-ID: <CAMuHMdXL+YXxwAM+HkawzTMxL2ez5O4bQ-j-LCCXTjz=NoLOKQ@mail.gmail.com>
Subject: Re: [PATCH] sparc: time: Use pointer from memcpy() call for
 assignment in setup_sparc64_timer()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: sparclinux@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Andreas Larsson <andreas@gaisler.com>, 
	Christoph Lameter <cl@linux.com>, "David S. Miller" <davem@davemloft.net>, Finn Thain <fthain@linux-m68k.org>, 
	Tejun Heo <tj@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org, Miaoqian Lin <linmq006@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus,

On Fri, 31 Oct 2025 at 09:46, Markus Elfring <Markus.Elfring@web.de> wrote:
> =E2=80=A6>> +++ b/arch/sparc/kernel/time_64.c
> >> @@ -760,9 +760,7 @@ void setup_sparc64_timer(void)
> >>                              : /* no outputs */
> >>                              : "r" (pstate));
> >>
> >> -       sevt =3D this_cpu_ptr(&sparc64_events);
> >> -
> >> -       memcpy(sevt, &sparc64_clockevent, sizeof(*sevt));
> >> +       sevt =3D memcpy(this_cpu_ptr(&sparc64_events), &sparc64_clocke=
vent, sizeof(*sevt));
> >
> > IMHO this makes the code harder to read:
> >   - Only 0.15% of the memcpy() calls in the kernel use the
> >     memcpy() chaining feature,

It is also less clear the passed size matches the destination pointer.

> I obviously propose to refactor this implementation detail.

Oh no...

<other-bad-ideas>

The above function could be shortened by writing

    (sevt =3D memcpy(this_cpu_ptr(&sparc64_events), &sparc64_clockevent,
sizeof(*sevt)))->cpumask =3D cpumask_of(smp_processor_id());

And after introducing a variant of clockevents_register_device() that
takes the cpumask as a parameter:

        clockevents_register_device_with_cpumask(memcpy(this_cpu_ptr(&sparc=
64_events),
&sparc64_clockevent, sizeof(*sevt)), cpumask_of(smp_processor_id()));

</other-bad-ideas>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
