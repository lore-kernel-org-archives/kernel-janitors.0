Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB34C15ECDE
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Apr 2024 14:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713970307; cv=none; b=YpD2156jen9LTvz4dsOh8gC9BKU4kAxGu0IkuLOH7tqnUZ2aAh3A43YfYAEkvs2W+nJ4yKOvDENEuEiaWKxmNy14iycBgvhR+fRlRvK1XxALNimqsGGVus+hnqRKfrW308rynbb+gVD4SzTzDQLiaESevZMiIgiK4qWf9UOjyVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713970307; c=relaxed/simple;
	bh=L5PgwQXqh35ljEV/QfjmAhY+dATTVZXtCGt9GLB66PA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T5/RTTS3lQYMyH2eICiIrGvF3ISEew9QUdtq1geZi+gGyCID8P9GPK4UqdK6/iB0VWaBz9ZYo+zm7TN1fHWsv4Wj8HHOoqljTV52/rlCgIT+7pyYiS29SGjeJFUAtXIiJdVCjAF7Y30u+nAAeFZAVxCk/F1iVPXwxEezdKtv6K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X78OGA4f; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X78OGA4f"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ae9176aad8so2277878a91.2
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Apr 2024 07:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713970306; x=1714575106; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CI1RTUkbvNrBSkw+K5Z39nzZbpfRzSvThM/4gtY5VFY=;
        b=X78OGA4fwe0/X+KjwaAwYyNgu+35YHb0vTrhK7LdBdREAUTNLhIidK7p4XiJuHKZ81
         Qe/87ErcEWReDflfs7bIzsVt8t5zNZzeBfw4zdxhfh9YONQwgcD/95LmhAVah6txl0mi
         36cPnqW0mIY3wfpor/TJA36iN1JfTlMEKwzLZK5Crw+cDWAwgHbElwzwtZnyOnfRHuvg
         RaQCcXFzJJ9d8yq2m6ctIQf0CRfonqe+1BAquEjLISrBJKbcIP6NnR26/6cROr4UHIm5
         dj+Jf1P/mmlbKwOPEwO4t0tvn0q6NqL9AvZ3Yf1Zfrbl4/asZ5wi2wzaJ/e5Zkngj83/
         nKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713970306; x=1714575106;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CI1RTUkbvNrBSkw+K5Z39nzZbpfRzSvThM/4gtY5VFY=;
        b=pUFmgn5bXl8zek6lu9d2e1wNFwq0tsyfiZp13FgSfLVk4iupQZBPtXq6NOIPzERhsX
         MFaH41SknVFGPN1RxpV18Nc4TXOaUl+fgn2vei+tEkOzPw8F109CxiXuPz3xhedtJ2sp
         zNBQVaRCfhe0nZPXixsv+UYmgQLBAVyVf9Kj7gzFFh9ohoCvOxAMPxRWCxCJA2xRGspC
         9/W+r7zVCjHgOL7AcnzfOhOIi/Mb0Xc56HM+ehy9MOGI0h8SpIGmBhUSJ1UYzYwD0REr
         8/GNF18Gq51jsmGC09p/BQMm+aeFi52Jfh9kb81ZuYsQt5N6zjg8L/j9eBzRRT0Y4cXg
         SFBg==
X-Forwarded-Encrypted: i=1; AJvYcCWhlBme9EiTROlVKS6uZyNImjns/5OXZxH99cOaB9OC+lJGPj39DNh8iwoKAMDcZ6AOuqhp0Lmfn959yGewD9fCPUGw132beEcdnTn+Zq3P
X-Gm-Message-State: AOJu0YwPC7TdGngrMfkeclLBDQQP68ZvRD0t5yZt0pgN7m/A7iJyEA4i
	pisalXkjrrV1REG1ax8oycFH5H2u8psCRqKwthh9DdtOMLbvu6VwjGRY7pidxptdFenPGp3qAan
	53Q==
X-Google-Smtp-Source: AGHT+IEkGEBGl103CCfB1x44lCEAhqJw73hICMcBVrYM5jo0ROCAmB4Ygu81wDS3jT7KCqkV6HSuf6vVHaE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:9f8d:b0:2ae:cb7e:b5b3 with SMTP id
 o13-20020a17090a9f8d00b002aecb7eb5b3mr10285pjp.6.1713970305856; Wed, 24 Apr
 2024 07:51:45 -0700 (PDT)
Date: Wed, 24 Apr 2024 07:51:44 -0700
In-Reply-To: <20240424-e31c64bda7872b0be52e4c16@orel>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240423073952.2001989-1-chentao@kylinos.cn> <878bf83c-cd5b-48d0-8b4e-77223f1806dc@web.de>
 <ZifMAWn32tZBQHs0@google.com> <20240423-0db9024011213dcffe815c5c@orel>
 <ZigI48_cI7Twb9gD@google.com> <20240424-e31c64bda7872b0be52e4c16@orel>
Message-ID: <ZikcgIhyRbz5APPZ@google.com>
Subject: Re: [PATCH] KVM: selftests: Add 'malloc' failure check in test_vmx_nested_state
From: Sean Christopherson <seanjc@google.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, Kunwu Chan <chentao@kylinos.cn>, 
	linux-kselftest@vger.kernel.org, kvm@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Kunwu Chan <kunwu.chan@hotmail.com>, Anup Patel <anup@brainfault.org>, 
	Thomas Huth <thuth@redhat.com>, Oliver Upton <oliver.upton@linux.dev>
Content-Type: text/plain; charset="us-ascii"

On Wed, Apr 24, 2024, Andrew Jones wrote:
> On Tue, Apr 23, 2024 at 12:15:47PM -0700, Sean Christopherson wrote:
> ...
> > I almost wonder if we should just pick a prefix that's less obviously connected
> > to KVM and/or selftests, but unique and short.
> >
> 
> How about kvmsft_ ? It's based on the ksft_ prefix of kselftest.h. Maybe
> it's too close to ksft though and would be confusing when using both in
> the same test?

I would prefer something short, and for whatever reason I have a mental block
with ksft.  I always read it as "k soft", which is completely nonsensical :-)

> I'm not a huge fan of capital letters, but we could also do something like
> MALLOC()/CALLOC().

Hmm, I'm not usually a fan either, but that could actually work quite well in this
case.  It would be quite intuitive, easy to visually parse whereas tmalloc() vs
malloc() kinda looks like a typo, and would more clearly communicate that they're
macros.
