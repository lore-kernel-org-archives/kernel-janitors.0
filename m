Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD402877E8
	for <kernel-janitors@vger.kernel.org>; Thu,  2 Apr 2026 13:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.212.143.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135038; cv=none; b=NFEU+0Ln3MT/C/oQU+RA6MkBOje2K8i+e2/6PHcnhiG+rnutfVE5bRNO6vQLXB3Txrq5bp+9+Ar61kqGT1Qwf8NNrpJ0WpLNpClmWWoiQWIwnJzyz0S3ujSexNqjGdnyr/K3UN7m83ltz+pLuxypqxOsbZaxBZE+BGlXhOiWukY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135038; c=relaxed/simple;
	bh=sT49rkFhjmPzxllabTZjOd7OVIt8HFYKgdVy/VdYUwE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=FPeBm/Fhd4G+qOi7xhxbmjvp+jIGXMuy4hXbX9440Qy690I6NCpqogJtxbalKimI7oFk7X+G9Qse4kVhczsbhxLMpYur+FkrOIIvvZEhgz7cwciMaUni1r603lt9Je1LyQl6sp/K52AFu5EYrhpLg2zP98Au7QyUHCvv5heoIO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca; spf=pass smtp.mailfrom=crashcourse.ca; dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b=WVZCee0Q; arc=none smtp.client-ip=199.212.143.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="WVZCee0Q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zXUizsg2Kb34NoYXZH0H4vn9Dmpd2hSiSJQEsxIxiik=; b=WVZCee0QXNe0SVm/8VuvKHhJjm
	0U/45SzqTY+m0DXqZek5rTqvINFnYMxIeQM5iFx8artGjc8P4Xy5lt6WSaHjYLMFH38ruKhWw6woI
	UE7rEVYY+jJE1QwYk3mz5Mq6FqHi+ySscPmH8ZhSNLuDdRHNdUP0hIzQqUPClsJ+gQyVWX+seC2vN
	79fAkZ1sb8arjj/2D8tYfAOsPWwjCnkCjA/DhWYM5837NL4C8FML065yJvXwC2g0k1jkHjkP4zCae
	vydAhQRepb7X8cDvUHM/gq47T9ISE/FaYQ03QOPVeMikn0P/sHO8pzyGX04Mhe9yePXsrmyLn26Qs
	ChdVajJQ==;
Received: from [147.129.179.166] (port=45092 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1w8Hi9-0000000CQlt-0XIW
	for kernel-janitors@vger.kernel.org;
	Thu, 02 Apr 2026 09:03:50 -0400
Date: Thu, 2 Apr 2026 09:04:49 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Kernel Janitors List <kernel-janitors@vger.kernel.org>
Subject: some possible Kconfig-related janitorial work
Message-ID: <1615a000-adf6-1729-beb0-d2ac3c527f40@crashcourse.ca>
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


  following up on my earlier posts, again, many years back, when i
wrote those kernel source "cleanup" scripts, a number of them looked
for cleanup in the Kconfig files -- things like config variables that
were never used, "select" directives that selected non-existent
settings and so on. those scripts were absolute brute force and (i
might be mistaken) i recall that someone subsequently wrote much
better utilities that took advantage of the database of Kconfig values
created during parsing.

  in any event, if i run my old "find_badref_selects.sh" scripts and
ask it to scan the drivers/ directory:

$ find_badref_selects.sh drivers
>>>>> DRM_KMS_DMA_HELPER
drivers/gpu/drm/logicvc/Kconfig:7:	select DRM_KMS_DMA_HELPER
drivers/gpu/drm/adp/Kconfig:9:	select DRM_KMS_DMA_HELPER
$

  that tells me that a couple Kconfig files *appear* to be selecting a
config setting that does not exist anywhere in the entire tree. not
fatal, just unnecessary.

  if i examine the arch/ subdirectory:

$ find_badref_selects.sh arch
>>>>> HAVE_LEGACY_CLK
arch/sh/boards/Kconfig:13:	select HAVE_LEGACY_CLK
arch/mips/Kconfig:334:	select HAVE_LEGACY_CLK
arch/mips/Kconfig:475:	select HAVE_LEGACY_CLK
arch/m68k/Kconfig.cpu:33:	select HAVE_LEGACY_CLK
drivers/clk/Kconfig:12:config HAVE_LEGACY_CLK # TODO: Remove once all
legacy users are migrated
drivers/clk/Kconfig:23:	depends on !HAVE_LEGACY_CLK
>>>>> PINCTRL_MILBEAUT
arch/arm/mach-milbeaut/Kconfig:16:	select PINCTRL_MILBEAUT
>>>>> USB_OHCI_SH
arch/sh/Kconfig:334:	select USB_OHCI_SH if USB_OHCI_HCD
arch/sh/Kconfig:344:	select USB_OHCI_SH if USB_OHCI_HCD
arch/sh/Kconfig:429:	select USB_OHCI_SH if USB_OHCI_HCD
arch/sh/Kconfig:455:	select USB_OHCI_SH if USB_OHCI_HCD
$

a small number of *possible* cleanups -- there used to be *way* more
hits than today so a lot of that stuff was cleaned up. anyway, i'm
sure there are better utilities for identifying stuff like that, but
there's so little of that these days that it's probably not worth
working on.

rday
