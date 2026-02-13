Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F62139D
	for <kernel-janitors@vger.kernel.org>; Fri, 13 Feb 2026 00:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770941468; cv=none; b=PtiVZjbGSDve/9VzlOq2GlpxSsoJYxJhJDz9vbJ0+dk7pIMR9JNXBjjsicE8gY7YuqeP9f9RqJwrd89E7EnmeItoOUZ5+fwY8tKfD2OJURMAib+ywjIFOU9OYUkpimAJI5I5ujTMuKCDQsqu2WhmN0feWqnRfv11eaX5YgWr4nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770941468; c=relaxed/simple;
	bh=Bt+riuVcrxvV9lyOlhY+2RdFfnCKQOVQZkwCDQpe8EU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=T5Y15+F+nQIMSxKjmxL69YFPoWn/NdBWx5P8j3dV5VP6DnMdj6q7IwrvZBKXWmc7wcBN8sC6Vmb6N6SAv4LhpDpTndQKvlNODsYTuvpnc/rCBTvuWzbNbDGB2MgXOwDUdtpRz2hcnSTeG2VWWcZrUWbrf4YY/s58T9MoMr8kiPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GU3KclXe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GU3KclXe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C7E0C4CEF7;
	Fri, 13 Feb 2026 00:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770941467;
	bh=Bt+riuVcrxvV9lyOlhY+2RdFfnCKQOVQZkwCDQpe8EU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GU3KclXem5Ye6Jty+KY1bt6o3fSC0/sJNZKyLiND0idci37Xt0q0M1AGu8FLN/xb4
	 BVuEe55q1oO47Nzyoc7Ol6hz3bb4w7594hm+aPTkmL/sBX5hQPwDVuoMh0nrrwQTUa
	 jw54yLQxkRc5jH/7xaduKRD25qHt4+xOr0//W5+mJ8oeGGtxie8Bys6Z+9Fy8Man2B
	 Bz11oy0tPnMGACaaW5YJTqWnkdlW0OQCanCxe2mS4GIKCnjj/ab5U7u63zUqrpJopf
	 FLjWIr9HwSNbChAHpjPrb1qdKV90xuAyMdWX+UUKuspOcViV226ppH5fI8X791vJ9F
	 qrYvr6o/Ft5NA==
Date: Thu, 12 Feb 2026 17:11:04 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Sean Chang <seanwascoding@gmail.com>
cc: linux-riscv@lists.infradead.org, conor@kernel.org, palmer@dabbelt.com, 
    pjw@kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v3] riscv: fix various typos in comments and code
In-Reply-To: <20260212163325.60389-1-seanwascoding@gmail.com>
Message-ID: <7d0b996f-f6ab-cb7d-0803-493ca5abcb62@kernel.org>
References: <20260212163325.60389-1-seanwascoding@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-478193425-1770941467=:1307628"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-478193425-1770941467=:1307628
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Fri, 13 Feb 2026, Sean Chang wrote:

> Fix various typos in RISC-V architecture code and comments.
> The following changes are included:
> 
> - arch/riscv/errata/thead/errata.c: "futher" → "further"
> - arch/riscv/include/asm/atomic.h: "therefor" → "therefore", "arithmatic" → "arithmetic"
> - arch/riscv/include/asm/elf.h: "availiable" → "available", "coorespends" → "corresponds"
> - arch/riscv/include/asm/processor.h: "requries" → "is required"
> - arch/riscv/include/asm/thread_info.h: "returing" → "returning"
> - arch/riscv/kernel/acpi.c: "compliancy" → "compliance"
> - arch/riscv/kernel/ftrace.c: "therefor" → "therefore"
> - arch/riscv/kernel/head.S: "intruction" → "instruction"
> - arch/riscv/kernel/mcount-dyn.S: "localtion → "location"
> - arch/riscv/kernel/module-sections.c: "maxinum" → "maximum"
> - arch/riscv/kernel/probes/kprobes.c: "reenabled" → "re-enabled"
> - arch/riscv/kernel/probes/uprobes.c: "probbed" → "probed"
> - arch/riscv/kernel/soc.c: "extremly" → "extremely"
> - arch/riscv/kernel/suspend.c: "incosistent" → "inconsistent"
> - arch/riscv/kvm/tlb.c: "cahce" → "cache"
> - arch/riscv/kvm/vcpu_pmu.c: "indicies" → "indices"
> - arch/riscv/lib/csum.c: "implmentations" → "implementations"
> - arch/riscv/lib/memmove.S: "ammount" → "amount"
> - arch/riscv/mm/cacheflush.c: "visable" → "visible"
> - arch/riscv/mm/physaddr.c: "aginst" → "against"
> 
> Signed-off-by: Sean Chang <seanwascoding@gmail.com>

Thanks, queued for v7.0-rc.


- Paul
--8323329-478193425-1770941467=:1307628--
