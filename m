Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58891D5170
	for <kernel-janitors@vger.kernel.org>; Wed, 11 Feb 2026 17:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770829542; cv=none; b=RcAmVEA3veCju5yPYZJJ9TzZyqAC7gpvGaX08+FsvUebwKyr5U04YzmVE5niuxNCUJX5NSlGnDEhVnKZAV8HVJMijac0K1rUEBToGIczSHUainBdbud5EVkMJvUgqJyT7xdYmsyfgVNt25J28Ks5q7FomyGwajRxAkvfXYfPwIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770829542; c=relaxed/simple;
	bh=t7CI+yj3Fr5Xqkb8J8nWZldkzPof4joyVukHWqtE9vI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=go7VJoky1WJOud+37GAXk1cCZuanEFdkUqag+6dXgIR+ZTGv5tJ0x6VrKH10SIIFMlyncVCxU41xfn4XHpVbqU+kN7GcN/uVyYIdrLPratZA38CVltFHF7M6Xz9zTQDxXGLV98mloCFzpIKV1GnvoXuIFxQkBUl04qYbo0iLYaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LDJ2Q9mu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LDJ2Q9mu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BD29C4CEF7;
	Wed, 11 Feb 2026 17:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770829542;
	bh=t7CI+yj3Fr5Xqkb8J8nWZldkzPof4joyVukHWqtE9vI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LDJ2Q9muRduA6UjMgMHcWcTGrl6hrRRTbQkNLH18mLWWixEjNqzXZCFC08CJH/McZ
	 rxdtZ3OzsogjZXZk1PBvHtO301cf2jwPya8cEQhG43jWNBiB2E/84El3GjQWERGrjl
	 rDPyMEgGa3kAzGlSu1UjSibPM+3W2fEKjmg4lcdnvsIVfYPXaceMGzOcazOyPq8yZQ
	 Ph8RIIW7yQ+UEqXzysr0lO2QQy5D1Vkc+SAHfXuoEVULQpkrBID9Pvgc8X+YTqHQMn
	 03xLjJJ3RJR3zpqNXwxqnkbmiO8Ny6O9i5cU5KT9Suqaeqf845p5dgZwbWrUJtRmmD
	 pf/Z9WqxVuovg==
Date: Wed, 11 Feb 2026 17:05:39 +0000
From: Conor Dooley <conor@kernel.org>
To: seanwascoding <seanwascoding@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] riscv: fix various typos in comments and code
Message-ID: <20260211-trash-eldest-aebdecd512c4@spud>
References: <20260211165827.78574-1-seanwascoding@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C1psYPQDO/Em2GeW"
Content-Disposition: inline
In-Reply-To: <20260211165827.78574-1-seanwascoding@gmail.com>


--C1psYPQDO/Em2GeW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 12:58:27AM +0800, seanwascoding wrote:
> Signed-off-by: seanwascoding <seanwascoding@gmail.com>

You need to add a commit message body and use your full name
in the author field.

> ---
>  arch/riscv/errata/thead/errata.c     | 2 +-
>  arch/riscv/include/asm/atomic.h      | 4 ++--
>  arch/riscv/include/asm/elf.h         | 2 +-
>  arch/riscv/include/asm/processor.h   | 2 +-
>  arch/riscv/include/asm/thread_info.h | 2 +-
>  arch/riscv/kernel/acpi.c             | 2 +-
>  arch/riscv/kernel/ftrace.c           | 2 +-
>  arch/riscv/kernel/head.S             | 2 +-
>  arch/riscv/kernel/mcount-dyn.S       | 2 +-
>  arch/riscv/kernel/module-sections.c  | 2 +-
>  arch/riscv/kernel/probes/kprobes.c   | 2 +-
>  arch/riscv/kernel/probes/uprobes.c   | 2 +-
>  arch/riscv/kernel/soc.c              | 2 +-
>  arch/riscv/kernel/suspend.c          | 2 +-
>  arch/riscv/kvm/tlb.c                 | 2 +-
>  arch/riscv/kvm/vcpu_pmu.c            | 2 +-
>  arch/riscv/lib/csum.c                | 2 +-
>  arch/riscv/lib/memmove.S             | 4 ++--
>  arch/riscv/mm/cacheflush.c           | 2 +-
>  arch/riscv/mm/physaddr.c             | 4 ++--
>  20 files changed, 23 insertions(+), 23 deletions(-)

> diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
> index c7aea7886d22..04bc662cabbb 100644
> --- a/arch/riscv/include/asm/elf.h
> +++ b/arch/riscv/include/asm/elf.h
> @@ -59,7 +59,7 @@ extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
>  #endif
> =20
>  /*
> - * Provides information on the availiable set of ISA extensions to users=
pace,
> + * Provides information on the available set of ISA extensions to usersp=
ace,
>   * via a bitmap that coorespends to each single-letter ISA extension.  T=
his is

You missed one in this line.

>   * essentially defunct, but will remain for compatibility with userspace.
>   */
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/=
processor.h
> index da5426122d28..c571c276b2e9 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -85,7 +85,7 @@ struct pt_regs;
>   *    preempt_v. All preempt_v context should be dropped in such case be=
cause
>   *    V-regs are caller-saved. Only sstatus.VS=3DON is persisted across a
>   *    schedule() call.
> - *  - bit 30: The in-kernel preempt_v context is saved, and requries to =
be
> + *  - bit 30: The in-kernel preempt_v context is saved, and requires to =
be

"requires to be" should be "is required to be", no?



--C1psYPQDO/Em2GeW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYy2xwAKCRB4tDGHoIJi
0uWrAP99CzaD/fkJqMJWZtvGcN5LM68bYJWGd6jrNR6YnAmMZAD+NDtSQR34uRqo
OWnQ2gZFKRXZwqtQGGO2L7xvDxjEWQg=
=Uc+8
-----END PGP SIGNATURE-----

--C1psYPQDO/Em2GeW--
