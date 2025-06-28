Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8B41854
	for <kernel-janitors@vger.kernel.org>; Sat, 28 Jun 2025 21:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.212.143.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751144958; cv=none; b=fisq3lmiqV6x8B678AQh2nFHKGUYVW3vHNr7oUA4VXt8wDLeppKPXz+vbIBa9OUeSjSPaqKKYQWMMhciIhZqn21PAgtuo35xoGSMd80xnoiN2dlHmX72jkL5ElCwL3MLQd3IfTG4Mi51GaWLr8BageqhL3UxMUvxQhXPdVaPt0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751144958; c=relaxed/simple;
	bh=vc1/lVb8JUVyQL9qoQ14PRjiknznvgL2E6symB8Q4M0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=tu7+upPQeLFw43zCM3xbEUjKNK0mJRT0GagB7TbNadsa2CJ7Kng113G5iA4t2QQKtZ2zAaIIeGdCFWtx8zuvXIv9GmlfwT00kTCPHswuRNK5jSqRBA4c9o2Cs1hla2bl0YJfesXXPpgwcgPl/4LI3zPNdBwO0hyQebxS/hwyAoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca; spf=pass smtp.mailfrom=crashcourse.ca; dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b=EoRblP16; arc=none smtp.client-ip=199.212.143.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="EoRblP16"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iXxpKJCmDxYZoe4HuGfjj/tUNPupH24O1DGD/41jixY=; b=EoRblP168R8fSN7dAY33/nj0gx
	hRFLXl6ov/MrAtP5RlxVjYcw328+Ef/BY3vZLi3ceHJvrFwokIDUVRKDwDpBgH6AMDWrp3+ZAqLrC
	CA7k8n9QDgMv7iOjZNpSO3gNRhpBCbESu7087SaT7BNsYHh5QmnwmeQfVjfN82poFHLqthtAwy2gU
	5BAO8aa4scQP0DtA5B4qAbzg5N/SelH9vRzUoDzQKLyIxMvN2tyFqAf9ZUWbTFZoHR7AjIRLDuih7
	VZuMRSjW6Je6N+l5a+AuujGlSrOLX23U0BUf9HXEUJ2oSTPED5jKOV12hroVm/msFbxeDohHRDC8k
	hb7igLgQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:43654 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uVcnM-0000000DioL-3UX9
	for kernel-janitors@vger.kernel.org;
	Sat, 28 Jun 2025 17:09:09 -0400
Date: Sat, 28 Jun 2025 17:08:59 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Kernel Janitors List <kernel-janitors@vger.kernel.org>
Subject: I have a pile of potential janitorial work for interested parties
Message-ID: <ebfb23a6-def8-24a8-8958-28213a3c0da5@crashcourse.ca>
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


  Quite some time ago, I was immersed in a bunch of Linux kernel
janitorial work, and I wrote a bunch of scripts that scanned the
kernel source tree and identified obvious candidates for
simplification and cleanup. I'm going to publish all of that to my
website in the very near future, but just to clarify what I mean, let
me provide a single example to see if this is still relevant, or
whether I'm off-base.

  One of the scripts I wrote scanned the kernel tree for what I call
"badref selects", those being entries in Kconfig files that "select"ed
config entries that did not exist (probably the result of someone
deleting config entries, but not checking to see if anything selected
that entry). Such occurrences are not fatal, but they are obvious
candidates for cleanup.

  I just ran that script on the current source tree just for the
drivers/ directory, and here's the output I got:


$ find_badref_selects.sh drivers
===== DRM_DEBUG_SELFTEST
drivers/gpu/drm/i915/Kconfig.debug:53:	select DRM_DEBUG_SELFTEST
===== DRM_KMS_DMA_HELPER
drivers/gpu/drm/adp/Kconfig:9:	select DRM_KMS_DMA_HELPER
drivers/gpu/drm/logicvc/Kconfig:7:	select DRM_KMS_DMA_HELPER
===== TEST_KUNIT_DEVICE_HELPERS
drivers/iio/test/Kconfig:11:	select TEST_KUNIT_DEVICE_HELPERS


This output suggests that those "selects" refer to config entries that
do not exist, and so could likely be removed as janitorial work.

  Does the above make sense? If I recursively grep for the strings,
say, "TEST_KUNIT_DEVICE_HELPERS", I see only that select statement,
and nothing else. I'm assuming that means it's superfluous. If this
makes sense, I can publish my scanning scripts and others are welcome
to use them to find stuff that can be cleaned up.

  Thoughts?

rday
