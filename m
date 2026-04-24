Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770B534BA53
	for <kernel-janitors@vger.kernel.org>; Fri, 24 Apr 2026 07:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777014135; cv=none; b=t5Jew4jk5G0wTVvsVk41FdXHsOm7jtpdVmwFdMZQuIMGebjUldXQfjDRfdWkb1l+XF+kqUIItFACd3T5BEMqw9lkAu3hBP/0lmSFiLzGmKvr9EzIude4ERR602XsXRURp+htzCtAaGGxPXEnVdXlwwITMGXNpcKBx7AdkBb6wsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777014135; c=relaxed/simple;
	bh=AUoyGX1TBNbBccOtWj1a65Go1tacL1lZIR9aI7x5yVc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=b2sz5N0l/btywYCek9NCmhPzWsL5yPo2e9s955JlCbci+preUHVeueZRZzSIqFBE39ydx3V/4kUQcZx92jQ+GpzR2DABKjMIoFHaJjbWRad0ZoYzapordjzEiDTkFkiUZoc+KC3stP7mWdHf+ga5HkTLOOzDXVonRLRnn4ZPuzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiLQ9XT4; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiLQ9XT4"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59e4a04f059so8881371e87.2
        for <kernel-janitors@vger.kernel.org>; Fri, 24 Apr 2026 00:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777014133; x=1777618933; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mHFsXQ9X0wPnVBFJ7UXhxXebrhMMwwEW2KVI7g3J2U=;
        b=eiLQ9XT4VF9YUY8Daxf94vrQhzZeNHiqWWz/DswUpnFz3g3Vrb8ZMQpxCHE6Vq/pOz
         lhUqxOX9fGShwWQaBmgspul/ZzeYX9fp7oKyThp4OobliFKd3NJ2DNd0TJMN+t/DQsdq
         5WM3fSDEYGmVq1i/kxbtQAyIMpVxpHvz/KwGGhwjo8migVCUYjpvZzln09TNTyguC0ee
         xZhXs+NMj/0+vaOP0uSLcDzL0nXjmaBS4TVv5hsy8l1j/sXuIyVfXJHVyPhGLR4PrMcL
         GN0wXfZmcg+YVyhSNcvn1xhEvd5xs6R8c9iNGGeWWnmJz2pZPMlGL1Yo4ptMYXZOrQd/
         34rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777014133; x=1777618933;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5mHFsXQ9X0wPnVBFJ7UXhxXebrhMMwwEW2KVI7g3J2U=;
        b=eDqS2zl7MtDfqvwhsDzMWmzAXPUe7CCyELbQjaMBifRg43Ty2qqaYL4iEACqfngxJM
         PoB/V/zbmLUzJPAv/s5QaW6FTWM90cWMPfO0WENI7LMFrWHF4nBmp2FypjUXyBezOobj
         gmJLx++sFZKKFkc29wx2jDM72gi0GGgsA0SUE8J7Pj9bFpJY4hGaI+YQ2MIm1vGqvE1B
         8GCSn4ODHqhg5ur+tbfHUMrlClG/pe6cglGvqBR21p3CobfzIw1FhaPZPC7d62g3Te/P
         g9Yh8CslTx01+G9GP8wv/BzQFE8mDz7kFhL6dOuJGzj1wzn48Q9hyiEXJqwxV1zPm0nL
         RXdw==
X-Forwarded-Encrypted: i=1; AFNElJ9S72xC8YOsVcGUtjaWyapAHr0rZlJEhk03m13XoIhVK4Bp3jyGA2fTBS+c30lcoEJgBXl5et+CTpFTUdJOn8s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS+6GZEnFJgQX7S48vs2gb/Ak8XfyWls1ac9qm+0/ISuStfUjD
	rkTgWNzNXTLegiGXgau+Y0tYSwEp1YVPFqeT2qhB7QiCGAWZtMuinGrE
X-Gm-Gg: AeBDievug1e2bfjP+280ZxbB5GtEQF7N8sGaW/43gkfWVKbImO2tdpQ8fc1Zc2L9Daq
	XJx3cu1xfr3T2xu8yofYUkJvFlmXQeuk+OkttbW4jPbKTrzqiSdd39eZ4e9oaviDfu2LVVDv1PI
	KqSkW4SBZfMOWNX9h+IlS3mtZFcaCE062NWIdx6ySc3eJ0/NJB9IQd77CS+zeXezEx0uYJDyH5J
	Np/ylHhSQQbiBid/sJP371O9iP+RpFrJRVBuq/t3Y73IuaYfQ7ZpN1WEMnIRbWbhG0sUvC32jfd
	zPhA4kH/kONMZl13LypRGwWUzlXk3+4jJ/fmyPP8jADlOH7wVsUkC0QIO7ZPMwzxUc0HKBoIy95
	a+cRb7u/f8T6+JKR70uimIepn6HwpQgUI9D9Qkv8PG+4nOoE5LI5vWmmEk8R81YW9uoQjet3Fe5
	cGsOmpFgc6tFt6oA7s1DrmwOqVWVEM6dYNkkI3hPYjSB2ilScp/vdYbHUT8tPVLFFhOIfxBFc6
X-Received: by 2002:a05:6512:3f0b:b0:5a1:3da4:e92f with SMTP id 2adb3069b0e04-5a4172ed499mr8762400e87.43.1777014132251;
        Fri, 24 Apr 2026 00:02:12 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc17dsm5739996e87.19.2026.04.24.00.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 00:02:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Apr 2026 09:02:11 +0200
Message-Id: <DI16XPYGNFAK.1G8WN64YS815X@gmail.com>
Cc: "Peter Zijlstra" <peterz@infradead.org>, "Ingo Molnar"
 <mingo@redhat.com>, "Arnaldo Carvalho de Melo" <acme@kernel.org>, "Namhyung
 Kim" <namhyung@kernel.org>, "Alexander Shishkin"
 <alexander.shishkin@linux.intel.com>, "Jiri Olsa" <jolsa@kernel.org>, "Guo
 Ren" <guoren@kernel.org>, <linux-perf-users@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] perf dwarf-regs: s390: Fix an off by one bug
From: "Linus Probert" <linus.probert@gmail.com>
To: "Dan Carpenter" <error27@gmail.com>, "Ian Rogers" <irogers@google.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <aenFGy9WDllTEO0S@stanley.mountain>
In-Reply-To: <aenFGy9WDllTEO0S@stanley.mountain>

On Thu Apr 23, 2026 at 9:07 AM CEST, Dan Carpenter wrote:
> Change the > comparison to >=3D to prevent an out of bounds access of
> the dwarf_s390_regnums[] array.
>
> Fixes: 1e452dd850f3 ("perf dwarf-regs: Add S390 perf to DWARF register nu=
mber mapping functions")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  tools/perf/util/dwarf-regs-arch/dwarf-regs-s390.c | 1 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/tools/perf/util/dwarf-regs-arch/dwarf-regs-s390.c b/tools/pe=
rf/util/dwarf-regs-arch/dwarf-regs-s390.c
> index 310a37451bdc..f79216a7665a 100644
> --- a/tools/perf/util/dwarf-regs-arch/dwarf-regs-s390.c
> +++ b/tools/perf/util/dwarf-regs-arch/dwarf-regs-s390.c
> @@ -45,7 +45,7 @@ int __get_dwarf_regnum_for_perf_regnum_s390(int perf_re=
gnum)
>  	if (perf_regnum =3D=3D 0)
>  		return 0;
> =20
> -	if (perf_regnum <  0 || perf_regnum > (int)ARRAY_SIZE(dwarf_s390_regnum=
s) ||
> +	if (perf_regnum <  0 || perf_regnum >=3D (int)ARRAY_SIZE(dwarf_s390_reg=
nums) ||
                     ^^
Why leave the two spaces?

>  	    dwarf_s390_regnums[perf_regnum] =3D=3D 0)
>  		return -ENOENT;
> =20

Br,
Linus
