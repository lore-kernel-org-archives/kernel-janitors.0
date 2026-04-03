Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A863B1B3
	for <kernel-janitors@vger.kernel.org>; Fri,  3 Apr 2026 00:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775174585; cv=none; b=oYUgq8NaSsAY3qDfIzufGF7OPY4dFdBfJ0+sBRSyT5AH7XUI21L8rlC8oc4aKrNdHCmekCaEb2syVHEd5gUbqu4h//Ll0wuf0EkPxC5oVLk7hdH4Cp20/BYGG3VvOaZTzkiN/H5bcG+Se6K39uYeYvVlpMhk0kgkqSh2bqjwG+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775174585; c=relaxed/simple;
	bh=5GvwUnQAVH8sIiR1SN4DbGAUyYDsKJNQdcNnL1o25cY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hwX2dBVn+Ahd/wbFpX+29dYtnOprUAzM79ZnKAApUTCUNNkNOi/k3+V8A8fOUMa+J07+6en7we2QVlyhTv7qEx5GWNFDXzbgxqTWaDm62Np/xMyC8nYlS16RMQXieIMIY7zYnA8Qkz2/gG7+nrdHntJyiMC7jePE1PGGlwa7oEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=QriCHC+7; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="QriCHC+7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=fKLvFuTVLzu695X5EDa90DrhHFNYYkFYjfP64mWrAzE=;
  b=QriCHC+7EbXd6nX3wkneIawxeDQBlB9Qvg2ahYBBrvTBxmr8Abrnv8I3
   FD477CHFsXk/BUg3WavhtBwXOwKrjws3hrfgH83OmO4ozy4M6FvFFqMHk
   0+IN/1T1E5WAAHHF90OoI5TSh989EXqQDJ69i6q/d11yFumQvGUAIRmCp
   I=;
X-CSE-ConnectionGUID: +Q7BuMEPT4GbjesbteEDbw==
X-CSE-MsgGUID: 3hYoDiQBQTyVUf8Z7700eA==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.23,156,1770591600"; 
   d="scan'208";a="270834020"
Received: from c-76-123-3-53.hsd1.va.comcast.net (HELO hadrien) ([76.123.3.53])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 02:01:50 +0200
Date: Thu, 2 Apr 2026 20:01:47 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Linus Probert <linus.probert@gmail.com>
cc: Dan Carpenter <error27@gmail.com>, 
    "Robert P. J. Day" <rpjday@crashcourse.ca>, 
    kernel-janitors@vger.kernel.org
Subject: Re: Status of kernel-janitors?
In-Reply-To: <DHJ074MZJ7KP.300Y06YAUW7IX@gmail.com>
Message-ID: <245d14b-6f1b-1ece-a73-2021fabecd6@inria.fr>
References: <acpeJQEPtDKQ68uo@mosquito> <e25aa771-d3d2-4b93-31b8-15576e1d9512@crashcourse.ca> <acrhsqvXp4R-egW4@stanley.mountain> <DHJ074MZJ7KP.300Y06YAUW7IX@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Thu, 2 Apr 2026, Linus Probert wrote:

> On Mon Mar 30, 2026 at 10:48 PM CEST, Dan Carpenter wrote:
> > On Mon, Mar 30, 2026 at 09:27:25AM -0400, Robert P. J. Day wrote:
> >> On Mon, 30 Mar 2026, Linus Probert wrote:
>
> [...]
>
> > There is a coccinelle check for this already.  I don't know why it
> > hasn't been done to NUM_ELEMENTS().
> >
> > scripts/coccinelle/misc/array_size.cocci
>
> So. I have patches for the amd gpu which I can submit. Just not sure if
> these have been left out for a reason or if the coccinelle check just
> missed these.
>
> I'm also not 100% sure where I send them. I made the changes on my local
> staging-testing clone/branch. But these drivers are not in staging. Do
> they still go through the same channels?
>
> This is the gist of it:
>
> - drm/amd/display: Remove unused NUM_ELEMENTS macros
> - drm/amd/display: Replace inline NUM_ELEMENTS macro with ARRAY_SIZE
>
> Some guidance on this would be most welcome.

You can use the get_maintainer.pl script to find out who could be
interested.  You could use the following options to avoid getting too many
people:

--nokeywords --nogit --nogit-fallback --norolestats

julia
