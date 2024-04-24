Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC1213CFAD
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Apr 2024 05:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713937305; cv=none; b=Hoy3eOyos7a6nPFT6i5MmMfvf2KiV5B3nHVPh1XVTADHMNJrqUEn3P/9/RQ6o7Yyfw1YhZDr6gh5uSY5rexXJudz0f/OlCucjZMGbdQDmRLTNd/crGyU6IBK00+YxuZpRm1i0qahz8cNsF+M25g6uvX7K7N0h/ubvc6Ltv1ldxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713937305; c=relaxed/simple;
	bh=IyElVXqzTyQ3aKo0ohOGapMAuFHTguATuxVWkpi0DWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C2K9H3NaCm1XMiEqTN0ASfTjpcQrKYVPH+7YG4WDa9oAapDBZN/Q2U/ef4nOupqxqDIJ0UTz7qN1s3wUMWTJJ6p5oK9dwl1PfK23jnQVt+GMRuShC+Uv8jZuMCAGLrEb3+oo0VXPiZZa33F9Of4Of76BA6CcEXBdvLGgZVYpGp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WFF4Abbs; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WFF4Abbs"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-34665dd7610so3293504f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Apr 2024 22:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713937302; x=1714542102; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2UrQ3g5twb3BBJ4fBE47g+swAJMT+h6KnPSpx3YI5X0=;
        b=WFF4Abbs7E16RYrXIM9ggmREHhJbrusKL6X9mFsx14GWvFMiCh6ldWscjhHj8fdzPE
         ywrAb//GYZmmfOFxKjCcb4rlpcQtwaKb0KKI3ByNMMNBm4Vq/USsto3jD+u6F/pu+/sp
         +ZDl7rQ52A/NdiSYOidzNNioSX3BEqtR0h8jWEMMwF0pupvnztvK6eWEM/kAEA1QC+fs
         Jrh5iamokbwh5PEz+p4sxn8eJ3ZFXrGnMxwpw68pzUjWwQOpuRlTdVDvSpwCOlYuabds
         mVRVTxk+bAoro99mgLOoVRAfKZiN+kr22ziT3B3Vp+qEe+MsLGL5XH9+Ndeq6g/8KjAG
         0Wig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713937302; x=1714542102;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2UrQ3g5twb3BBJ4fBE47g+swAJMT+h6KnPSpx3YI5X0=;
        b=qzs7lmGCtXVnk9ZDpZ+C7jdD0/3OagJOry6BZBfUS4K2XAuMv3JX+dweu8uzxbMYbn
         tRBQo486ol/8KPLxhs1mMrPRLxFhkkhF1u5yL2d5p7t2SsoORFf5JPvqbch0y+ig33C5
         1T/PaBvF1uwZCKC0g+pCwm+sWHGHUDTLKoOtF12yln0ON75KkAnpHNSmqREnmBSHuWM3
         J6wqWv7XHrJ+u4ei31jRkIHHtBqeigqE7LyKVt+D0BB2duT6IHzRo6O2DHSIAlzaATy6
         HxLvJZnQz1GkAXAQgnFwS90ETF4S1kAy7iER9fG1Z3/ASjLeQnqC7ucLLcovqICeTchR
         s5tA==
X-Forwarded-Encrypted: i=1; AJvYcCXr8YO5r+MPXbDmVTLNPr0fYDBNKrVuFMq3V7MQx31HIiruj+sDVdg4THg0FFVRrgpXDyyXMSHdvWNMXgwwH1w57RnzqeuaH4F0G4kyhOMN
X-Gm-Message-State: AOJu0Yz1dwTXFaqrRGI/fjcmyGiIj83sVk+19yS9QiT7zFBgUKVjH/La
	E1OAhfKlU84939XH6Y7HDdFwFMk5O7F/KxJ8Rl3J+UT4zux4cGRLnc2gNYrT8vo=
X-Google-Smtp-Source: AGHT+IGm3SzufQ8qmVUjMugp1zOSYoDMSOXVbTv38V7zcneIa30Z0wti+n3pHXkYuoPQi5lqYjjsjg==
X-Received: by 2002:a5d:4fc4:0:b0:348:1ee3:48fa with SMTP id h4-20020a5d4fc4000000b003481ee348famr846511wrw.47.1713937301787;
        Tue, 23 Apr 2024 22:41:41 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id l6-20020adfa386000000b00349e2fab2a2sm16376427wrb.12.2024.04.23.22.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 22:41:41 -0700 (PDT)
Date: Wed, 24 Apr 2024 08:41:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Markus Elfring <Markus.Elfring@web.de>,
	Kunwu Chan <chentao@kylinos.cn>, linux-kselftest@vger.kernel.org,
	kvm@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Kunwu Chan <kunwu.chan@hotmail.com>,
	Anup Patel <anup@brainfault.org>, Thomas Huth <thuth@redhat.com>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [PATCH] KVM: selftests: Add 'malloc' failure check in
 test_vmx_nested_state
Message-ID: <9f67df9d-ab27-40b9-8849-3069649dc082@moroto.mountain>
References: <20240423073952.2001989-1-chentao@kylinos.cn>
 <878bf83c-cd5b-48d0-8b4e-77223f1806dc@web.de>
 <ZifMAWn32tZBQHs0@google.com>
 <20240423-0db9024011213dcffe815c5c@orel>
 <ZigI48_cI7Twb9gD@google.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZigI48_cI7Twb9gD@google.com>

On Tue, Apr 23, 2024 at 12:15:47PM -0700, Sean Christopherson wrote:
> On Tue, Apr 23, 2024, Andrew Jones wrote:
> > On Tue, Apr 23, 2024 at 07:56:01AM -0700, Sean Christopherson wrote:
> > > +others
> > > 
> > > On Tue, Apr 23, 2024, Markus Elfring wrote:
> > > > …
> > > > > This patch will add the malloc failure checking
> > > > …
> > > > 
> > > > * Please use a corresponding imperative wording for the change description.
> > > > 
> > > > * Would you like to add the tag “Fixes” accordingly?
> > > 
> > > Nah, don't bother with Fixes.  OOM will cause the test to fail regardless, the
> > > fact that it gets an assert instead a NULL pointer deref is nice to have, but by
> > > no means does it fix a bug.
> > > 
> > > > > +++ b/tools/testing/selftests/kvm/x86_64/vmx_set_nested_state_test.c
> > > > > @@ -91,6 +91,7 @@ void test_vmx_nested_state(struct kvm_vcpu *vcpu)
> > > > >  	const int state_sz = sizeof(struct kvm_nested_state) + getpagesize();
> > > > >  	struct kvm_nested_state *state =
> > > > >  		(struct kvm_nested_state *)malloc(state_sz);
> > > > > +	TEST_ASSERT(state, "-ENOMEM when allocating kvm state");
> > > > …
> > > > 
> > > > Can “errno” be relevant for the error message construction?
> > > 
> > > Probably not, but there's also no reason to assume ENOMEM.  TEST_ASSERT() spits
> > > out the actual errno, and we can just say something like "malloc() failed for
> > > blah blah blah".  
> > > 
> > > But rather than keeping playing whack-a-mole, what if we add macros to perform
> > > allocations and assert on the result?  I have zero interest in chasing down all
> > > of the "unsafe" allocations, and odds are very good that we'll collectively fail
> > > to enforce checking on new code.
> > > 
> > > E.g. something like (obviously won't compile, just for demonstration purposes)
> > > 
> > > #define kvm_malloc(x)
> > > ({
> > > 	void *__ret;
> > > 
> > > 	__ret  = malloc(x);
> > > 	TEST_ASSERT(__ret, "Failed malloc(" #x ")\n");
> > > 	__ret;
> > > })
> > > 
> > > #define kvm_calloc(x, y)
> > > ({
> > > 	void *__ret;
> > > 
> > > 	__ret  = calloc(x, y);
> > > 	TEST_ASSERT(__ret, "Failed calloc(" #x ", " #y ")\n");
> > > 	__ret;
> > > })
> > 
> > Sounds good to me, but I'd call them test_malloc, test_calloc, etc. and
> > put them in include/test_util.h
> 
> Possibly terrible idea: what if we used kmalloc() and kcalloc()?  K is for KVM :-)

That's a legit terrible idea...  It probably would trigger more static
checker warnings because the general policy is kmalloc() is kernel code
and we *have* to test for errors.

To be honest, I would have just rejected the first patch.  You
obviously know this and have said this earlier in the thread but just
for the other people, this is a userspace test that runs for a short
time and then exits.  If it gets killed because we don't have enough
memory that's fine.  It would be better to just fix the static checker
to not print pointless warnings or educate people to ignore warnings
like this.

Creating the test_malloc() to silence the warning also seems like an
okay idea as well.

regards,
dan carpenter

