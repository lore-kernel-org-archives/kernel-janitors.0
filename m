Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EEF2F5E
	for <kernel-janitors@vger.kernel.org>; Fri,  1 Aug 2025 12:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.212.143.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754050599; cv=none; b=Tsey6IqAjI7tKa6k8RAz91vT9Drqphoe/WEjsp/ji1lOHCuFscy/doFz8upeDNiT4bWPumRLEf23MvOivShYmuAYygfIWj0JWM9W4cewEX0Q9nksOrBjCxdd191HbvGyeTSIB2eE8/FrpacloWsRnV4TRNl4aa1SrXm4NQIN7bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754050599; c=relaxed/simple;
	bh=XLYzFNm/BPFmRL37oD6gLaSUWsABGNDOfYpodAsZlgI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=JrMp0DYU1AcHDFxr5Lssg5EkAkUArds79gND0Qgz1QoNwB6XFH2ttcarlTVkIoGexRg84Hz5GEL4hvPdf22z36950d9GbohKotzDVexlDcuv6/YvKK/T86SIE2BslhN5olh8r3C1SbMxpm0GuHmocZss0+8vJPyVU9CXgQG3EBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca; spf=pass smtp.mailfrom=crashcourse.ca; dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b=KbzGogcR; arc=none smtp.client-ip=199.212.143.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="KbzGogcR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RorE3L/VOaVzx1Rqu2LSlTfDw2d3/gwcoJePMMno1J8=; b=KbzGogcRyNHtF0PwQ/OiOB68rR
	lykopJtt8xE1ejTP+LYg+dWVLXxvg1x+ZyAr0KS8idS6+8KXnr32AbBy3FmBDtqmRf6Eyt7QpGNy7
	vAisp7Aw5qrflhTsuIMTRnIJqALP1iGbhpqRxyjQ3dCixCpx7WoSuzbIxrJW3lqPSUo8N7XSO9gya
	GG5gYwSTFzeqkbq8rGMR6SxNd9CYN+DGJN4jly90mET2GhyH02yg9vWHzK73OpIuj6w95O0OE8FNv
	a13yYKi27YA/QyqZzjFZeabbjYP0cWFYrHJeUiyQLjCeSgyssUD+cw0PWjqeIs7/AzWinC3+ZEgVg
	EGlqh/FQ==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:48114 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uhogS-00000009lpY-2m0U
	for kernel-janitors@vger.kernel.org;
	Fri, 01 Aug 2025 08:16:28 -0400
Date: Fri, 1 Aug 2025 08:16:14 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Kernel Janitors List <kernel-janitors@vger.kernel.org>
Subject: more janitor work: simplifying Kconfig files
Message-ID: <add0d124-3c3c-8715-1560-a78f30ddf403@crashcourse.ca>
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


  if people are still looking for straightforward janitorial work,
here's something i worked on many years ago and for which there is
*always* some cleanup work. consider this Kconfig file:

https://github.com/torvalds/linux/blob/master/drivers/ata/pata_parport/Kconfig

notice the relentless duplication in each of those config stanzas, as
many of them contain the dependency directive:

  depends on PATA_PARPORT

in cases where there is this much duplication of the same Kconfig
dependency, you can frequently simplify this by wrapping all of those
stanzas in the common test:

  if PATA_PARPORT

  ... the same stanzas with "depends on PATA_PARPORT" removed

  endif

if there are only a couple duplicate dependencies, it's probably not
worth simplifying. on the other hand, there could be *numerous*
duplicate dependencies, and if they're not consecutive, you might have
to move them around to group them -- in cases like that, moving them
around might actually make the Kconfig easier to read since you've
collected some of the entries by commonality. (you would have to run
that sort of change by the subsystem maintainer, who might be grateful
that you're willing to clean up his or her Kconfig).

  note there's no automated way to identify this sort of thing, it
takes manual poking around as you're examining the kernel source to
additionally check Kconfig files to see if there's something worth
cleaning up. but there's a higher-level cleanup that is sometimes
possible.

  note that in the Kconfig example example, every single stanza in
that Kconfig file depends on PATA_PARPORT. in cases like that, it
makes more sense to put the conditional check in the higher-level
Kconfig file to not source that lower-level file *at all*. notice:

https://github.com/torvalds/linux/blob/master/drivers/acpi/Kconfig#L546

that test will determine if there is even any point in sourcing that
lower-level Kconfig file -- that appears to be the kind of
simplification that can be done for the PATA_PARPORT example.

  so there is clearly some cleanup that can be done along these lines.

  thoughts?

rday

