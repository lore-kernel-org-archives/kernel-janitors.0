Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC6E2E285C
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Mar 2026 21:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.212.143.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774904930; cv=none; b=segy/B6ZK6XRW1CsJaYCvfXSCSCY2fOJNhMvp/e7PJrLkiYFguVxJtkD0vhCntLIRdDzHJkHc0wtc9SEO1PUxbp6o9w96Ln2i4QkBTfNAyhzV06tVD8RLQwRH3tzLVcEN6KVUi1WcVxb043dBNKv0ypKKVUWFdNUKVa7lo4S6Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774904930; c=relaxed/simple;
	bh=h6jX7B0TIi72AAyByIJLydTYvyq8FOA8/NZpjMggoYs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=o8WdZ0D3kCYeoHGQMANy5dFO0Z4kpup9MVj1M9NYraJ2yTG3gy86FMA3F5u66yt9V3OVOf04xx+azyit6mqQA5c2mPqNXhwzNqVotvcwSZS2HjHrRU3T0HRkqJlEbsd8n5Xi8nEpbFhIfjneJkvZyuXigfCAx5eB8EUUkHPPbDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca; spf=pass smtp.mailfrom=crashcourse.ca; dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b=Nwn/jSYN; arc=none smtp.client-ip=199.212.143.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="Nwn/jSYN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1b3vV57Hezpk5YkxyWZbkHMw1GD/cPyTvRkEd2To3mI=; b=Nwn/jSYNbgYTQs1Y81QsgaYZ0L
	rOniCfdgp9xsRLnbeFN1Q1g+Nrjuoo0B4JClPylmCMR0AB8SBd/CqhCbJqScfACAvylkEPMPa6dr6
	cm108gZXTYBuAozsAJo8aB0GANej8ByewjHNlrhN9gfqo4dcCt6iesQULxk4K6/+G7ED0rUBXvtF+
	fe8u57KmzvsuFXKk8rcn8yhBetXHZziTEMFOLnt7cWztZTJqFtiiCxrId/1RbXcGmuT5pTfQAmOoe
	vkLQNWzljdaflgRmuRTUeXVKmcHF0O+lrtaez9K5qVspyZAH1osEcJ4+ka+EadSaOWeqx/OdiP0sr
	HJPb7ifg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:47172 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1w7Jqn-000000021EO-2dTv;
	Mon, 30 Mar 2026 17:08:46 -0400
Date: Mon, 30 Mar 2026 17:09:31 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Dan Carpenter <error27@gmail.com>
cc: Linus Probert <linus.probert@gmail.com>, kernel-janitors@vger.kernel.org
Subject: Re: Status of kernel-janitors?
In-Reply-To: <acrhsqvXp4R-egW4@stanley.mountain>
Message-ID: <4e4529f2-681b-00b2-1cef-36e50c1bc779@crashcourse.ca>
References: <acpeJQEPtDKQ68uo@mosquito> <e25aa771-d3d2-4b93-31b8-15576e1d9512@crashcourse.ca> <acrhsqvXp4R-egW4@stanley.mountain>
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

On Mon, 30 Mar 2026, Dan Carpenter wrote:

> On Mon, Mar 30, 2026 at 09:27:25AM -0400, Robert P. J. Day wrote:
> > On Mon, 30 Mar 2026, Linus Probert wrote:
> >
> > > Hello,
> > >
> > > I've been a long time builder and fiddler of kernel source. Running
> > > self-compiled kernels and pulling in patches before official release
> > > etc. Bog standard for most of you I assume.
> > >
> > > I'd love to dedicate some spare to help the project. Like so many
> > > others.
> > >
> > > The kernel-janoitors "project" does pop up in various resources such as
> > > kernelnewbies and I think it might have been mentioned in one of the
> > > Linux Foundations free courses. But links to potential homepages seem to
> > > be dead and resources are sometimes dated.
> > >
> > > I read somewhere that this has mostly evolved into janitorial work in
> > > drivers/staging. TODOs were mentioned.
> > >
> > > So the actual question. In my mind janitorial code work is a good place
> > > to dip ones toes when starting out. Is this the right mailing list to
> > > ask about such things? Any suggestions to find an area where ones
> > > assistance would be welcome?
> > >
> > > I'm aware of checkpatch.pl but for many drivers diverging from these
> > > rules seem intentional and just blindly fixing checkpatch warnings are
> > > not helpful to the maintainer.
> > > Open source is a lot of work so the goal would be to be helpful while
> > > not stealing too much attention from concerned parties.
> >
> >   I mention this once in a while ... *many* years ago, I wrote some
> > admittedly hacky scripts that scanned the kernel source tree looking
> > for what I considered "obvious" cleanups. One of those cleanups was to
> > abbreviate the numerous calculations of the length of an array
> > sprinkled throughout the source code,
>
> There is a coccinelle check for this already.  I don't know why it
> hasn't been done to NUM_ELEMENTS().

  ah, i should have assumed there was a coccinelle check for that. in
order to be truly comprehensive, maybe you really need to attack the
problem with an ugly regex when the pretty stuff fails.

rday
