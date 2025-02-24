Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A116A156677
	for <kernel-janitors@vger.kernel.org>; Mon, 24 Feb 2025 15:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740412669; cv=none; b=OQsF4fLYrYZYJDPMtYPuJdExRotRix1zmdKtHFvSU6MyKvgxevLJHKrE+Pa37n0xiAQjBG+NRVi4kRHTVRQBK2CgjLLzK4bGKHN3aCZlAB2XJ3oszkmL+BShszk4ozr+a3cF4CHn0hpl9WipPApezePhe8IkU18y58QuBTn+Pqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740412669; c=relaxed/simple;
	bh=2t59lsYG4BqwtnauANqi9S05hHamW9pvVdmQnLPMB5Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VhOS6u6tv7p1U4P9FloO0VnSOlat9J55VVoYwI2BMY1bBm1goPeKDZ4a8uKAeF+H/ayE9+UXZERF9wZAbMDZxAnienSHRll7/6sCLHd+AYEhNpdrPdXBe1nmypgmxFXamPz3mP/iMMEUbHnGB32ywlx8GkMmnFKj5075LD2MAsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DE07uZ97; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DE07uZ97"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-220cd43c75aso145376705ad.3
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Feb 2025 07:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740412667; x=1741017467; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ql4hG9y/ji9r+lB2NHuF+yH9db63u51S51cV8RgKCFE=;
        b=DE07uZ97SuDwFBiE6d6ieELH7EE7tkAGbtQcdsA5/fgNCHpljX/n7PprNLq9HmdZEV
         9lKewl967RJwkFOtYu2LPTlz2kxEPbKwlokH6qAguYmk7DVk0WlzRHO/E5Vf43YZxQpz
         9obzG/cDXlr1u84xcEVi3REMX9bRQPC5lAnfIbLRcnVw95xgENHKETMKpzETCnxpIREJ
         ccGFHCNPic6xdlbEXrKcVuEbGdmVVss2KkL3aKRQ1hSiNZ9hL1E6ZGe7dCCw7YcIeZ5G
         Uy1H1a7R2T6W5ZyZKOmCHE4RvS1rpWjviENtY4Hc9xC+Hqyt+HtC0jmd1H6dawlOhh4f
         hW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740412667; x=1741017467;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ql4hG9y/ji9r+lB2NHuF+yH9db63u51S51cV8RgKCFE=;
        b=MZPZBwWrcPtgivmqUJJuyj8VYiZHwwM73bSHz46B35UBT0pxj3Zit9QGVEh1zYnuyg
         nlUK9kaKk8DCo5QCuwCQ15psyUArXFYVZUMWOdf4xdUZnRGMJpFzQvoiy6+Deo8PRXtF
         LkWeg2h1zz/wCDkNTrN0lOKU4iDBjwF4BkhX5Nl7OOQs/xwHVPglqDO66uI0igl3Qun6
         Fh/qdKoqQeCbOAUyHul5L8lbhI9mUk+/j5SCUlnTsK/zRG/hNo8raxQfFuyKX5PRvCHw
         h6axm5z1OImiVpt1XMK4Ud0eO7o6+O1QeFF1fHJE7oiaran87RZxMegKSwLkFO9d1dcK
         evOw==
X-Forwarded-Encrypted: i=1; AJvYcCUBxJxI72DtW/C+wK7mYmIsrivjvZhkBVb1GCQPbNju15Z3GOsO4Cv9t7Bol58g0d6ztwuZxImE46weLq9B5nY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEqnGkE+tNOqlxJBzxaVEzAYbzKsjqFe79g6YSbi6kv6vJtuLK
	yV4hLqMP9VafdwTgQHfouV3Yg5U5nM0W5eGVJ9a2DEUaIF7QuWSEuYkNZ5V0L+Yv1dlIcdQWQUZ
	AjA==
X-Google-Smtp-Source: AGHT+IFkxCGkRNpNw+UlQYXfNBv6PhblpOoOHAO6bny9WcoQpJVMrpTux0exDkoFpvccE+QSh69xIrDiPgM=
X-Received: from pfbhx1.prod.google.com ([2002:a05:6a00:8981:b0:732:5b2e:4735])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4f88:b0:730:a40f:e6ce
 with SMTP id d2e1a72fcca58-73426d85439mr18693077b3a.17.1740412666826; Mon, 24
 Feb 2025 07:57:46 -0800 (PST)
Date: Mon, 24 Feb 2025 07:57:45 -0800
In-Reply-To: <20250221071624.1356899-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250221071624.1356899-1-suhui@nfschina.com>
Message-ID: <Z7yW-aNXV1sK6eQN@google.com>
Subject: Re: [PATCH] include/linux/log2.h: mark is_power_of_2() with __always_inline
From: Sean Christopherson <seanjc@google.com>
To: Su Hui <suhui@nfschina.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: binbin.wu@linux.intel.com, pbonzini@redhat.com, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

+Andrew

On Fri, Feb 21, 2025, Su Hui wrote:
> When build kernel with randconfig, there is an error:
>=20
> In function =E2=80=98kvm_is_cr4_bit_set=E2=80=99,inlined from
> =E2=80=98kvm_update_cpuid_runtime=E2=80=99 at arch/x86/kvm/cpuid.c:310:9:
>=20
> include/linux/compiler_types.h:542:38: error: call to
> =E2=80=98__compiletime_assert_380=E2=80=99 declared with attribute error:
> BUILD_BUG_ON failed: !is_power_of_2(cr4_bit).

Andrew, do you want to grab this?  Looks like you've taken the last few cha=
nges
to log2.h, and KVM isn't the only subsystem that expects is_power_of_2() to=
 yield
a compile-time constant; taking this through the KVM tree feels wrong.

  arch/x86/kvm/kvm_cache_regs.h:	BUILD_BUG_ON(!is_power_of_2(cr0_bit));
  arch/x86/kvm/kvm_cache_regs.h:	BUILD_BUG_ON(!is_power_of_2(cr4_bit));
  arch/x86/kvm/x86.c:	BUILD_BUG_ON(!is_power_of_2(ASYNC_PF_PER_VCPU));
  drivers/net/ipa/gsi.c:	BUILD_BUG_ON(!is_power_of_2(GSI_RING_ELEMENT_SIZE)=
);
  drivers/vfio/pci/virtio/legacy_io.c:	BUILD_BUG_ON(!is_power_of_2(virtvdev=
->bar0_virtual_buf_size));
  kernel/kcov.c:		BUILD_BUG_ON(!is_power_of_2(KCOV_WORDS_PER_CMP));
  mm/sparse.c:	BUILD_BUG_ON(!is_power_of_2(sizeof(struct mem_section)));
  mm/swap_cgroup.c:	BUILD_BUG_ON(!is_power_of_2(ID_PER_SC));

> '!is_power_of_2(X86_CR4_OSXSAVE)' is False, but gcc treats is_power_of_2(=
)
> as non-inline function and a compilation error happens. Fix this by marki=
ng
> is_power_of_2() with __always_inline.
>=20
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  include/linux/log2.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/linux/log2.h b/include/linux/log2.h
> index 9f30d087a128..1366cb688a6d 100644
> --- a/include/linux/log2.h
> +++ b/include/linux/log2.h
> @@ -41,7 +41,7 @@ int __ilog2_u64(u64 n)
>   * *not* considered a power of two.
>   * Return: true if @n is a power of 2, otherwise false.
>   */
> -static inline __attribute__((const))
> +static __always_inline __attribute__((const))
>  bool is_power_of_2(unsigned long n)
>  {
>  	return (n !=3D 0 && ((n & (n - 1)) =3D=3D 0));
> --=20
> 2.30.2
>=20
