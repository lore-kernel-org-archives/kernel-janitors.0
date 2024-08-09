Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF9049643
	for <kernel-janitors@vger.kernel.org>; Fri,  9 Aug 2024 20:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723233707; cv=none; b=dYpOtxJ5FqpWWQoq+tJj2tGndHODGZ9h1bc5p3IgM02EXK3B24klxP1tU2OvEp4ESHQfJaTxELlzhAyGV0V8jSYFIqnmawpR5MQht3NO4SRJncFNn/lIjN467FjyGjvNjS0qxukqx5KAlakELODIwTa+FRm27W6MOMflnwkAWY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723233707; c=relaxed/simple;
	bh=TNLYKaOh+vXkzGubqpxPtUj8YBAHq2VsF1/p5ZbPDrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GR8j+JvaECXJSkyvC2ebOh+mfcwTct9T+Rl3lloWk16TDFRqnBNssrjvzR94ODHg72ZelaPrz9XsE0HLXekk9L3w7PDfFhOZPRksHB1AqFtEC/lmaId8DWWelX6AOKhzTtgvvnGTPL317+7BSQJxTdQUIkfy4VawqkNXHh60uwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=akdgBJIZ; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="akdgBJIZ"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5a108354819so3207194a12.0
        for <kernel-janitors@vger.kernel.org>; Fri, 09 Aug 2024 13:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723233703; x=1723838503; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KMUz/aPsGaSf3AR0ZEFloy0Ww3muXJ6eOj3CetN6o6E=;
        b=akdgBJIZpjyZS7QnEJfkRXvuNHjgeh+ItYaNR1DnLujQokt8AOG7cpumc415ZqeHbo
         RpK3z0nbaeupy9x4ByOOJCiTCkxCLiO710J+FSR9TuCq1qOB5WsXffIV59ethMTzRL2W
         BRBy280WyYzsm3Ue7nO4VMphrZE4UWxis+iKPP+RDQ4Onhl73wQ779KJLMBu44pS8dOt
         VSwgcKUoRJKxYJaiS8sfs2pj3nCEwjKlhvcWkX8nk/q2XcOfrbUgB6NvtYDAuGlCdUQA
         ElsahOwBzRv41ir3XFKH/9BXPp5ZlaGOxAS4fZi6wnrIR6FFVKodDTfdBrLyi0ZV5/F5
         yC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723233703; x=1723838503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMUz/aPsGaSf3AR0ZEFloy0Ww3muXJ6eOj3CetN6o6E=;
        b=P+AMphBdQgddps5C/zEiL0JS+yO1pOBZ5mYCvglqP7qcfirlNusC87QIw0i0SL80qN
         f+VHP4AEzG6Ax8W71OUkw3rx2mzulgmYh+sNymOeYDix8eEilTpGS6wY69kZGB7D1b3j
         mRUzlW3hdBgpdTLjZsNVoCJmxybUpDIDsiuEsFfraTb5zuZ0JEhFQML9pFrU2AIOL/w/
         ooEGO6cVAvB4kacvQIGhS3weR0O1SLfWfQTdngpwdVDILa+2ItqSww7RoZCm74DDei1d
         wfUGwLnAQh1dCwfpmZSSo3jpqtHZRHqY6SY4dtbB+0AxyVbP13qggq4NeAUxHcn/UprH
         O8SA==
X-Forwarded-Encrypted: i=1; AJvYcCVd6Z5APMnnESIZgTU8njShuD+zGsx+Tz/7XXq3Jx3ZMt/im3MjZy4k/xKuuf9vkBR6u7OllFa+DdxeIx9k2FmaXj+eV3VzcPqN07IpAftg
X-Gm-Message-State: AOJu0YwsfuAnasSe+7LS3ea1tnrtj2OLDsuWowM143w9alY+7Sawc5jy
	p3it0xrNhHFzGSTMFN76ZVl1AR9P0vX8C120pyujcd5k2G/pkoTgz0p41j4xxd+2IsvX565Km1V
	5
X-Google-Smtp-Source: AGHT+IFp6SPqZJvmY4Rp3COtc6Vyho6/Ic6I4+ja8ES14iyIMQ5Ho1Cxum8VvNzfD9FABxLcWUIK0w==
X-Received: by 2002:a05:6402:43cb:b0:5a1:7362:91d9 with SMTP id 4fb4d7f45d1cf-5bd0a56c918mr1327974a12.22.1723233703104;
        Fri, 09 Aug 2024 13:01:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd191a20fcsm58144a12.36.2024.08.09.13.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 13:01:42 -0700 (PDT)
Date: Fri, 9 Aug 2024 23:01:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Dev Jain <dev.jain@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: compaction_test: Fix off by one in
 check_compaction()
Message-ID: <20ad879e-689b-4b09-823c-4cb4f9b010e7@stanley.mountain>
References: <87470c06-b45a-4e83-92ff-aac2e7b9c6ba@stanley.mountain>
 <4c709253-50de-45ee-9cbf-8bed65eff857@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c709253-50de-45ee-9cbf-8bed65eff857@linuxfoundation.org>

On Fri, Aug 09, 2024 at 11:20:48AM -0600, Shuah Khan wrote:
> On 8/9/24 06:32, Dan Carpenter wrote:
> > The "initial_nr_hugepages" variable is unsigned long so it takes up to
> > 20 characters to print, plus 1 more character for the NUL terminator.
> > Unfortunately, this buffer is not quite large enough for the terminator
> > to fit.  Also use snprintf() for a belt and suspenders approach.
> > 
> > Fixes: fb9293b6b015 ("selftests/mm: compaction_test: fix bogus test success and reduce probability of OOM-killer invocation")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >   tools/testing/selftests/mm/compaction_test.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/mm/compaction_test.c b/tools/testing/selftests/mm/compaction_test.c
> > index e140558e6f53..2c3a0eb6b22d 100644
> > --- a/tools/testing/selftests/mm/compaction_test.c
> > +++ b/tools/testing/selftests/mm/compaction_test.c
> > @@ -89,9 +89,10 @@ int check_compaction(unsigned long mem_free, unsigned long hugepage_size,
> >   	int fd, ret = -1;
> >   	int compaction_index = 0;
> >   	char nr_hugepages[20] = {0};
> > -	char init_nr_hugepages[20] = {0};
> > +	char init_nr_hugepages[24] = {0};
> 
> Can we exceed this limit too? Can you make this a define?
> 

It's based on counting the digits in U64_MAX.

18446744073709551615X
123456789012345678901

We don't have any defines for that kind of thing.  It's not a bad idea.
#define STRLEN_U64_MAX 20
char init_nr_hugepages[STRLEN_U64_MAX + 1];

But it should be done as part of a kernel wide clean up and not part of this
buffer overflow fix.  The line above it could be changed as well, for example.
Let me create a KTODO and hope the internet will take care of it.

KTODO: create defines for STRLEN_[SU]8/16/32/64_MIN/MAX.

Btw, I rounded up to 24 just because I like buffer sizes that are divisible
by 4 but the compiler is probably going to do that automatically either way.

regards,
dan carpenter

