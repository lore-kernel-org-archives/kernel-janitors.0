Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD022E7BBA
	for <kernel-janitors@vger.kernel.org>; Thu,  3 Jul 2025 13:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.212.143.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751551069; cv=none; b=mC9wFtvOGhGEPirb+3W81xKT4475DlrH7SZPDrhSQhwpnkOB2QSVCKSmFeci5dQ3pLEEQjbT2VIcChn+W4ikjD+xMtcjTc+VS28nBT48B24m9d4y3fZ0wROIXgFgJBaJ52BZpZp+FEpuEQQJDrkSqV/aEnYtbzYSgRhPZL+54qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751551069; c=relaxed/simple;
	bh=y1laoXUtUNizfvUjS3G1DJCq2waXTphyKl7QJwU/5zg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=s3PKOVu96teSE3bcj9lZDh9IPTClg5w29oA/dOGH4/rpdNCT6a7VpEojyo5jpvdZR7eT75kzfaGorIzdCqSURafBny19Etbw64KRPb1Hu6+KiA4R0Lbhty4xOYLpr/FXr6neqL29HjYQ49fK+0Upad2DCY4GftgWpjpteuu6eFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca; spf=pass smtp.mailfrom=crashcourse.ca; dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b=DsNlVzFc; arc=none smtp.client-ip=199.212.143.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="DsNlVzFc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DeXAsLs37GH+42ynw3X2t+/quKcZEX/uDFjhgeqx628=; b=DsNlVzFccrbcwXuWtJL+RfTEgj
	3qVpsFtLE/fKsddRtAKLJtVjBNr6vOvcc88Iwr9R6L3VclaK9j69ChA6FmC9R93LFGObV+NDlE+x8
	d03slVmoUbeBinXrSUFInv9h++gDEEpsUqmMdxD+8qa6E8oHgk38KZEXYFO9mLJ/wxMMidfMti0Ak
	6pl1fRgGKDIkpDIZ1JXJjyotvqMBlxJL/86UouPAhwYxXSPk8q2uJdkHqER4kzSlOGtwyu/ySCx4s
	ytNAYZZX4LMiuTkbBqwSe9DxIVpnpodeb7QLANUNeWnsHSkKmHuxKUIhDhoB2aA4BMJzdQJEYodsv
	f0p6N10g==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:40524 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uXKRU-00000000H63-2lxq
	for kernel-janitors@vger.kernel.org;
	Thu, 03 Jul 2025 09:57:37 -0400
Date: Thu, 3 Jul 2025 09:57:30 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Kernel Janitors List <kernel-janitors@vger.kernel.org>
Subject: trying to identify "unused" Kconfig "config" symbols
Message-ID: <26068282-92fa-0fc4-039a-7f7e93273263@crashcourse.ca>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 


  I'll throw out one more possible cleanup that is a lot trickier than
it looks; I have a script from years ago that tried to do this but it
still generated tons of false positives so I'm open to anyone else
taking a crack at this (unless there is already a script that does
this somewhere).

  By "unused config symbol," I mean a config-type definition in a
Kconfig* file of the form:

  config FUBAR
      ... definition of FUBAR ...

Turning this question around, what does it mean that that symbol is
being "used" in some way? Lots of possibilities:

  1) some other symbol might depend on it
  2) some preprocessor line might test it
  3) this definition might "select" another symbol

You see what I mean -- there are a number of checks you would have to
do to confidently say, "No, nothing in the kernel source tree is
making use of the FUBAR Kconfig symbol."  So let's take a look at an
example.

  I ran my old script just on the arch/riscv/ directory and was
informed that the config symbol RISCV_SLOW_UNALIGNED_ACCESS appears to
be unused. So let's take a look at that file and some of the other
symbols surrounding it, which you can see here:

  https://github.com/torvalds/linux/blob/master/arch/riscv/Kconfig#L952

I'll reproduce some of the symbols in question (cutting out the help
content for brevity):

  config RISCV_PROBE_UNALIGNED_ACCESS
        bool "Probe for hardware unaligned access support"
        select RISCV_SCALAR_MISALIGNED

  config RISCV_EMULATED_UNALIGNED_ACCESS
        bool "Emulate unaligned access where system support is missing"
        select RISCV_SCALAR_MISALIGNED

  config RISCV_SLOW_UNALIGNED_ACCESS
        bool "Assume the system supports slow unaligned memory accesses"
        depends on NONPORTABLE

Out of those three symbols, only the third is accused of being unused.
So why are the first two "used"? Well, they "select" other stuff so
you'd have to trace that down. More to the point, if you just grep
for, say, the first one, you can see it's referenced in a number of
places:

$ grep -r RISCV_PROBE_UNALIGNED_ACCESS *
arch/riscv/include/asm/cpufeature.h:#if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)
arch/riscv/Kconfig:	default RISCV_PROBE_UNALIGNED_ACCESS
arch/riscv/Kconfig:config RISCV_PROBE_UNALIGNED_ACCESS
arch/riscv/kernel/sys_hwprobe.c:#if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)
arch/riscv/kernel/unaligned_access_speed.c:#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
arch/riscv/kernel/unaligned_access_speed.c:#else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
... etc etc ...

and the same with the second one. But what about
RISCV_SLOW_UNALIGNED_ACCESS? Well, its definition doesn't select
anything else, and if you grep for it in the entire source tree:

$ grep -r RISCV_SLOW_UNALIGNED_ACCESS *
arch/riscv/Kconfig:config RISCV_SLOW_UNALIGNED_ACCESS
$

That's it. So is that sufficient to say that that symbol is unused?
You're invited to poke at that symbol and confirm that it does not
appear to have any *current* value or purpose.

  So that's a possibility for cleanup but, in general, identifying
allagedly "unused" Kconfig symbols is *hard*.

  Thoughts?

rday

