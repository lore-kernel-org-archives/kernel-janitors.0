Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01B425CC6C;
	Wed,  7 Jan 2026 22:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767823670; cv=none; b=gZ+K1OHpaD1g0swwR6vkh1yxsa+x21fEzimwp3PClK9EDLZNHDcBBGXqoUglVyRM042u+Ym7m5/S2Pp+9e/jky21S0OOL+6AfPZybq+zKhYW9493lkl0KT4fidF6dsQBHiQrW+Qx+you/yULKFQmtc4LUVpkrDCWrGEEPRE4P/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767823670; c=relaxed/simple;
	bh=QyFCCcYsTjiHEpE4lkucaEiMPObsJsUVie7vYC1jM5A=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=njeUbcTuMcYPXMukfJJsqgnzGCyHQOBjKMV4oLNHk6m5LEZgsl2nZu/9hLYMHkL76mHxecKemOzjCSQh7ulKmqStrQH7TuYACgxtKdmWMmK540yw5ZNVeUyHvhexVYlysDNgBeIUrm2ZW3sP+W508RKzBx5F23DEIQk6nDzK4wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=C29YWTci; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=K1sb18mG; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="C29YWTci";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="K1sb18mG"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id BB5EF1D000BB;
	Wed,  7 Jan 2026 17:07:45 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 07 Jan 2026 17:07:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767823665;
	 x=1767910065; bh=CAnAv/LJnBSH5Dae/YwF15GHzEwiA2Hav/HN+MtxZkw=; b=
	C29YWTciMfXwBD4cOVmgUgjFp4qwDAUtrKmB1O5Luq88MnHcUqGnxzUVCvyIZkNE
	q426bOB859Dte5NbSdNGxEvfgqE8XAaBeN7FXl8Tat6czz9ZwNAVEOJGoLSlTV7R
	+L0Elgyuq2oT4eVhm8lCLiJH3/rU+Lkn9V34ZabmzCkE+hk/Mx98vG3/dOdty4O9
	eyVQpSTu1v3x3xirBaazz+a7J+AI12SqedCr6JpHkKbl8o9sXGqjnY5ZUciQE4/d
	5rZx/dQHF0P1Qn1R5LBqDe4079SdfavrbkB2DxMEH7MEKJdqLejGUJnyyZ5fnWRA
	Rir88/LDn6OSyWDA+VH2BA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767823665; x=
	1767910065; bh=CAnAv/LJnBSH5Dae/YwF15GHzEwiA2Hav/HN+MtxZkw=; b=K
	1sb18mGLVllhcekE6stdN/s3CZ9HbWawIH3QiDATvp52a4BTlPCkFUwyk7vVDFfV
	P5pWBVA2RprGpcvohlHAdemVdPYp8ZE3zx6o59GpN/fNv6CqlCgM0YqJxBUSjtZ7
	Z1/JlQQSkKolgp7jR7uM/J4IpwjXs5tUI8w430D/YB3UyPPmqnVleOcwmDXdlSWe
	nLqZaEfPlysKovkLDlosomRNJKEb2VwuugN769TPimgKTR5wxH+WTk3EHqR7komJ
	CIBw6WHRQc2UJd6327X4J2oeUjyh6QaUzuG2IGvgHKuqq+ySVcNYHI+kP5JgGKZL
	9Bhop2uAs1VcGk1GvYwLw==
X-ME-Sender: <xms:MdleaS6IGX4ez3oVOiAk_mXHi6sUkVofqfrP3DmqTgG2t6l1KjHqvg>
    <xme:MdleaWsjL-txPMUuYbZofuX8DYUhgfJMq1w1BPtprMEFYHqEuhs_gqWVj05pF4D13
    jrz9QHqYVzbvsNhKOgfyrfYGrVdb6MbbRBZNme1syCvNb8Ped47WA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdegvdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtg
    hpthhtohepmhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtohepkhgv
    vghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrgiisehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtg
    hpthhtohepvhgvghgrrhgurdhnohhsshhumhesohhrrggtlhgvrdgtohhmpdhrtghpthht
    oheplhgsuhhlfigrhhhnsehrvgguhhgrthdrtghomhdprhgtphhtthhopehluhhkrghsrd
    gsuhhlfigrhhhnsehrvgguhhgrthdrtghomh
X-ME-Proxy: <xmx:MdleaaisiOkxXIfDELq7a1mY3wzv0c8Uz7pF7pr0OHanZxjZH5YLEA>
    <xmx:MdleaW3eYdLg89neg5zDFnrdQw3D-Wlu-zB3ABNyhYM4XGeR4ElafQ>
    <xmx:MdleadfbTtyPx4Y5xyC8TL-mHDzVLTepoFQ6aszKQHaThYKDcfo6BQ>
    <xmx:MdleacwB-fWJ5gwo4ZCmjfqYfR9Bll3OwGF54N_UPwIStcvPoSjeXw>
    <xmx:MdleaXetcZpqDh7T36yAsJHrsdFoop2jdPFMy4zN2ChgziLSHCdSoeMd>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3027F700069; Wed,  7 Jan 2026 17:07:45 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A8i1WEG3jGmR
Date: Wed, 07 Jan 2026 23:07:03 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Will Deacon" <will@kernel.org>, "Marc Zyngier" <maz@kernel.org>
Cc: "Lukas Bulwahn" <lbulwahn@redhat.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, "Mark Rutland" <mark.rutland@arm.com>,
 "Vegard Nossum" <vegard.nossum@oracle.com>, "Kees Cook" <kees@kernel.org>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Lukas Bulwahn" <lukas.bulwahn@redhat.com>
Message-Id: <7b7ac65c-773e-48fe-a335-c49b6ef9a0e8@app.fastmail.com>
In-Reply-To: <aV6CpBCvr37mcv7W@willie-the-truck>
References: <20251223110730.121239-1-lukas.bulwahn@redhat.com>
 <aVwkIYMyoe7OpeUh@willie-the-truck> <86h5syn8ww.wl-maz@kernel.org>
 <aV6CpBCvr37mcv7W@willie-the-truck>
Subject: Re: [PATCH] arm64: Kconfig: deprecate redundant ARM64_USE_LSE_ATOMICS
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Jan 7, 2026, at 16:58, Will Deacon wrote:
> On Tue, Jan 06, 2026 at 01:54:39PM +0000, Marc Zyngier wrote:
>> On Mon, 05 Jan 2026 20:50:41 +0000, Will Deacon <will@kernel.org> wrote:
>> Subject: [PATCH] arm64: Unconditionally enable LSE support
>> 
>> LSE atomics have been in the architecture since ARMv8.1 (released in
>> 2014), and are hopefully supported by all modern toolchains.
>> 
>> Drop the optional nature of LSE support in the kernel, and always
>> compile the support in, as this really is very little code. LL/SC
>> still is the default, and the switch to LSE is done dynamically.
>> 
>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>> ---
>>  arch/arm64/Kconfig             | 16 ----------------
>>  arch/arm64/include/asm/insn.h  | 23 -----------------------
>>  arch/arm64/include/asm/lse.h   |  9 ---------
>>  arch/arm64/kernel/cpufeature.c |  2 --
>>  arch/arm64/kvm/at.c            |  7 -------
>>  arch/arm64/lib/insn.c          |  2 --
>>  arch/arm64/net/bpf_jit_comp.c  |  7 -------
>>  7 files changed, 66 deletions(-)
>
> I think we should go ahead with this.
>
> Initially, I thought we'd need some surgery to cpufeature.c so that
> cpus_have_final_cap() could take the _likely_ path for LSE but it looks
> like that's only relevant for KVM's AT handling and the common atomic_t
> APIs use alternative_has_cap_likely() already.

I'm not entirely convinced by the direction. Removing compile-time
options and complexity from #ifdef blocks is clearly an advantage,
but I'm a bit worried about at least the ARM64_USE_LSE_ATOMICS 
option still being valuable.

The boot-time patching for all atomics adds complexity as well, and
being able to configure it out can be helpful in a number of
scenarios:

- I've seen several scenarios where code size is extremely important,
  and being able to compile out any runtime-detected features 
  saves some space. In a defconfig kernel, this is about 1.1% of .text.
  Being able to select just the LSE version without the patching
  may be even more valuable these days, but almost
  all embedded systems I see are still ARMv8.0 (Cortex-A53 and
  Cortex-A35) without LSE.
- We have an experimental patch set for CONFIG_XIP_KERNEL on arm64,
  which inherently requires not patching at all, and requires
  the opposite patches for other features and errata workarounds.
- The amount of nested macros and inline functions for the arm64
  atomics is large enough to slow down compilation, #including
  linux/spinlock.h shouldn't really result in >1MB of preprocessed
  source code. (this is a much harder problem to solve)

      Arnd
