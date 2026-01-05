Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA648207A32;
	Mon,  5 Jan 2026 20:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767646247; cv=none; b=WIHWMuH2EC4en9i9+r15jbQS9c0Cl+gDOD4s3tE4C0F2dl4Nsl+rlBZLUj/KFv+uLqSuqNeNu/9lUPNkOg5B3Su11zUkPF3mgBFL3Cn7Ol5BQA0Ikt42a4wBN0+b2PDMBFDVRns2qTNwIwPFmvuTZH7DcxchoHYWvcKgUMTQ0qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767646247; c=relaxed/simple;
	bh=StZ+laIIWUpzjNiZmWa66KU0AI8ALEKo0e8HnuDDwLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UR3LYLRj7IWlPWrli0IftHg4kdFzy5SkexvBX6iOvjWCI2G3ias3JFhLvYewcw8kyVvILJvOQJ2HS+32dDnSuVhx3hH385VB7OAHU+Qna5RjQGJekKZ4k4kZI/LBky/liw+NDv6X9vSCqpyhK6/Aw7eWBGj2N/PJPd/xElIhJEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cUjV/ZZ5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cUjV/ZZ5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E772C116D0;
	Mon,  5 Jan 2026 20:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767646246;
	bh=StZ+laIIWUpzjNiZmWa66KU0AI8ALEKo0e8HnuDDwLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cUjV/ZZ50vLDuim+vLOZ2fezLm8yKeLgcIqy+ugbNGlKCUo6pIbJ2NEXGDOXukhnF
	 fpoH5c20r9DPSBEdlpbjMu9fUkH9tEGYSxFRceaayEmDD9T+xidm7kyLMc6B5ydXBM
	 joCYfYOaDtVQQI5aaEtNPzqPOyx4ygksZrjVQWvjok4EwD8lKKzMkMBujO0aQhXf6j
	 3hySEkp4lQx46+sOADoB4bFMVDoQnKFKX1O30La9013C9mcY3WNA+rYwg2CBOS5eqS
	 Q+i0FsFOahdzt6VQOONeD8g8DEifMu9ec2BN1iyZz5PgSKycj5ndXVHwo1WhCfJcsH
	 +vJBW13pocZOw==
Date: Mon, 5 Jan 2026 20:50:41 +0000
From: Will Deacon <will@kernel.org>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Kees Cook <kees@kernel.org>, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>, maz@kernel.org
Subject: Re: [PATCH] arm64: Kconfig: deprecate redundant ARM64_USE_LSE_ATOMICS
Message-ID: <aVwkIYMyoe7OpeUh@willie-the-truck>
References: <20251223110730.121239-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223110730.121239-1-lukas.bulwahn@redhat.com>

[+Marc]

On Tue, Dec 23, 2025 at 12:07:30PM +0100, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Currently, the config options ARM64_USE_LSE_ATOMICS and ARM64_LSE_ATOMICS
> are equivalent, i.e., ARM64_LSE_ATOMICS is true if and only if
> ARM64_USE_LSE_ATOMICS is true.
> 
> Prior to commit 395af861377d ("arm64: Move the LSE gas support detection to
> Kconfig")---included in v5.6-rc1---only the config option ARM64_LSE_ATOMICS
> was defined, and the check for gas support was done in the Makefile. This
> mentioned commit then introduces the config option ARM64_USE_LSE_ATOMICS to
> be the promptable option, and changes the semantics of ARM64_LSE_ATOMICS to
> check for the gas support.
> 
> Note that there is then some minor refactoring in commit 2decad92f473
> ("arm64: mte: Ensure TIF_MTE_ASYNC_FAULT is set atomically"), putting this
> gas support check into its own config option AS_HAS_LSE_ATOMICS, but the
> logic remains the same. Since every binutils version defined suitable for
> kernel compilation then eventually included the required support, the
> config option AS_HAS_LSE_ATOMICS and the dependency was dropped with
> commit 2555d4c68720 ("arm64: drop binutils version checks"). This then
> makes ARM64_USE_LSE_ATOMICS and ARM64_LSE_ATOMICS equivalent. Hence, one
> of the two config options can be dropped now.
> 
> Considerations for the decision which config option to drop:
> 
>   - ARM64_USE_LSE_ATOMICS is promptable by the user since its introduction
>     in 2020. So there might be some Kconfig fragments that define this
>     config option and expect that this then implies ARM64_LSE_ATOMICS to be
>     set. However, within the kernel tree, there is no existing config file
>     referring to that option. So, it is unlikely to be widely used.
>   - ARM64_LSE_ATOMICS is used in nine places within the arm64 directory in
>     the current kernel tree.
>   - ARM64_USE_LSE_ATOMICS is the only config option that contains the infix
>     string _USE_ to enable support and use of an arm64 architectural
>     feature. However, there is not a very stringent and consistent naming
>     convention for Kconfig options throughout the kernel tree anyway.
>   - The use of the transitional attribute allows to simplify transitioning
>     to a different Kconfig symbol name, but also adds some intermediate
>     definition to be removed later eventually.
> 
> After thoughtful consideration, keep ARM_LSE_ATOMICS and remove
> ARM64_USE_LSE_ATOMICS in a two-step approach, first deprecate
> ARM64_USE_LSE_ATOMICS with the transitional attribute here and then plan
> to completely remove it in two or three years with a further dedicated
> commit then.

Marc was talking about removing ARM64_LSE_ATOMICS entirely the other day
after it bit him with a KVM change. If all supported assemblers understand
the LSE instructions, let's just do that?

Will
