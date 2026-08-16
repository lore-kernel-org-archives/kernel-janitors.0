Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AE54B04B6;
	Sun, 16 Aug 2026 19:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786908006; cv=none; b=TnbohM4VmER/biXO02YaB+xNdwFABg6upbgTb/4vlv8ndK8FN5M01YQzSj24r2/Po+IGxbT3wjfu+f/rjQ/xZb/xOQwY+q0xDXVhh//zUUmDHaV/5kYY89nT3x9TuQlKdJDPNPj+bzkFPxvy0cZpnqIeXFHBXn1H5+3I22r2ZRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786908006; c=relaxed/simple;
	bh=lXiTqXKqC0QomCxEJd3hjqOsVpBnr9UK5Dwh6wV3R8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cQJ+cuV/qhG3Ia0RIIam4sqCSL9LJL3peJvZBt5o2LPECqEIUmbAhooUNEXeMzwmjYkryLc4HuzfxUFH3srC3w5KkehcAwWvlrLsWSXWIOQPmzzoQ5R4sQbs2Wd21L3O9nFm++qDR+wfJuA6Ua1PCu+QKUfjMMs5EyVhkbVrkNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WdcXRJY8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WdcXRJY8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A47251F000E9;
	Sun, 16 Aug 2026 19:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786908004;
	bh=ePqlfN7J/QMmtiy/pjAlZMY3V2slosZlFTfi6QegtJk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WdcXRJY8PSD94VUEJ67dL/jTjV/WwprH4DLneT0NhAH+bV8QL6sJL7LMsg075Ltrb
	 G2SxXlnoHQhW057yWbGMAp2rvxbtSI8yTJLSowV3h8bKbfOL+iaMWT4YUcHZ1tKxs0
	 Ys2lA9puKa3vUYQDIpygvMp+kD691lcYudiS+W6kRRSXMv4dLjJ1LprVmlXKN6F/iL
	 +bf3OILDK75PDrhdEVb8rSGHbj83r5DlZksUW3Nfe7ANwG477Bn4ZYezf4Cv7oBSVB
	 eD9xOVjM0bAS3m6gKuSL3n8SmTnAjcr7I0ouQdEUNlmgA5wZhh1e2eQh9Uhqv/akhA
	 8vPAFEsC+nL8A==
Message-ID: <193a2ce6-4c4e-4291-a542-e112d5a87742@kernel.org>
Date: Sun, 16 Aug 2026 12:20:03 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARC: cleanup dead ARC_CANT_LLSC option in Kconfig
To: Julian Braha <julianbraha@gmail.com>, vgupta@kernel.org
Cc: joao@joaoff.com, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20260816142207.1034329-1-julianbraha@gmail.com>
Content-Language: en-US
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <20260816142207.1034329-1-julianbraha@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/16/26 07:22, Julian Braha wrote:
> Currently, the ARC_CANT_LLSC config option can never be enabled.
> It is also not referenced anywhere else. So let's remove this dead code.
>
> Note that I have only compile-tested these changes, because I do not have
> the hardware to runtime test.
>
> This dead code was found by kconfirm, a static analysis tool for Kconfig.
>
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Acked-by: Vineet Gupta <vgupta@kernel.org>

Thx,
-Vineet

> ---
>   arch/arc/Kconfig | 4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
> index 2ed7186c81c5..80e61175bf52 100644
> --- a/arch/arc/Kconfig
> +++ b/arch/arc/Kconfig
> @@ -331,13 +331,9 @@ config ARC_FPU_SAVE_RESTORE
>   	  for floating point exceptions and rounding modes. These are
>   	  preserved across task context switch when enabled.
>   
> -config ARC_CANT_LLSC
> -	def_bool n
> -
>   config ARC_HAS_LLSC
>   	bool "Insn: LLOCK/SCOND (efficient atomic ops)"
>   	default y
> -	depends on !ARC_CANT_LLSC
>   
>   if ISA_ARCV2
>   

