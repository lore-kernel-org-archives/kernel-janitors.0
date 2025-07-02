Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A724414
	for <kernel-janitors@vger.kernel.org>; Wed,  2 Jul 2025 12:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.212.143.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751460399; cv=none; b=gmqbOX0d0DbnbulMfByQ7PKLG/pJ+znOGHow6Np9B/506Sxnc5uOELiX03d/ZSHZR4wZ+qlTJ58p8yNoII9iCcQL2dc+JrnjNETmcb4T4WkRpA9ni+JJcEShXKgb4BTSn8aU0ngASfm43Si2z8r56wYyy/7uQu6CZtab4Vt6Ysk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751460399; c=relaxed/simple;
	bh=8vioJgo8jxOqEbwCsEbsbT0NeygNaljRceeKoaRMP2s=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=fR6kCFGwMOHTplcoD0vNEH/Z7OfD54Ei2b8yfRSZOSbjznsWp+3uhfRVHvqWYFskVagA3eP9YVi/SukptG4RqgAnvNc1208bnRGA8yfJatcEGYppmHKpzQgWVaPRZT6AApIEwTnqvsh6wrx07QVkbnTpU5Ba3DmDXIBZyHdiuXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca; spf=pass smtp.mailfrom=crashcourse.ca; dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b=cKnjiuk7; arc=none smtp.client-ip=199.212.143.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="cKnjiuk7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aF0rrwUU+8hTPQqzTldXIlhyTYwJ0uhxq2rV6e7sngM=; b=cKnjiuk7YFluKjGqNLEtCHLsI3
	NP1YGGxgKjefw8s++APQoIJAmisyfBrNInLOMbk8qX6kbrvhMYQcIcwLYeA0XT7ygtWM8CWvbiFs8
	2Q75NzikhqmAIgUOPBwxAU2u8drIMEJH1PkT6lmMqJ8TnBCdL1aW36o4UbjAlsq6VZyg5oCivLnhc
	l+0FF6dD6Rk+K2D6eTsjBWu+8fxnXymlJ8u45nn4HZs7/BrKBymR1QlSPAeVOkcoemaO7K4fy/p+f
	fZpywQ6eO/5Ft0xjE5iNka1ysa+ST206zCZm3eOkRZf5jHUkjmI5TXfMLTPPiQUHPh1jmM876ka44
	63zE6reA==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:44254 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uWwrB-0000000Dcmk-0dMw
	for kernel-janitors@vger.kernel.org;
	Wed, 02 Jul 2025 08:46:35 -0400
Date: Wed, 2 Jul 2025 08:46:29 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Kernel Janitors List <kernel-janitors@vger.kernel.org>
Subject: More kernel janitorial work -- finding "unused" header files
Message-ID: <4f9f3eb1-61d8-d5f8-9cd4-22add4e7a8b7@crashcourse.ca>
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


  I'm still cleaning up my kernel "scanning" scripts, and documenting
them one by one here:

  https://crashcourse.ca/doku/doku.php?id=linux_kernel_cleanup

so that people looking for Linux kernel janitorial work can peruse the
scripts (excuse the bland formatting for now), and can run them,
analyze the output, and determine if there is cleanup work that can be
submitted as patches.

  (NOTE: I will add to my wiki page the guidance to not just blindly
run the scripts and submit patches. Rather, the output is to be used
as a first step to see if the output is meaningful, what it means,
then to examine the Git log to understand the history of the output,
then identify the maintainers/mailing lists who should receive any
appropriate patches.)

  In any event, one of the major scans I implemented all those many
years ago was to find allegedly "unused" header files -- that is,
header files in the kernel source tree that appeared to not be
"#include"d from anywhere in the source. I'll document that script
shortly at the wiki page but let me provide a sample run so people can
appreciate what the output represents.

  The current script accepts an optional argument as a subdirectory to
scan (so you can focus on a small part of the source tree); what that
does is collect all of the header files in that subdirectory, but
still scans the *entire* kernel source to see if anything anywhere
includes any of those header files.

  I ran this script against the drivers/usb directory, and got the
following output:

  ===== phy-mv-usb.h =====
  ./drivers/usb/phy/phy-mv-usb.h
  ===== sisusb_tables.h =====
  ./drivers/usb/misc/sisusbvga/sisusb_tables.h

What this allegedly tells me is that there are two header files under
drivers/usb/ that are not included from anywhere in the entire source
tree (for whatever reason).

  As a manual confirmation, I'll just grep for that header file name
from the top of the source:

  $ grep -r phy-mv-usb.h *
  $

So does that mean that header file has no value? Not necessarily, as
it turns out that a lot of these types of files are lists of
enums/macros and corresponding hex strings, so who knows when those
values will suddenly become useful again?

  Same thing with the second header file in that list:

  $ grep -r sisusb_tables.h
  $

So nothing includes it but, again, it's chock-full of hex values so
who knows who might suddenly need all that information?

  Running the script on the directory drivers/gpu produces *way* more
output (this is just partial output):

===== beige_goby_ip_offset.h =====
./drivers/gpu/drm/amd/include/beige_goby_ip_offset.h
===== bif_5_0_enum.h =====
./drivers/gpu/drm/amd/include/asic_reg/bif/bif_5_0_enum.h
===== bif_5_1_enum.h =====
./drivers/gpu/drm/amd/include/asic_reg/bif/bif_5_1_enum.h
===== cl502d.h =====
./drivers/gpu/drm/nouveau/include/nvhw/class/cl502d.h
===== cl902d.h =====
./drivers/gpu/drm/nouveau/include/nvhw/class/cl902d.h
===== dce_11_2_enum.h =====
./drivers/gpu/drm/amd/include/asic_reg/dce/dce_11_2_enum.h
===== dce_8_0_enum.h =====
./drivers/gpu/drm/amd/include/asic_reg/dce/dce_8_0_enum.h
===== displayobject.h =====
./drivers/gpu/drm/amd/include/displayobject.h
===== dmub_trace_buffer.h =====
./drivers/gpu/drm/amd/display/dmub/inc/dmub_trace_buffer.h
===== gc_9_1_sh_mask.h =====
./drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_1_sh_mask.h
===== gfx_8_1_d.h =====
./drivers/gpu/drm/amd/include/asic_reg/gca/gfx_8_1_d.h
===== gfx_8_1_enum.h =====
./drivers/gpu/drm/amd/include/asic_reg/gca/gfx_8_1_enum.h
===== gfx_8_1_sh_mask.h =====
./drivers/gpu/drm/amd/include/asic_reg/gca/gfx_8_1_sh_mask.h
===== gmc_8_1_enum.h =====
./drivers/gpu/drm/amd/include/asic_reg/gmc/gmc_8_1_enum.h
===== gmc_8_2_enum.h =====
./drivers/gpu/drm/amd/include/asic_reg/gmc/gmc_8_2_enum.h
===== hdp_4_4_2_offset.h =====
./drivers/gpu/drm/amd/include/asic_reg/hdp/hdp_4_4_2_offset.h

... snip ...

Again, a lot of that looks like hex string definitions, but no one
seems to be including it (or at least not including it in a standard
way).

  Thoughts?

rday


