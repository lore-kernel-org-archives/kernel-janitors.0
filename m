Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2AA745F0
	for <kernel-janitors@vger.kernel.org>; Fri, 31 May 2024 07:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717141689; cv=none; b=W6/dIXrEPuYkkjIriy4zP/bPAL/L3iBHWWxvuajil71pPO70HTHKrAOh1E/heCtbhKQBkJMwOaGyBz3qL4Y6oDpoWMvkFBPMx8LpKFIqwl2L3Dq8RLdEw7byySb80mVnC6fVJ5Wk4myX0ojwcPJY+ss2/D+aTJLqupfVCNdR0Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717141689; c=relaxed/simple;
	bh=x9dpYpK4KV2Cwmi70K5k5sjxw79jDI92Nquuca//MEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WH87h7gF2zFGQji7JueP6hCJoMbOC7U+y1/cSHZEUn/EqozCcdNLTGwzXRzAW8DLJjmCfWH7hPlp9Jxy857DkBa1BSVXfowstIDg6od86aChNr3+n1X5Unu1P94AD7W8L/b5KJ2DgtUmmXzIMepMvaJE7sAoMOX/3nJiT4RO6zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A7LCwY4T; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A7LCwY4T"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-80ad0bb602eso416930241.1
        for <kernel-janitors@vger.kernel.org>; Fri, 31 May 2024 00:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717141687; x=1717746487; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aSaCVUi0zQXquWS21+Fh+LLppuApoIxo0HCn/IZS3vI=;
        b=A7LCwY4TjUDlFyoSAnaSZRNtcV7lrcneuLQJmlgEZka5xKZsIUefdNML0CJY6H7gbv
         ujHV9q0SbSPuqXzn+8P17TVUEzjzch81TL5ePNGQ/ebAZlCCperEZY2ddpz9VTJd4/yI
         foTBJ1KnLLs936ESy7avxBAg0PxxXjukt48R9/bCHfKdbVYFLToiiizniVDKWdm+mLTn
         yoJXWCT6wuVrjqNM6mG2u/RC0Rw+VAOYKWJsKVVBe70CIDsc+DlSaalVN59XEp186Jzl
         twil0/4omLp1U5mpUKiQdMz6pEGP7PA8u4rwJCi4Qjrji9YHItVbIg+Kag/QQd+L4zcp
         gWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717141687; x=1717746487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aSaCVUi0zQXquWS21+Fh+LLppuApoIxo0HCn/IZS3vI=;
        b=Xli/6wwhrrqJEAjOduNcHoylw5FCVH4cs5qwMtJQbIkV0q2XcMkaU6PYdAqJG91Dvj
         zlQM3B7TN5RBlGrE/R/QB7XaikVO5ZiHr6WZeCPg4LNdZ7325gm+RNRrsjytHjrlt/1s
         MNcuNr2HAA9LuPl1QHso2m+EAQut2G/96P9K4NKzo3UM8YOxRJUCOfnEdfrzGPYSUNHv
         W6PJIHaI1ZH3tnF+ZOpVaNwS8NhEhO5lFhWg0rcrC5OJJyOYPLaaFtVmaEbutlY8wOz0
         /DK1dVKZNLHDc9+jBU65Glk703TG4fqETZZrP24EHnWDiklAmtGpZ23EiDdSPn12WHwq
         huSg==
X-Forwarded-Encrypted: i=1; AJvYcCUAS1GNGln2wbXSS7mCn4nWUPpIwu92Os01hnPZSHBw4Q2M5ejUb/0QXAvaMvo2W+eW8GhvuQdgtZTyfuPkvGhTB99rIuImOXoWzAgjx6HT
X-Gm-Message-State: AOJu0YwmnlVbNR7ym48GmRkw4Ua1uZvuPITXEv6qaUH+lRbM6MIUzEm5
	Shi7El+ZxBFiiYIfUkAmbkfKJBXonfZdtQ8y4M+laieRYz0tPVtA3fW2K2PcdT+tFZqpKUF/Jwz
	j9xx99nmRHLWvE7szQGiB5LiZ+7evgtEojqVE
X-Google-Smtp-Source: AGHT+IFwbl7LCe7uZITUbsbpr+vTZ/z7OBOUdW9jr0RrzbVMGpMRPXRbZdWgTCObtq06JDZKBnuF3wcxqsOgZOEZOx8=
X-Received: by 2002:a67:f655:0:b0:47b:a00c:4680 with SMTP id
 ada2fe7eead31-48bc2370c46mr1125258137.32.1717141686612; Fri, 31 May 2024
 00:48:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530-md-kernel-kcsan-v1-1-a6f69570fdf6@quicinc.com>
In-Reply-To: <20240530-md-kernel-kcsan-v1-1-a6f69570fdf6@quicinc.com>
From: Marco Elver <elver@google.com>
Date: Fri, 31 May 2024 09:47:27 +0200
Message-ID: <CANpmjNN1qf=uUnetER3CPZ9d5DSU_S5n-4dka3mDKgV-Jq0Jgw@mail.gmail.com>
Subject: Re: [PATCH] kcsan: test: add missing MODULE_DESCRIPTION() macro
To: Jeff Johnson <quic_jjohnson@quicinc.com>, "Paul E. McKenney" <paulmck@kernel.org>
Cc: Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 May 2024 at 21:39, Jeff Johnson <quic_jjohnson@quicinc.com> wrote:
>
> Fix the warning reported by 'make C=1 W=1':
> WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/kcsan/kcsan_test.o
>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Reviewed-by: Marco Elver <elver@google.com>

Jeff, do you have a tree to take this through?
If not - Paul, could this go through your tree again?

Many thanks,
-- Marco


> ---
>  kernel/kcsan/kcsan_test.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/kernel/kcsan/kcsan_test.c b/kernel/kcsan/kcsan_test.c
> index 0c17b4c83e1c..117d9d4d3c3b 100644
> --- a/kernel/kcsan/kcsan_test.c
> +++ b/kernel/kcsan/kcsan_test.c
> @@ -1620,5 +1620,6 @@ static struct kunit_suite kcsan_test_suite = {
>
>  kunit_test_suites(&kcsan_test_suite);
>
> +MODULE_DESCRIPTION("KCSAN test suite");
>  MODULE_LICENSE("GPL v2");
>  MODULE_AUTHOR("Marco Elver <elver@google.com>");
>
> ---
> base-commit: 4a4be1ad3a6efea16c56615f31117590fd881358
> change-id: 20240530-md-kernel-kcsan-9795c9551d3b
>
