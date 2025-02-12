Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEF225A622
	for <kernel-janitors@vger.kernel.org>; Wed, 12 Feb 2025 18:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739384003; cv=none; b=AG+2pzyAZ5RBQ3/6I8w1wsL345EjWuyW5E950YUspBgnLTCoTE1IoTGSiIfZSwWEyHkvC7lrXRotseFlg5x1FNxbDX5+Fuobz0T1akY3DJaxvSRSvYbdnaNDqqKvGX0lIli3snMC01Bkx3GeF6YTHqz/R9AkJRFIcH1Ly06X8YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739384003; c=relaxed/simple;
	bh=4sXJG2YJbM1/CStfpqMsr2s3jCBVhr0rnW7eJJQV6W4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPIP81nvedBUFfOQ8DM/3EnK7RUb/aUiZQJ/UtzQOzG58vLAtihCVg70F6reMYS5+dPjgtVc9f+He31PphadDwTWKQui4p8wVUueUGn5Cpi5Mzl6EElA75FF1T5W6Cofz36jfVf321o6K8nkkbAAblR2ajAreYBil3ISTIJ+hKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FRvm6Zqu; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FRvm6Zqu"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab7c6fc35b3so608729866b.2
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Feb 2025 10:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739383996; x=1739988796; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T8yCP6ozgYyslEm6VKJ5cng9WS1x0StC3pzg7YSBGx8=;
        b=FRvm6ZquUjYg6PDj3iGEspV2BPLLEeffM27p2I4AtPtcfs0SsA8hAKpxD6nV0v8vqq
         emj5EPET3VajjNLqLHATy4nwOsrwNexSRYSpjKeVDGFNfkprfyqAZxEnqpJaqV5HEIU8
         vjKtcLivK1KU5cqhDcH866foJ0LLb0VaZEAHiO8RACMo26YpDrewpLgapGOxrAnHVzKM
         isoYRN0M7uK1zv/5LXalu99mFBovrciMfXjNTVvFcyCSczzurCNVuE0WZYijl0CSWD7z
         TohuIUo9x0KsNWnjlHBOm0leCKBiUUNmtbM9iUMC1WOcwvwRrHSkTOJduYUKUJVt+94P
         b5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739383996; x=1739988796;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T8yCP6ozgYyslEm6VKJ5cng9WS1x0StC3pzg7YSBGx8=;
        b=wXZ5Ibm/kqjvQ3dA0EoHYY8HdqHb/LEOHEeR01LsUXa7Enr0FjD3n6NO9mXdePOOFH
         xS4oVxbCgfZoLAWh99fCtLGUzMJVvDrCLwqBTPnDuaA/gEU1qQogKFRQS+AxpBmD4AsG
         zXa+B1pWaLKWiicptvoOgCb043T2Yk3wZFp1KVovR145wn5yXyA1rNgjQ9ndSeYFbNH2
         x9B80EcUcsCu2oHsYh4qwICBp8uQyw7w8Hw7nYcypzNke2/EQr9ZlUHl7CgKcP3shQAr
         TS0sv/FfKHUGn8+oWlfVa/AXhHGlj7elVFcN/hY/rpu8ssU5DrFk9HZLVgIzv0A3n466
         WJVA==
X-Forwarded-Encrypted: i=1; AJvYcCU2bGB1H60HPaxVXRsMOdRJDBG6eY228dzNE+SYgLmr4me0E50RkDjaNWI8lP5KFBpAerb1JCpk4GwYCsT3YXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzLn4uhsiUp4VxDB7FjidT8b7LqZtQHKMbswl9zPavIPnTG8aJ
	iJ1to0RkzfrEJ25qLSxT0OwIkwrDb7SO2ot0uLw5uRWyK5tuXC+3ac5irq+HBag=
X-Gm-Gg: ASbGncvk2azkYzk0YWdIEoeVcQdl32ubUJuN+HDlhkfosQYKcbAV5pILYWU5md0DVws
	hOFrUBUAPxd9DDk/neHuqOV8mgCxnzTp5mL3c57wTGfbTfooCmLUlIDyltIgTVlclD/YGnX1RYQ
	GjS0yBN93TWmG2pMUS9xi3mXqbzDf18ERcktnyoFG4fh0EsTzzKSuuRixFkjeJzRkouQuZCJmiV
	XLt8dytUPeBLrEEZuls0YNN2eubk65qhP0jILm032r8IDQDK8X/uKVMdHSPrvcig9ZsfdfvqMBt
	UUD22MY9HHyTpNveGNh9
X-Google-Smtp-Source: AGHT+IG2HpL+3tuCKjc/LoY0MW1A5tuWfeCaFrma02UBG8ZxcDcj01BZc9tF/YWR/ZTfEC32S+VCzw==
X-Received: by 2002:a17:907:7b86:b0:ab7:e16:aab7 with SMTP id a640c23a62f3a-ab7f3761d0amr410202566b.13.1739383996339;
        Wed, 12 Feb 2025 10:13:16 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab7b43ee08asm767846966b.88.2025.02.12.10.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 10:13:16 -0800 (PST)
Date: Wed, 12 Feb 2025 21:13:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank van der Linden <fvdl@google.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] x86/mm: Fix uninitialized variable in
 register_page_bootmem_memmap()
Message-ID: <bde447d5-0a2f-4c65-97e3-5439b67ab2f2@stanley.mountain>
References: <1aa70a33-2acd-49fb-8049-a20dae40ecba@stanley.mountain>
 <CAPTztWahPK5MLTxMnGH8woe1emM=QA=3pjy1ZCBBG+D39aLGog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPTztWahPK5MLTxMnGH8woe1emM=QA=3pjy1ZCBBG+D39aLGog@mail.gmail.com>

On Wed, Feb 12, 2025 at 09:59:54AM -0800, Frank van der Linden wrote:
> On Wed, Feb 12, 2025 at 7:21 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > Smatch complains that "next" could be uninitialized.  The "next"
> > assignment was accidentally left out when we moved these lines to earlier
> > in the function.
> >
> > Fixes: bdadaec1526d ("x86/mm: make register_page_bootmem_memmap handle PTE mappings")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > This goes through the -mm tree.
> >
> >  arch/x86/mm/init_64.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
> > index e7572af639a4..6e8e4ef5312a 100644
> > --- a/arch/x86/mm/init_64.c
> > +++ b/arch/x86/mm/init_64.c
> > @@ -1600,8 +1600,10 @@ void register_page_bootmem_memmap(unsigned long section_nr,
> >                 get_page_bootmem(section_nr, pud_page(*pud), MIX_SECTION_INFO);
> >
> >                 pmd = pmd_offset(pud, addr);
> > -               if (pmd_none(*pmd))
> > +               if (pmd_none(*pmd)) {
> > +                       next = (addr + PAGE_SIZE) & PAGE_MASK;
> >                         continue;
> > +               }
> >
> >                 if (!boot_cpu_has(X86_FEATURE_PSE) || !pmd_leaf(*pmd)) {
> >                         next = (addr + PAGE_SIZE) & PAGE_MASK;
> > --
> > 2.47.2
> >
> 
> Thanks for catching that Dan. I believe Andrew took the series out of
> mm-unstable because of some conflicts, and asked me to do a v4 for
> mm-unstable. Would you mind if I just folded your change in to the v4
> series?

Yeah, no problem.  -mm patches are always folded.

regards,
dan carpenter

