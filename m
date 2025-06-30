Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F03929C33C
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Jun 2025 17:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.212.143.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751304497; cv=none; b=jlPtxh6/5ZEC7r+zDSs9mrDwhIte8hz+40Vm4j66l6OwBNW2NdujfvCpHT+o+qZugOg8vFMNiqFIbvlJLUfCKT3x3h9L+MhQfdSQILnhhNmQly4PQS9l5D0OaEhQQL+Nln6QQJUPPTzOP78E/5DDfmXffpGCx7oLuAwy8zLhOUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751304497; c=relaxed/simple;
	bh=3IC2WsSgkf0BL6wofGonrfPkrT49IP2HmJAISGvp640=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nMKMKE3TSpiyBIfErJxGRPYRw13fYzW1oXfY/xMWe8ajp8dgl/ferNN/j0+wVlP/G0YI56gccU6zzFiFBue3Tg0wxHncm6dnnyisiM+y9ga2Ev6JNGLUqZsLCj4bQONkrfcWDJisY+y1fxSIFMPjXC9h6heWsgS53lgT8fACDpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca; spf=pass smtp.mailfrom=crashcourse.ca; dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b=sbJjVy8X; arc=none smtp.client-ip=199.212.143.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="sbJjVy8X"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1fJPLEA3g6dKIf7gewD7fV63AqgCsKhgtAoS0BTTOfo=; b=sbJjVy8XzwuzXhlFnAs2AMo09b
	1TdsC3nioRc7HDU+Dp8O+bU2TvMVvLyu7Nln3b4tGKcakddDt9RcCYqkE1ve58j6Dur+OVYj9is2h
	gQFcZh/2cqs7qHnwpMisQoeFhyPvWTEVn2g9OnkKG0GYmgft2CvoHy0Ja5mG8sA6VITQueghbZlTY
	9kT0vQMAM9hYqPUCLsmYwgp9IJyXbG0So/kdLRO+WSmd1pm77DVyZ4th1Up2Cz64xfvvjfHcfzpJN
	lN8ve7IAhmFI9QKv3c7XS3oBVhDcarkLs1bs5A3Qd0bL+U+u3VW1ZcMlu7PH8xp76ic9NYAV6SUMi
	Sh87Zjog==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:51748 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uWIIc-00000003oha-0kfH;
	Mon, 30 Jun 2025 13:28:12 -0400
Date: Mon, 30 Jun 2025 13:27:48 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Charalampos Mitrodimas <charmitro@posteo.net>
cc: Ruben Wauters <rubenru09@aol.com>, 
    Kernel Janitors List <kernel-janitors@vger.kernel.org>
Subject: Re: I have a pile of potential janitorial work for interested
 parties
In-Reply-To: <87sejhyz2f.fsf@posteo.net>
Message-ID: <cc734039-f184-27fa-9bb4-9abc02c8ae7d@crashcourse.ca>
References: <ebfb23a6-def8-24a8-8958-28213a3c0da5@crashcourse.ca> <62bf7393f9314ff875e5eebf6575b72997a6fd2e.camel@aol.com> <84115bf4-bb53-3ebc-4076-5dae087fa4be@crashcourse.ca> <87sejhyz2f.fsf@posteo.net>
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

On Mon, 30 Jun 2025, Charalampos Mitrodimas wrote:

> "Robert P. J. Day" <rpjday@crashcourse.ca> writes:
>
> > On Mon, 30 Jun 2025, Ruben Wauters wrote:
> >
> > ... snip ...
> >
> >> Hello,
> >>
> >> Thank you for highlighting this, I believe this is a good target for
> >> cleanup, and I would be interested in any other scripts you have
> >> that provide similar information.
> >>
> >> I am fairly new to linux kernel development in general, not having a
> >> large amount of patches to my name, however, opportunities for
> >> cleanup and janitorial work, while often neglected by other
> >> programmers for larger features, still are important in my opinion,
> >> as it creates a more maintainable and cleaner codebase, as such I
> >> would be very much interested in any cleanup opportunities.
> >
> > I started documenting these potential cleanups here:
> >
> > https://crashcourse.ca/doku/doku.php?id=linux_kernel_cleanup
> >
> > so anyone who's interested can start processing whatever parts of the
> > kernel source tree that interests them.
>
> Hi Robert,
>
> This is going to be very helpful to newcomers that are looking forward
> to contributing to the Linux kernel.
>
> Looking at your list, the tools are awesome and well-thought. But I
> believe some guidelines can be put in-place for some, so folks can get
> their patches upstream easily, and of course, have some confidence in
> it.
>
> One guideline that came to mind almost immediately is regarding the
> tools "Calculating the length of an array" is that people should pick a
> subsystem and send a patchset, i.e. do not send a massive change that
> changes code under more than one Kernel subsystem.
>
> This approach respects maintainer, and simplifies the review process.

  I added a note to that effect early on that page.

rday
