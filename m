Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3F43321DE
	for <kernel-janitors@vger.kernel.org>; Thu, 23 Apr 2026 20:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776976084; cv=none; b=Fl7UrS9E9BHXIfs1M9f0I9784NVlJAmiHcp/T9uxMeYmUYytNkRTcqUK+TWD5JzGp2xggk3A/Pl3QYQVxKcixKYb7xhQhQU+EtUPLkSDK9qy6THhn5yY2ldVOGuGDFJQhMvJC+LCKKEIBzzKDRFx/4xzVZCd8caTJAOJq/3cs/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776976084; c=relaxed/simple;
	bh=JdbHCPbLCcqtJwf9uq7R6ssmHNuSFJBOhhTxI1pM2k0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dyr7GoS7SqqQT35SiNMv56InFkkfx6jYkl4qsv/4wm9m5JmKQFOhi7Mq6frlj9TUg5WZ6ftOSSOj3c/XCHi9JxJ2F8IfLstGCzKQmLUlX020ZAPSi5lbFvZOm14fpwbMglq6d7DBEcDn99Ixm5Uh/p/Lk/xnfcelHKkuAPN3t4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWYvuotl; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWYvuotl"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7bb0d18c7f9so27195487b3.0
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Apr 2026 13:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776976082; x=1777580882; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uBsrIHveQTj43u4uWhioOd/AqRJr49vkfqhXJkPx3yc=;
        b=WWYvuotl+bpx1T9tuCyBSRWW0/y/VuKAsXj/ULaUtFWaUIMx82UImf6OtZCTuF7qNp
         su7xHTjy75HD7cthh736ngsZPgKrj+opaiZRxG+wOBmzSH13UsEoBL1kXLCOc+6/FwSi
         Rmor9ZDltYQB3CBaetdFJUeLwg/LGzLVJKQJw6DD0+eDEOzoYQkR51Oa9/XhAV3v7gLo
         +zep32s4Qb2w6LS2Sdhag42Sgb5q3c9DZpPdQe24OlXv64RLG/Rf3bP7eJ8/v5otcvkc
         GkowQLysBmWltZG1RUnCMwauouYN0mOSa3BCj1cbX5jSWBC2Zs52wF/CpmRsrYA/4k6P
         zcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776976082; x=1777580882;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uBsrIHveQTj43u4uWhioOd/AqRJr49vkfqhXJkPx3yc=;
        b=bwQVujG59noK2PlfhNQlw+MfM4eKsG8JSKB3I49AvzJCu3tohIp+nsoUPBgZsvnsL4
         Br10/ODAs/Meu3SgEdJ8y6a4RGm1YF0U2qA2Ny9pl1XkeIpAVDxhJgqMKLDVsjMziYUx
         K41oX2GJTKL6k1z+/83mUqvFGKF/z3JSsdoU1vAWyPjxCxtGESSL1JqXngxKgQ76GqcS
         GsRy9F72cfkeZuL6uaKtUWZTMAES6IfjLmZbsd8SgxgiCjR2z8tizXq9SeyUVdsr6pKy
         znX51T+1MvUhyoHuMJKFd50oWM3oCShsBD92ngnUQBRjt5RrhHn2ZzVTVFhCfZpKkEXU
         I/ng==
X-Forwarded-Encrypted: i=1; AFNElJ8RsISgDGL0rp9BF9Ex95WfNBlCxcMv5BDRsWPsxIkXUDHEtxPQQbfLiVslHpi9/Pk/6uwSBK+S1rV21LZwTrE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2ZyidGGuvnjM4okEZCAiPhh8iCscD+6p3iF74Xthnu1+1r/Tf
	CanNzm1sn+EoG7aPNC5h4u2WPV7Bvc2D4UiUaYokSbbOkb/Ewnc+tJ5xJW2higLt8RA=
X-Gm-Gg: AeBDievkF0RLAPpisAFaRz96MOxsRs5cnJr6qA9+MK/0uHlMrI0YSFVsq+NdyqhUUNN
	TPhmb0+jb9zfnn/t+7xmWMoYn5X37+B74iM9cnHX0Wh/YTuRo0vPJ46fkPXFumUdYtAPAjQNDVp
	lOL18haXjmRCx2Z4K5KAaqcFAe6hCBA4pB8A+cVF+gh/bxoPdvPRv4A6/qufa9fOLsa31SmP4aN
	kYypEcgcC/IDKV1FLrXpnsLqoZrCw/lMNJR9nD55f5UIAM4Kyq91J1A2RwRUVy9YM/F8tPBBT23
	3TLOFMCk6B7zwkq1WQ9d6/Z6/gpxf3/Wvp07gbiASOw7vn0M1icujrZlqarxmjvzkEsNlBrmUtZ
	M0ANvw7VjHn7AhAwEqZc+tKGn7tOqI3VoXo8KIsyWC89WFp1fEqYcz6d/FKY3WK3aaPFEIthYDj
	rj1CpJnScTMLzvGwOgU4RXJMlsAqZr
X-Received: by 2002:a05:690c:39c:b0:7b8:926e:3ef4 with SMTP id 00721157ae682-7b9eced90e4mr285105677b3.17.1776976082479;
        Thu, 23 Apr 2026 13:28:02 -0700 (PDT)
Received: from localhost ([172.216.252.33])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7baf1cda83bsm50472457b3.5.2026.04.23.13.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 13:28:01 -0700 (PDT)
Date: Thu, 23 Apr 2026 23:27:54 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Guo Ren <guoren@kernel.org>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] perf dwarf-regs: s390: Fix an off by one bug
Message-ID: <aeqAypUUfE8jB7Uo@stanley.mountain>
References: <aenFGy9WDllTEO0S@stanley.mountain>
 <CAP-5=fVL_qishriDrRvvXQQ5VSBZAxs3F-HQ69yEtEzdf+6MMg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fVL_qishriDrRvvXQQ5VSBZAxs3F-HQ69yEtEzdf+6MMg@mail.gmail.com>

On Thu, Apr 23, 2026 at 01:24:50PM -0700, Ian Rogers wrote:
> On Thu, Apr 23, 2026 at 12:07 AM Dan Carpenter <error27@gmail.com> wrote:
> >
> > Change the > comparison to >= to prevent an out of bounds access of
> > the dwarf_s390_regnums[] array.
> >
> > Fixes: 1e452dd850f3 ("perf dwarf-regs: Add S390 perf to DWARF register number mapping functions")
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > ---
> >  tools/perf/util/dwarf-regs-arch/dwarf-regs-s390.c | 1 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/tools/perf/util/dwarf-regs-arch/dwarf-regs-s390.c b/tools/perf/util/dwarf-regs-arch/dwarf-regs-s390.c
> > index 310a37451bdc..f79216a7665a 100644
> > --- a/tools/perf/util/dwarf-regs-arch/dwarf-regs-s390.c
> > +++ b/tools/perf/util/dwarf-regs-arch/dwarf-regs-s390.c
> > @@ -45,7 +45,7 @@ int __get_dwarf_regnum_for_perf_regnum_s390(int perf_regnum)
> >         if (perf_regnum == 0)
> >                 return 0;
> >
> > -       if (perf_regnum <  0 || perf_regnum > (int)ARRAY_SIZE(dwarf_s390_regnums) ||
> > +       if (perf_regnum <  0 || perf_regnum >= (int)ARRAY_SIZE(dwarf_s390_regnums) ||
> 
> It looks like this mistake was copy-pasted into these files as well:
>  - tools/perf/util/dwarf-regs-arch/dwarf-regs-csky.c
>  - tools/perf/util/dwarf-regs-arch/dwarf-regs-x86.c
>  - tools/perf/util/dwarf-regs-arch/dwarf-regs-powerpc.c
> 
> Could you fix them all?

Sure.  Do you want that as four separate patches or just one patch with
four Fixes tags?

regards,
dan carpenter

