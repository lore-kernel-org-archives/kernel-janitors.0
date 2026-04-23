Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8EE311973
	for <kernel-janitors@vger.kernel.org>; Thu, 23 Apr 2026 20:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776975904; cv=pass; b=gbDsQQ0Ew9rFDlyFm39NoDViceFUR5Cpbgl3liafnnAkEUSKHAPaE5D+27Lb7Akc9SOBvlfmPrEGSTscEVW1S3wSKMQVSDlPNjswGHdWBMYv6iFBHZ/fwY3FrS2PUacg0FuDjxlr4zsh7DlAlywxKz3BLMTLQNC+GPly7fB//hs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776975904; c=relaxed/simple;
	bh=YGiYOD0YAzl+hsyWx9dTJVp1iE6LcM1LkEa/CRJ0Etw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KeXYDNdDLShiJHIvcZlI39oRqv84/zfWcHgqJN8RP5QoxV0TiaHQC5D6magJWFsGl1kFllxxC4o7SQRLvnEwEXHN10aNfX9exF7tBlxy05aKUT2DggBhAcXyUFOTeGbzUyJgPpFXtXemC8jbmd98HVFxQOAV8cLtMG2L7psuO80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c34eD6uz; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c34eD6uz"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b2e8b95bdbso159585ad.0
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Apr 2026 13:25:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776975902; cv=none;
        d=google.com; s=arc-20240605;
        b=I3489iNzBwB/f0+zgzxydmK8oAl3Q7gEtQwV0zhUL2hP3YVRiQV0gjJARXtmFHyoTg
         lzB/THSlp93T2LjocVdnGdE159joKeELiDwloa67+UhRNeToopFL4t1xtsQbzgWLPxtF
         53/gyOrRmdYRWCJkVMlqNYUo4dHDIXpWsno7gyRMuiBFUPVosZjDFmgmbOd48VefAxrp
         b4g5mSAf+gCeraOhn0ARKbNQ1S9gzMXLpkMxbaH37pX+BPnsUOfkuEmPGM3XGJvn28DS
         lPvqtkiZysLXS+4YHm46i3r2AfyKj0bONzPIdqpIV9LvLDWsz0RRiXcmHq3h4UhM81yP
         qzgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s0weOdPezfYlqgB68Vq6bqWqObdSULkcZsBLL+kU61o=;
        fh=rIzxky0HH930WcRmgpqEcnJPEkomcPD8okXRylKdh00=;
        b=IixVQg/g1hU6SA06eNeUY4YSzZN+jpNaKbOm91LTUE8mZlaO8542i4R/B27ouJdaEI
         ydfIcQQA+i9MHjtHCYWivWSg1X/fKw42pAx16QA0W3JBdU0Ty1Ki9T94f9/WEaKFE1iD
         uchXPL5mSFaNIgtVE/9vsk+Rn4b76Og5SVu2jxSbtQxTKLNIAQ5DN5xooSwh+ikFXGIm
         DhccKMe0Yj/xjLxi1KXP1eKDxp659ZAOqkAWXDUiIpd/uQ9raq/LVysnUazlysfQxhYV
         u6nkADW4LOgNTnGvlPcp22lxGR8I+5VmV9OxrfFjV6wnlkNoEv1NupXVTl4I/KcSqrX7
         ivng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776975902; x=1777580702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0weOdPezfYlqgB68Vq6bqWqObdSULkcZsBLL+kU61o=;
        b=c34eD6uzDYWAgVzpuIzZmUAjwgNzB7UzSxrEr35YA86ymikIj2A61YeF/YS5KYcOES
         LYgwBdubYEcsKXAB/aFlXJA8Pakbye8di0prJuUwMkPo94+ePKffo1Tvgjyg7fo4BuiC
         uU5/O4cmawHeewoU/EXmg+07hBM027ktOGVn7Lfqhbf5xJuzGMPWEXzsSzNOy8HRpyWZ
         HQEQU9GiF5COuTlnHVEEP4jZ2L6/RnA0wvPCdOFDdnxn1V3P0JXKd5qoT+rQWpGXQ5qm
         P9gccXBUYZL2xHsthPXo3Y/HX186yccY6Qy/OnMjDH5y8JcCpLju6nNownFkr8SRk/66
         E/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776975902; x=1777580702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s0weOdPezfYlqgB68Vq6bqWqObdSULkcZsBLL+kU61o=;
        b=TjCu3t5Fq1vIfyJeZyK8rkO1NPcLi1T4pxtMZKezTr3TywVskB+mdqK+PovK3zgVhH
         bfbrbEhZNcxc5GVzWmukJ9Bur0JOR8Ft0Zktlhg/2e3c8f5t5O4+yPch1WB0PRY1jc0w
         RKqKhB1Ppz+FYdoGEauXAhXzBXPtNRTiq5In1+UFwccQXwivdGuZiUlhJuLdHr8Kire/
         shgmKnIsfEFUAKuK5fPhCkIONSvLf0QuD9vASFAwNxK/pGbfPteyoyUv9k7ftPv0fbZ/
         UdIQyeeNIhC1895OCG9OaoD8xPJf74AaLsApVi36kMf4xP3EzMsCcpOi+B19ZaxIVeD6
         2HMg==
X-Forwarded-Encrypted: i=1; AFNElJ9NtD2yngoybsXzYFaOKEQ/p25zQ4ylUCTkaOzwRExqtdz5jE0sTOZbhrTQcndBiui+aoCenCO8QIv+fl4JCJY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJSNw2GkCBxjSQICnOv3NmNiHn+Jl/2VNA4CLTR0sX2EKfbIUW
	A9bbLdENhi/pWmUSJGVJOgPdh0IjsQ+etObh73CugyXl8r+mcnpV9JFuDtFgT3xbIjITr1it2O5
	7kSUnhWHsMakf/17pJDxrQf2ZBI24VmtZwFXR69nJ
X-Gm-Gg: AeBDievGfDUPdLkMxNs6bftJcVaymwLyb5m4EM295Kyh8aTrzUFtkKhTuIcA2uPpAT7
	BkKNalRW5SvVMG8HoMNTwVPA4d6i1dM1FKyfgTIMs/re2NQESpXusqzyi6oB753/U1MMvIvp8Lt
	262e0v51xsNQLBZXcW2+gFx6Jr26WtbqRxmS0Xix5ld2p55iUxxZSDAiP/mWk/A4CavaqY4N7Um
	OKmiDmnOAv5dXRmlywRds81kKH+WQnaAI59xo+EDfT9AapjjNPJHH0L0PgDDbQDPP/9mCV8LOOv
	eumQC3Qf8deNiJfm0l3rWsDBuqmKbmTmS8agb+dfydh2tYrg/K2wqt9CYA==
X-Received: by 2002:a17:903:2c0e:b0:2ae:4808:bd99 with SMTP id
 d9443c01a7336-2b602f29c57mr8502145ad.2.1776975901690; Thu, 23 Apr 2026
 13:25:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aenFGy9WDllTEO0S@stanley.mountain>
In-Reply-To: <aenFGy9WDllTEO0S@stanley.mountain>
From: Ian Rogers <irogers@google.com>
Date: Thu, 23 Apr 2026 13:24:50 -0700
X-Gm-Features: AQROBzCiRPLfxkESftY2EeWvuWdseSpvfvpTBkOMFLmTqI9Jr_bU2OjbTiN_tw0
Message-ID: <CAP-5=fVL_qishriDrRvvXQQ5VSBZAxs3F-HQ69yEtEzdf+6MMg@mail.gmail.com>
Subject: Re: [PATCH] perf dwarf-regs: s390: Fix an off by one bug
To: Dan Carpenter <error27@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Guo Ren <guoren@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 12:07=E2=80=AFAM Dan Carpenter <error27@gmail.com> =
wrote:
>
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
>         if (perf_regnum =3D=3D 0)
>                 return 0;
>
> -       if (perf_regnum <  0 || perf_regnum > (int)ARRAY_SIZE(dwarf_s390_=
regnums) ||
> +       if (perf_regnum <  0 || perf_regnum >=3D (int)ARRAY_SIZE(dwarf_s3=
90_regnums) ||

It looks like this mistake was copy-pasted into these files as well:
 - tools/perf/util/dwarf-regs-arch/dwarf-regs-csky.c
 - tools/perf/util/dwarf-regs-arch/dwarf-regs-x86.c
 - tools/perf/util/dwarf-regs-arch/dwarf-regs-powerpc.c

Could you fix them all?

Thanks,
Ian

>             dwarf_s390_regnums[perf_regnum] =3D=3D 0)
>                 return -ENOENT;
>
> --
> 2.53.0
>
