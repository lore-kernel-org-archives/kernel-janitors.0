Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC542868A6
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Jun 2025 15:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.212.143.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751296551; cv=none; b=dkmcc1Xn+fmlG8DVnOT20BDU1Z7gtDAh78Nv4TZfTH/oBADROborv5oblz+6ORx9aPbLsX0iFL2NVWzblkuoVi+M63szxVD9a3xcdpQRBwHRUO6ii5QAgTh3Hq6f+VK5WCR9YZvk5DbC5sZxhzwSookt5gby87F5oX5dTLWdbWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751296551; c=relaxed/simple;
	bh=9g6ngMx8rqdoSKUU2ENG5fm6UQ21sRYaUPOefz2MCjk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gmywnu21sGwiRGEeeGT30rAgoBRUxTMHQgNM+WB2Iv+oBVeDqo02Qx9m+pfK1fadJWmlSjfDzxnQe4rFIcOt3EYQ5HMa7sXQ1eb8Nld0fRgXV7HKxXuauxWyI6aeQTD8XslZv8p/TYMvY+cIFBEZp7bb+94EJ11vv4JfHv10I60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca; spf=pass smtp.mailfrom=crashcourse.ca; dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b=I3GXtOIO; arc=none smtp.client-ip=199.212.143.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="I3GXtOIO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9g6ngMx8rqdoSKUU2ENG5fm6UQ21sRYaUPOefz2MCjk=; b=I3GXtOIOfpFHfsfQYoHKwHEHPw
	yaHb42SCkYBZwERWKVh/MSDHsu2GKEwyfz8aBUq6ylarXOFFpLeI+Sl5rjxyBY/4RYplldgzZaUe4
	JSVUPm2feIMDknbHlv+z0uaGeI+3B4YOxKHQtWZ/BLXDMaaSw0FhckdmNLHs0eLkt3R5/Jl+ZVcN3
	POErPw/4KSi0YRFhA5vcf5GOyETPQbvm58WzeDOKVaXuLAAEzkVF67+IRvL6thJ+vOHp1n/nKnZyq
	gGV1y4jkKi1NAegH3mbgZjqtubV+1kzrtndlH38btl4WNjPta2bJYd2EoXyp4zcPI5btjlu2W8VPS
	0rn16VkA==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:49576 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uWGEL-00000003Lad-3nEl;
	Mon, 30 Jun 2025 11:15:41 -0400
Date: Mon, 30 Jun 2025 11:15:31 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Ruben Wauters <rubenru09@aol.com>
cc: Kernel Janitors List <kernel-janitors@vger.kernel.org>
Subject: Re: I have a pile of potential janitorial work for interested
 parties
In-Reply-To: <62bf7393f9314ff875e5eebf6575b72997a6fd2e.camel@aol.com>
Message-ID: <84115bf4-bb53-3ebc-4076-5dae087fa4be@crashcourse.ca>
References: <ebfb23a6-def8-24a8-8958-28213a3c0da5@crashcourse.ca> <62bf7393f9314ff875e5eebf6575b72997a6fd2e.camel@aol.com>
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

On Mon, 30 Jun 2025, Ruben Wauters wrote:

... snip ...

> Hello,
>
> Thank you for highlighting this, I believe this is a good target for
> cleanup, and I would be interested in any other scripts you have
> that provide similar information.
>
> I am fairly new to linux kernel development in general, not having a
> large amount of patches to my name, however, opportunities for
> cleanup and janitorial work, while often neglected by other
> programmers for larger features, still are important in my opinion,
> as it creates a more maintainable and cleaner codebase, as such I
> would be very much interested in any cleanup opportunities.

I started documenting these potential cleanups here:

https://crashcourse.ca/doku/doku.php?id=linux_kernel_cleanup

so anyone who's interested can start processing whatever parts of the
kernel source tree that interests them.

There will be more cleanup scripts coming over the next few days.

rday
