Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCF714F70
	for <kernel-janitors@vger.kernel.org>; Thu, 12 Feb 2026 17:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770918668; cv=none; b=Lb16YNSDZpPk86nj4h9NJK4OHsJA9Ce4qN4jaVieogoh6ReIMcET4E7+n+silT9x9yUbHga0kQO6lnekFVf50EHt2VHKMFixMnBH+jTFBtV+SUoN1wzRKkbGwm0bVLRZbiQpvy9p0tQPm5IggX9KLd2hmyX8mEANOHWqxYs6E5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770918668; c=relaxed/simple;
	bh=tVbscBlvX5MU2g7eUlmicDhpSLT1c7Ut0PUEhqLNj3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+zDgbu18VFoJc430xZ7AjWSHJq03pjYVUKy6kbF6DCqQqY7Aw0+3MHtrBlrUZeGAak+rqnm1GzvmbGYT+VkTvzTbB45W6ZpMpLthqDzcdla2Hl1ZLU2QSjPs5xOJIbEO3EGu+v55MI5eE02Hwn2TjHZEaB9JVybmUFFp8QNYH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WXohiu/c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WXohiu/c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8ABC4CEF7;
	Thu, 12 Feb 2026 17:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770918668;
	bh=tVbscBlvX5MU2g7eUlmicDhpSLT1c7Ut0PUEhqLNj3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WXohiu/cw0WFXN3JZsxH8Sn6Z84OMl1RNtywe32HxNJ551oHkNj5ag15e7F/H5Ixe
	 6/G+FbTC7tty1yd4L8STBsbinEQxtTC8+JAX+BPPvQZGN9mQWGgwSRe457m3WGUx7i
	 XSWCMlMuUi2t18x2MyKEsc6WVaIvKwrpBOcWAK2L+J2EeYPITg1Ls30JT95mZ4R3I8
	 E8L7tESZpXojzlKlRlxhmXJZoBj9eB2iABuuB5GSqYHlCWlmVyBYwghWua7GrKXt/U
	 ThWxO43c50S+5Codli85URNz84hekLsNx6lGvbGBE8vY7+0pF5uacU/7vM4qSGAU5s
	 jukPg3XSI2jRA==
Date: Thu, 12 Feb 2026 17:51:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Sean Chang <seanwascoding@gmail.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v3] riscv: fix various typos in comments and code
Message-ID: <20260212-rush-exclude-b292151e13a3@spud>
References: <20260212163325.60389-1-seanwascoding@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ALjf8vcF+BVGhfLH"
Content-Disposition: inline
In-Reply-To: <20260212163325.60389-1-seanwascoding@gmail.com>


--ALjf8vcF+BVGhfLH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2026 at 12:33:25AM +0800, Sean Chang wrote:
> Fix various typos in RISC-V architecture code and comments.
> The following changes are included:
>=20
> - arch/riscv/errata/thead/errata.c: "futher" =E2=86=92 "further"
> - arch/riscv/include/asm/atomic.h: "therefor" =E2=86=92 "therefore", "ari=
thmatic" =E2=86=92 "arithmetic"
> - arch/riscv/include/asm/elf.h: "availiable" =E2=86=92 "available", "coor=
espends" =E2=86=92 "corresponds"
> - arch/riscv/include/asm/processor.h: "requries" =E2=86=92 "is required"
> - arch/riscv/include/asm/thread_info.h: "returing" =E2=86=92 "returning"
> - arch/riscv/kernel/acpi.c: "compliancy" =E2=86=92 "compliance"
> - arch/riscv/kernel/ftrace.c: "therefor" =E2=86=92 "therefore"
> - arch/riscv/kernel/head.S: "intruction" =E2=86=92 "instruction"
> - arch/riscv/kernel/mcount-dyn.S: "localtion =E2=86=92 "location"
> - arch/riscv/kernel/module-sections.c: "maxinum" =E2=86=92 "maximum"
> - arch/riscv/kernel/probes/kprobes.c: "reenabled" =E2=86=92 "re-enabled"
> - arch/riscv/kernel/probes/uprobes.c: "probbed" =E2=86=92 "probed"
> - arch/riscv/kernel/soc.c: "extremly" =E2=86=92 "extremely"
> - arch/riscv/kernel/suspend.c: "incosistent" =E2=86=92 "inconsistent"
> - arch/riscv/kvm/tlb.c: "cahce" =E2=86=92 "cache"
> - arch/riscv/kvm/vcpu_pmu.c: "indicies" =E2=86=92 "indices"
> - arch/riscv/lib/csum.c: "implmentations" =E2=86=92 "implementations"
> - arch/riscv/lib/memmove.S: "ammount" =E2=86=92 "amount"
> - arch/riscv/mm/cacheflush.c: "visable" =E2=86=92 "visible"
> - arch/riscv/mm/physaddr.c: "aginst" =E2=86=92 "against"
>=20
> Signed-off-by: Sean Chang <seanwascoding@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ALjf8vcF+BVGhfLH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaY4TBAAKCRB4tDGHoIJi
0qx2APwLMPaOJdTCJZ77zwBCcoJxv1OCebheJ1jz+NzZZsQBPQD9GI14E6hJEgbP
qoq+dOR1vc4ktT34X8O8lg5uew2cfQ0=
=1pzJ
-----END PGP SIGNATURE-----

--ALjf8vcF+BVGhfLH--
