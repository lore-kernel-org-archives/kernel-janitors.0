Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4877C4C6C
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Jun 2025 21:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.212.143.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751318270; cv=none; b=GJheMNCVMUqbo6DhX2fmUTxb2YJHJofv6Rm+OeVgnqUCLXnBBx5ky+xvQAGNjT2O7N8vffx8YLTZkuEjnQImldcXzg2Ap+Y9qPNOgWLXn/YySZxFZjhUZmV1bXZcppUnn2Yu8JWRAAogJpFaU5E320GRqpslyv876E4cgiXOC3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751318270; c=relaxed/simple;
	bh=60wcfxVf75PjtycQCPIz5PCk2O2UWrU+Ub44Unwi5co=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=AgbO+PMRYbvSpzxxZ/+orVWfYyUqThwVNajkb+khIDWGwEDen+i9Vp3/s5tE7fcLo0EwGto9kJGWu2fnRKlgCWEDpbDRrTwVBrb+DR4UCy3QOKTHdTlgjOz9j/ZqAR41dFKVEBYV8kvsn80ugKfOrDUaJsg+uOLyP93pVLoXQAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca; spf=pass smtp.mailfrom=crashcourse.ca; dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b=MBsSgmQA; arc=none smtp.client-ip=199.212.143.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="MBsSgmQA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9XgV8bSyxrrETayoVKpqW32PCp4hEPZkhi7SW7FUmbg=; b=MBsSgmQAhRLnpUmYXMinzSoLkw
	oHruzhnBe4r9VAOcrwKFBNJ8mUkSRMHzaB1QywDhJq1Ya88jhl24gAi6jtH1wHoTEtfNj+XohUQaL
	6lo9eMy1jl6hiNkw2S8UeH0wyqTM2J1t9JVtx3vwsbbatD1poIFi5yTq3qYp0PqoQGC1t3tTUa8Bc
	2WErC0O7XDRUNj4TYtTe8CCIcpDhaHMqtjzyzpZLtvYok7OUenjNchtMmlxhNg2QdCxRd6tbP6A21
	V39EoYUD5rTsYWJm/AWSXaa8EJJENi+V+06MGsqLZNMn3qsJCB/9dy1UZgI9uydlV3MjJr11/95gq
	IYvNUyrQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:52608 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uWLsm-00000004R9Q-2ph7;
	Mon, 30 Jun 2025 17:17:46 -0400
Date: Mon, 30 Jun 2025 17:17:37 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
cc: Dan Carpenter <dan.carpenter@linaro.org>, 
    Kernel Janitors List <kernel-janitors@vger.kernel.org>, 
    Lukas Bulwahn <lbulwahn@redhat.com>
Subject: Re: [CRM114spam]: Re: First pass at janitorial kernel cleanup
 scripts
In-Reply-To: <aGL95CqAgl90TLPe@gallifrey>
Message-ID: <7901ac78-606d-0543-8e48-7e67a2211cdc@crashcourse.ca>
References: <8c4e5d62-7980-bd16-df17-caf76862d4f5@crashcourse.ca> <bc14c7e7-1188-4330-bc0b-cb0a60568cc1@suswa.mountain> <be53fc9d-529f-50c3-a3b1-f3caba54aad9@crashcourse.ca> <aGL95CqAgl90TLPe@gallifrey>
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

On Mon, 30 Jun 2025, Dr. David Alan Gilbert wrote:

> * Robert P. J. Day (rpjday@crashcourse.ca) wrote:
> > On Mon, 30 Jun 2025, Dan Carpenter wrote:
> >
> > > On Mon, Jun 30, 2025 at 02:02:25PM -0400, Robert P. J. Day wrote:
> > > >
> > > >   As promised, I have the first small number of kernel cleanup scripts
> > > > that should inspire some obvious janitorial work:
> > > >
> > > >   https://crashcourse.ca/doku/doku.php?id=linux_kernel_cleanup
> > > >
> > > > There will be more scripts coming, and a lot of them will address some
> > > > rather obvious cleanup that relates to identifying leftover cruft that
> > > > was overlooked when something was removed from the kernel -- things
> > > > like:
> > > >
> > > >   - are there things being #defined and never referenced?
> > >
> > > Quite often people publish these deliberately.  They sort of function
> > > as documentation.  At one company every time they expose anything
> > > about the hardware interface it has to be approved by the legal dept
> > > so they publish every single define that they can possibly think of
> > > as early as possible so they don't have to go back and forth with
> > > legal later on.
> >
> >   Ewwwwwwww ... I do not like that idea. I don't like stuff being
> > "#define"d unless it's actually required by the proprocessor.
> > Defining stuff as documentation is just ... ewwwwwwwwww.
>
> It's quite common; a set of #defines for every register/function/etc
> in their chip, maybe also for every firmware call with a struct for
> the interface layout.  Sometimes these are spat our semi
> automatically from their hardware group who designed them. On the
> plus side, they don't take up any space in the resulting binary,
> unlike the zillions of unused wrapper functions some drivers have
> for every firmware call/register, many of which aren't used.

  Ah, good point, I had not thought of that. I stand corrected.

rday
