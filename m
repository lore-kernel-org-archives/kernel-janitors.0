Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0112C270EA4
	for <kernel-janitors@vger.kernel.org>; Tue,  1 Jul 2025 12:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.212.143.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751373372; cv=none; b=HcQwF3MkRyeB6Ux+CVJwaILNlpI2clnl2UQFpyzMidqV8pMKrv1uDGh4GvzsGxEnjBINg4jftkN/dLMp7s5ST9bTJRKKa8Nokfck0MP2r8OG76w9LTtu+wAuYL1Kr3WwxZBIfxzXwrGioAp9pLuWlv9AL/Fcs86MHtHQ9e9AM5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751373372; c=relaxed/simple;
	bh=KfFsAKc+8Bx9jBA5cLYCmFnUK3G6Hkmkujn/bwrxOlI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=VJODAbTwHdTXk1IMR2r++zhGtpD+vFiM5t8c/ozYptRySBQ/llG0GGfWjX9PmLNDfqixuSMipTHauJr7peacwUSlPBYZ5DAVJoWZb2XfZ9gU5WknKGlYasiQz9buY0cIXrur5WePfkqHN2BV/Z+CsCrXp7Va+hct6n+4ReJt4Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca; spf=pass smtp.mailfrom=crashcourse.ca; dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b=MpmQ8dwt; arc=none smtp.client-ip=199.212.143.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="MpmQ8dwt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IhGWYDYDQSGa6gD7uFSPvArsddknjdnXzPmi9rwx7z0=; b=MpmQ8dwtyOYcHuDMcs+8THziaS
	i8BS5+X/juOkiCNpvacxUQT7iRKs1DR7F3AJye5Lq2J3sxCkCRYkQxaIXnrSCVL/YN3GOoSUPTIyf
	5q/jWg083TQ/vedR5OHcLOgmfOki6TvtMSxf0v/H1I6Y6+uVJJL4ERGKtQd7MbWyPhGI8urK9ALKt
	AXo3KRXuaZiMzWmwtnBpDLtTfGl0BdGM8Iguw/u2stLd31SovKILtKAGx2dvOx1hW3+XKYaTbiAmA
	coFO+wzCJL9VKKDalNrF62uoaIBoQcaieYh9mEmaKcaIqxF0HOIkx/qG4NTcQ8DWL/POcmBwjzhZp
	JlBHpNrQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:32788 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uWaDV-00000008c0Q-3dx6
	for kernel-janitors@vger.kernel.org;
	Tue, 01 Jul 2025 08:36:07 -0400
Date: Tue, 1 Jul 2025 08:36:01 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Kernel Janitors List <kernel-janitors@vger.kernel.org>
Subject: Notes on janitorial "Identify #if testing on non-existent CONFIG
 symbols"
Message-ID: <758e6146-0099-c62f-137f-224d25b46e97@crashcourse.ca>
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


  I was just about to add another janitorial check to my kernel
janitors' page when I remembered that it is a bit trickier than I
thought, so I'm open to feedback here. (And remember, none of my
scripts are meant to be bulletproof; they are a *starting point* for
cleanup, nothing more.)

  I have a script called "find_badif_configs.sh", whose purpose is to
identify alleged Kconfig symbols that are *tested* in kernel source or
header files (with some variation of #if or #ifdef, that sort of
thing), but do not appear to be *defined* in any Kconfig file. That
means that while those tests are for the most part meaningless, they
are perfectly valid. But they're clearly pointless.

  Let me start with a simple example or two:

>>>>> ACORNSCSI_CONSTANTS
drivers/scsi/arm/acornscsi.c:92:#undef CONFIG_ACORNSCSI_CONSTANTS
drivers/scsi/arm/acornscsi.c:393:#ifdef CONFIG_ACORNSCSI_CONSTANTS
drivers/scsi/arm/acornscsi.c:471:#ifdef CONFIG_ACORNSCSI_CONSTANTS

  That's the first hit when I run my script on the drivers/
direcxtory, and if I do a simple grep, I can see that the string
"ACORNSCSI_CONSTANTS" occurs nowhere else in the source tree. So this
would *seem* to be a good candidate for cleanup, after someone checks
the Git log to see where that symbol went, and why, and fixes the
surrounding code. You get the idea.

  Here are a few more examples that could be candidates -- CONFIG_*
symbols that are tested by the preprocessor but are not defined in any
Kconfig file:


>>>>> CRYPTO_DEV_ASPEED_HACE_CRYPTO_DEBUG
drivers/crypto/aspeed/aspeed-hace-crypto.c:19:#ifdef CONFIG_CRYPTO_DEV_ASPEED_HACE_CRYPTO_DEBUG
>>>>> DRM_AMD_DC_DP2_0
drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c:107:#if defined(CONFIG_DRM_AMD_DC_DP2_0)
>>>>> DRM_XE_LMTT_2L_128GB
drivers/gpu/drm/xe/xe_lmtt_2l.c:57:#if IS_ENABLED(CONFIG_DRM_XE_LMTT_2L_128GB)
>>>>> FUSION_MAX_FC_SGE
drivers/message/fusion/mptbase.h:180:#ifdef CONFIG_FUSION_MAX_FC_SGE
drivers/message/fusion/mptbase.h:181:#if CONFIG_FUSION_MAX_FC_SGE  < 16
drivers/message/fusion/mptbase.h:183:#elif CONFIG_FUSION_MAX_FC_SGE  > 256
drivers/message/fusion/mptbase.h:186:#define MPT_SCSI_FC_SG_DEPTH CONFIG_FUSION_MAX_FC_SGE


And here's the tricky bit, since here's another symbol that initially
was misidentified:

>>>>> NCR53C8XX_PREFETCH
drivers/scsi/ncr53c8xx.c:1779:#ifdef CONFIG_NCR53C8XX_PREFETCH
drivers/scsi/Makefile:180:  := -DCONFIG_NCR53C8XX_PREFETCH -DSCSI_NCR_BIG_ENDIAN \

Note how a "CONFIG_" prefixed macro is not defined in a Kconfig file,
but is defined in the Makefile.

Aaaargh.

I remember from years back that there was a coding standard that the
prefix of "CONFIG_" was to be reserved for Kconfig-defined variables,
but there are definitely places like the above in the kernel that
break that rule, so my script had to be extended to show just the
above -- what *would* have been a potential cleanup except for that
hacky setting in the Makefile.

  Anyway, I'll post that script and people can poke around with it.
Stay tuned.

rday
