Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1134B1DE894
	for <kernel-janitors@vger.kernel.org>; Sat, 26 Jul 2025 19:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.212.143.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753557396; cv=none; b=D7GCE+IEB/lMSgUymdQ0KJE6PRh5Qar0SZTQyOt/xtBKukKmgfY1wdTNXk9uD5qfJwvRTz7sd1hciblaR46xWxfwq0jB/P5Ni23lN7eUxDrlNLuhjGce4a5C8jBK2dzNfZrC/gvc8vyaZ6ii1bOPzP2O0mAbT1st7ZcZaeTYMAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753557396; c=relaxed/simple;
	bh=rEsPOP0bz2beN/uxeoDthmm3Zk3IoSmi0MZduKfhlfI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=L+VuX63Udiyjx3eGkok1bkjVcv71BwoQYkCl0YmKeaEFOvTCsxcM4FdYmyKLYgtlTrg6IcxNafQhZ9bOZrGDaLUbbiSHmQ0oWcU0HTmNWixDy1KDjClZi3wLw5jsaifXOS5vVEsgs+CwBi+yXK07rocPyCi6txgtS52I1RRTghw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca; spf=pass smtp.mailfrom=crashcourse.ca; dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b=LKG11sVQ; arc=none smtp.client-ip=199.212.143.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="LKG11sVQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YKOta5fYaos4SzOrAb5fxxONfTlKes8xvs6bz+9ds+k=; b=LKG11sVQlmI1vJgWWYERXCEb1h
	0UqmPi0iu4FKAvmtQS1ZsTb+6utnotyri1h1C+voiHoig+Sspr3UdX0klUCkthDx8eE3r/y2kSzLq
	qZwNH0/0qDhZVIGagobtr85C3Z6wTUG3wjMJUs5Td7dbjRvSA3cYS0fpj0Gw6ztF2Hm4BYSDMzZkA
	HRocj54CVpfpXBw7xZk6Xz0H5/SkCx9tUf9tLwCOL6AXITTrgxHSNN+pwanyav1PpFh4dJjj5WIh5
	BsUzqQTiTNt81WLp02DoPuzq46qqFWZd0dtVgcWbNd8UtLKvaQzGR27n/ZEb2pbMEwJ1B41p/2Qoe
	GAifkGrQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:58706 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ufk2D-00000006Aqj-3wJt
	for kernel-janitors@vger.kernel.org;
	Sat, 26 Jul 2025 14:54:21 -0400
Date: Sat, 26 Jul 2025 14:54:16 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Kernel Janitors List <kernel-janitors@vger.kernel.org>
Subject: did people need more suggestions for janitorial work?
Message-ID: <1834fafd-b392-3b3f-b2eb-85598ae9c748@crashcourse.ca>
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


  i still have some scripts that can generate piles of cleanup work.

rday
