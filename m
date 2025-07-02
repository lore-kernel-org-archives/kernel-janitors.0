Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE66211F
	for <kernel-janitors@vger.kernel.org>; Wed,  2 Jul 2025 18:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.212.143.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751482034; cv=none; b=MHYy2HncWwr5pBTP05UBgsiyGyaRYTgXInQoz8pgM0FTQRYqRG7EpecCN2YlDCVomF1Z7QDFqlbd1fK6swVhnP5hRTHhF8sMI4V6zQv47TZ88hEz1kFtOC2dF1JvlLnyTRWQnj6J2JlKltxgyi2OArqTkR+v59UDLgLzYM3sKPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751482034; c=relaxed/simple;
	bh=Txt10qIUhlFVw68rtjJcznfXLR7J17RIa6U/gVgEu5o=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XqdmwS/oeoBFptS4a5oAM08ngQbgYKBJYbWYP9QUJUE20gfESgtHUHRVcYJxCBS3fu+Ir8kYj8Ju6hzmGmgu7LwAqVynU/iT4dW0ff5pEMKe4c9wZY74iVAWyz1FFzy6sgF5xW7O8zb3Fi36K/Qb8mLZ8IO996Z6b8APoubSVK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca; spf=pass smtp.mailfrom=crashcourse.ca; dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b=OMrd8Cjm; arc=none smtp.client-ip=199.212.143.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="OMrd8Cjm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bYlAfk4oWklvVZ7lFif8mZBJ5IS6B/zXwMc4N7A1D9U=; b=OMrd8CjmC5zOvpCi9EPE/6OKuy
	LRSQdCtkb+b+Llgz2hntN23ddNg4laCoYqbyphFZb2TVEHP+ABOeKevTuRTzRrLjeyD9jG0yBcJtb
	nbc8HD7MhVdt/Uk1odnbSmqNqzEhExq9A+rapuRfn5vHle1EVYfkZqEHk8H5O+mu5pbSaQrY4YlFO
	NF/YOb6z02hCGDkhRkLSI283z2I0EebjAZ39p3BrXw3gQyf+8iG3ZCojBnz034czc34n4W3w3YIuV
	muvUSAuYDTIGz2vQIzvDwq96ykfVgW7K09sOkZIXVMjGtpQyedAB2au4viP7MKy/A7ctZm5C7+3B3
	OAAfuDRQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:49444 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uX2Tx-0000000EhwB-2iRZ;
	Wed, 02 Jul 2025 14:47:09 -0400
Date: Wed, 2 Jul 2025 14:46:51 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Ruben Wauters <rubenru09@aol.com>
cc: Kernel Janitors List <kernel-janitors@vger.kernel.org>
Subject: Re: Kernel Janitor resources/organisation
In-Reply-To: <13d16a8095e0e0b0dd1ff8a0838aa3e9c743a487.camel@aol.com>
Message-ID: <8251d76c-12c9-b526-a1cd-c515b190fcdb@crashcourse.ca>
References: <13d16a8095e0e0b0dd1ff8a0838aa3e9c743a487.camel.ref@aol.com> <13d16a8095e0e0b0dd1ff8a0838aa3e9c743a487.camel@aol.com>
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

On Wed, 2 Jul 2025, Ruben Wauters wrote:

> Hello
>
> With the introduction of Robert P.J. Day's janitor scripts, the
> kernel janitor mailing list seems to be receiving more activity now.
>
> I wanted to ask about resources. I know there is a page for kernel
> janitors on the kernel newbies project page located here:
> https://kernelnewbies.org/KernelJanitors However, the above page
> appears to be quite out of date, and I'm unsure how relevant the
> listed todo items still are.
>
> There also seems to be a google code page? Google code of course no
> longer exists, so I am unsure what the relevance of it is.
>
> Overall based on activity of the mailing list it doesn't seem like
> the kernel janitor project is pretty active. I personally think it
> is important however to keep the codebase maintainable, and I do
> also think that common resources, techniques etc should be
> documented *somewhere*.
>
> As such, I wanted to ask if there is a common point of documentation
> that I do not know of, or whether the newbies page is still the best
> resource for it.
>
> I do think the recent scripts (as well as any other relevant
> scripts) should be linked somewhere "official", as they seem
> incredibly useful (I've already sent a patch replacing a removed
> Kconfig option with the proper one that was missed when the original
> one was removed).
>
> I guess in a way I'm wondering as well on the organisation of the
> janitor's project. Is there a leader of the project? maintainers?
> It's not exactly a subsystem so it may not make sense, but it does
> also seem like it'd be good for newbies if there were people to flag
> what should be done or what might be worth investing time into.
>
> Sorry if this is a bit incoherent, it's a bunch of thoughts I had, I
> think for me the janitor project is probably worth a lot of my time
> so I wish to get involved a lot more.
>
> Ruben Wauters

  As I mentioned, the scripts I've been dishing out were written about
15 years ago, they are not elegant or sophisticated, and I haven't
followed whatever happened with the "kernel janitors" effort for about
that long. So this is pretty much a, "Hey, here's some stuff I used to
do for kernel janitorial work, others are welcome to pick up where I
left off."

  I'll add an introductory section to my wiki page as to what inspired
me to start thinking about janitor work, but a lot of it was just
perusing the code, noticing patterns of what could be improved, and
tackling stuff like that one item at a time. What I'm saying is that
no one needs to work on just the stuff I'm putting out there -- use
your imagination and ponder what sorts of things could use cleanup.

  More later.

rday
