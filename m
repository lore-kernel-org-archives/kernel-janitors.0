Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B6715530C
	for <kernel-janitors@vger.kernel.org>; Fri,  1 Aug 2025 14:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.212.143.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754058657; cv=none; b=OZxvnbLD5pnj96KedsqpyAJnS8FOYd621dJry9bnDm09Ischw/uShktOfT5OyauLocqdzOg5AMweapNAHdq+3sgcHm+deoxbEZ4j+e9EO0/pPZG//rMIYdoVvIZTmnfixjJs7Sz7fbJq5+tpgZiTqzU+WWzpwOtWVhNo8tTl6YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754058657; c=relaxed/simple;
	bh=Pza5Qr/wCKDDs/JBxFykDNxGY7pIDJaDNVIppF2pcvo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=XPYA9/wf/3k3mHhPm6Vgr4ILtZruoETBsu+8JWmwLVQSLXfJglvcVHI7FhhlPfBtrgh9SOazHxdGxY7flbBDGnCdakq8IFhpQr/3IuqGriflnjYyEKRaIGNeZ5MMuhuMhQA6R2qx8BE/J9cKClnaEq4xZoJt1XOEmTV77djGZZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca; spf=pass smtp.mailfrom=crashcourse.ca; dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b=kywNJ3CO; arc=none smtp.client-ip=199.212.143.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="kywNJ3CO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5gfOU3oxjw/8PHaLa6A5w82s6JHlAxgf6U3MKG0ugHQ=; b=kywNJ3COJ9/QjFAJR29TpQCD2q
	fnANP7L4n1xNZ1vc71G02FTAFQzr/U/EFgThMiGYLJvI2R2ehsgdSzbAdwaSAGyLk9r6qobO0Vc6J
	1YPsJbm7LMUkEdQI0n1vO24euWs1EiuPb5DBYP7F81zJadOfIL+oROjRgd/1eT7Fcuh3uD9ypEPe/
	Ldp1enH/GGWdKMECFenYIdWh75FKTxK4RWQJw5RyTin3q+qiW6um4odcMUc9gHA/YynhYcKHfNNn2
	OC6cLlaJwChMY21iT4Y1PtgM4IHNt9vyPoI8A59LPUR2PQ0bRYoYAM05WsOt+EN6KbjmI/qoK4+j5
	w/+iHTSQ==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:45408 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uhqmX-0000000A81E-2x4L
	for kernel-janitors@vger.kernel.org;
	Fri, 01 Aug 2025 10:30:53 -0400
Date: Fri, 1 Aug 2025 10:30:38 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Kernel Janitors List <kernel-janitors@vger.kernel.org>
Subject: followup to earlier post on simplifying Kconfig files
Message-ID: <f04d3be5-d13d-604b-d8ea-1a42a1702a64@crashcourse.ca>
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


  a good location to check for possible Kconfig simplification is in
the kernel's drivers/phy subdirectories:

https://github.com/torvalds/linux/tree/master/drivers/phy

  for example, check the freescale Kconfig file, where it appears that
everything could be wrapped in:

  if OF

  ...

  endif



rday
