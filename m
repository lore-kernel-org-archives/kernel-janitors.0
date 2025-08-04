Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5D61B4F2C
	for <kernel-janitors@vger.kernel.org>; Mon,  4 Aug 2025 12:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.212.143.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754309108; cv=none; b=Pyy8j69cq7QwrnpAbapNYy2mWQm/g2ktuzCKjujVyIx8dZFo09G0+UiW+ehEffLfrc66mhjBGFb7dLdH1tVYoiEjShIOZMr8NDQpd20evlCahkhhNUb8VZ+8Lcwt1pCwG7t8ThzvnScXPc6xEKSMuFjilALJjkSWGgDf/ZJxj60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754309108; c=relaxed/simple;
	bh=Vhv0edcHmDwmwelwuVOroh0Xqv6CGCD+9+io9Xcz5dk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=NlXnrQr/YQPy3rUUE2PKLMZJ8OoHci7ioEjy5KqTz95vkZ9isxYDVm9/e0FDk2AcNHH/o34SJbPDTP9zdm/K/SvzTGyUGHYNbWYq8PPUGnH9vdRHBaUVQJ6M05fyDV/A8QZrFx/SjasLwAYiS+2r9bMigKwp4YKIYJPWfVxc3DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca; spf=pass smtp.mailfrom=crashcourse.ca; dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b=ltLiPp+d; arc=none smtp.client-ip=199.212.143.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="ltLiPp+d"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mVoWy86z7OOVoJMe7pB/fNI+1nHlMzWkf7No1GxEcpo=; b=ltLiPp+dYX2c5bgfbGcYvHCL+9
	+gI5/+hCBFFHNHDjVNOwFgr7jd3opQPVcrEiETc/zVfs0jDfCpCEAocbDVqt3Z1M8KcIdsdVmZEBR
	pZiJd9Ci5Rc8EJII0XRABeiHgLtkedjWNOHnGM+ufJ6rMPZBBgqrtyrW9GkXxrEeobkPM/tDpeNBx
	BL5ecMEX19ogOYhzPSz5dJpi5Nu1YKPDXr+ujpTZlCIXam2K94yoy9OgG4XcywG4VKVkMduOj9rVe
	o0YdANsz/huramxdQaL4fpzSEQI8sgjaLgElNJYPjctxonVbIrgfqjaavGq4ikNBScgviN/1TEhFG
	Rr2/6WVw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:56572 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uitw1-00000003xb9-1ES3
	for kernel-janitors@vger.kernel.org;
	Mon, 04 Aug 2025 08:04:58 -0400
Date: Mon, 4 Aug 2025 08:04:51 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Kernel Janitors List <kernel-janitors@vger.kernel.org>
Subject: are people still looking for more KJ work?
Message-ID: <df5ea26e-3bac-7c33-30b8-de5913ec5703@crashcourse.ca>
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


  so far, i've listed three areas that -- even after all these years
-- still need care and feeding; they were:

  1) replacing manual testing with the ARRAY_SIZE() macro
  2) replacing "n & (n-1)" testing with "is_power_of_2(n)" call
  3) simplifying Kconfig files by wrapping sections in

	if FUBAR
	... lots of Kconfig stuff
	endif

is that enough to keep people busy who want to do some janitor stuff?

rday
