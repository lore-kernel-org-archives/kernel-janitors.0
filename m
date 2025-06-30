Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B1A2AD2F
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Jun 2025 18:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.212.143.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751306560; cv=none; b=gEyKQs6EYr3ED4Cz4w2TCs/iyAop4BSZNiDQiSteI3XJW26GxJawSrerS0GLnMsxE0BLpAEOyuyx/zlmAbZ4VttQ8t5nvDmpJ9+YP/y52ifVSLcPeqoQqxJY0Fp12SQxsgTd9vDt8SoIEvdH9jA6+Jv4VYh2I1su17ADC7orkQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751306560; c=relaxed/simple;
	bh=0+CLXGCgE8D0X+K9NXLM04h7NIiiYXozcCItdgkODOI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=sIUy++MBbafymqTeVMHagrcKn/8H41aQyYL4HxOKdbVW5oOM9KLjqeiORyRIqDxLtPJM/+suRx0DQK81HcZKDT6cWxgwbDcotBO3AUx7kGiZWIeDbGJfKHQTQTTnLi3lAUFSQVCGW7YwDDwr3OKF7ZjMZ5/XMMXWtnj1otK8fpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca; spf=pass smtp.mailfrom=crashcourse.ca; dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b=HWoJjyYm; arc=none smtp.client-ip=199.212.143.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="HWoJjyYm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ppNkutg5I4QmUlZQ5OxY9Y75KfwEml8tT0Pa+9Rlvkk=; b=HWoJjyYmEtRz/b7ZpzcZ5KOAd0
	uMWdhq5gbCA3Xq4atCMUj/DvVo6VfQ4q3sMe9+oxzWqBBDdwsIHtHrrIt2o4QFGgUL49Abljjlyy+
	QZNIuQU57CBZujNb+PlEQowFitLp5oXRDh7LX0VwzDcI2iVRMGAkWqwZAp46cCZHgVbaAhjT/WfAY
	8uQ7KqjqGVxjhQEXWUucQ13EtTiHO4q8+P+NDyPsk4/pGf5qlFJNj26/FP89ANy4YVbpG5WJAhryu
	tpV4nvfr8ZFzh+eeyr6R6qnrmhMaRUOz0VnmxYlJGmggxYCYJG6xyomdeSim6153/x5ms1YvkDMF+
	tzSpheBg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:44910 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uWIpv-00000003ugS-1El2
	for kernel-janitors@vger.kernel.org;
	Mon, 30 Jun 2025 14:02:36 -0400
Date: Mon, 30 Jun 2025 14:02:25 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Kernel Janitors List <kernel-janitors@vger.kernel.org>
Subject: First pass at janitorial kernel cleanup scripts
Message-ID: <8c4e5d62-7980-bd16-df17-caf76862d4f5@crashcourse.ca>
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


  As promised, I have the first small number of kernel cleanup scripts
that should inspire some obvious janitorial work:

  https://crashcourse.ca/doku/doku.php?id=linux_kernel_cleanup

There will be more scripts coming, and a lot of them will address some
rather obvious cleanup that relates to identifying leftover cruft that
was overlooked when something was removed from the kernel -- things
like:

  - are there things being #defined and never referenced?
  - are there things defined in Kconfig files that are never used,
    or vice versa?
  - are there header files that are never included anymore?

  You get the idea. Anyway, peruse what's at that wiki page now and
drop me a note if you have any thoughts for improvement.

rday
