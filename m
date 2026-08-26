Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473B137F727;
	Wed, 26 Aug 2026 19:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.212.143.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787770832; cv=none; b=auhIhhzkp6JSmrjgCxBl7egI2KZOI5gKokRujV2SS0U141NZGyUsHuxVM/1r7C6DoFPD//LE70YVm1GtDyeda+1g6NP86Rtp29313ssf8AyxTBkil4+RLkRMopnfSio7UFaz2xwGVbb5vE+W3smY/19YHCLRE8WRFR6sZ7iTX9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787770832; c=relaxed/simple;
	bh=J0/8AfCyKS13JiIElaRF3I1BOjPaFfN6/NRoQjpTHms=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Q/HmZ1OZkg35i8mI7ucDAFXK+zRAf0gZN2Wp1LJjrbKtZ1Swp+Pwuef8T2qM2HhgPOaV4rwLj1hjTJFFPsxnm+tEF0Oavz74+XHD/hoUMsT2BM8KgODU4QWZ7DRDuPkV1Q5oCCj90WMOfoxQjXo7JeGIYYobmzP6qDmRL37QNv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca; spf=pass smtp.mailfrom=crashcourse.ca; dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b=EW6afU2p; arc=none smtp.client-ip=199.212.143.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="EW6afU2p"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5/gJhfB53t4ZJSQyuluqcSGRJemLpHQ+kDJFN7vISuU=; b=EW6afU2p8HEib2bT/nmvQUHduE
	9RcbHY4rg7ngm78BVkoPPPoIF71Rk82dRulc1KnHliR8K11n984U4am226Vico4oZMz+J9/dBn1RE
	dLb0ADJ3K4x4/1JD/rqujzIEB8aOa4TBIpK20ueztU/0koKxII/EJsoHSEklFRdLpkxad8zMuUApM
	UJMpMvjeAuU6WDNUtr0mPxHyanU9vAvVPRtYbVMUfbCm0WhxaKoZY7Px4E5PHyXpwFf7hwZSMqwP7
	LmgoIwSLODT9ndNYRglRaR2gK+H5fV5Hu/0fB/laCqxD0FmrgR5yOVNCW0aLcwMJ921BjmBJp9RkY
	aw9rjmKg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:47532 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wzIr7-00000001vb5-2FKM;
	Wed, 26 Aug 2026 15:00:14 -0400
Date: Wed, 26 Aug 2026 14:58:18 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Mark Brown <broonie@kernel.org>
cc: Markus Elfring <Markus.Elfring@web.de>, Yang Zi <2959243019@qq.com>, 
    kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] regulator: max8649: Fix NULL pointer dereference in
 probe
In-Reply-To: <0f550622-5a14-47d5-976e-44a20495d751@sirena.org.uk>
Message-ID: <87f6e08c-97e2-cdde-1349-2a95e8e55ad3@crashcourse.ca>
References: <tencent_87EA54368697A49844A89DF7CD19CD8C6C06@qq.com> <29d4c995-4194-49b6-8994-eba662b73b56@web.de> <0f550622-5a14-47d5-976e-44a20495d751@sirena.org.uk>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1780443080-1787770717=:1626628"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1780443080-1787770717=:1626628
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Wed, 26 Aug 2026, Mark Brown wrote:

> On Wed, Aug 26, 2026 at 08:36:29PM +0200, Markus Elfring wrote:
> > …
> > > Add a check and return -EINVAL when pdata is NULL.
>
> > How do you think about to perform this data processing
> > directly after the variable assignment?
>
> Feel free to ignore Markus, he has a long history of sending
> unhelpful review comments and continues to ignore repeated requests
> to stop.

  I've recently wondered how easy it would be to write a "Markus
Elfring Random Suggestion Generator".

rday
--8323329-1780443080-1787770717=:1626628--
