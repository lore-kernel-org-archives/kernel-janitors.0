Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1E11F2BB5
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Jun 2025 20:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.212.143.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751316228; cv=none; b=qxHuyJ1JiXXBDDIhCvRGPH2AydIko3BN+mL1y2chZaykhzNRMJ79oJALEGGVSLdTZEfCXeLJWcCCz3ONZXYe7Hm2yPBsvE7+ZE2pCkOJgSyr3PyBI7Cz0JkRNNYST52WtXog5odbJf4etBedVdu1hU4voP9wSFZPcaLMm0gpdLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751316228; c=relaxed/simple;
	bh=Hl2+BuTIsRx5YflGhLK0Qu87p9i0fcNT+oAY3LuiRHo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LYDHSscPemVHvC+gMTXUvCXUODkGJx5MgwylOQKUrRYbau49rEmykzEphnhsm/W4KcNmnh58GMD3TJuJfTGlrBqyUEZsTAfGcVvOLUQekCY5ZgvYbhTslWWuWzfTjxVKdlXd1wqwl8Z07Q7IuOYLgm4LOnJLKkbf4DcStnCDY0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca; spf=pass smtp.mailfrom=crashcourse.ca; dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b=rVmEdNFg; arc=none smtp.client-ip=199.212.143.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="rVmEdNFg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XRiXNMk+Eywrh4b/g8zccXTSLou0XxOssRWcHFu/K1g=; b=rVmEdNFg17WFytgekuzmZnslN+
	X02OL99vfP27r/7m8zx5i2a/AxWfI1/WVsBZN5sW3AaOg+CAaa3uxSH2t+at5e6armTviCl3vnG0P
	rvy4BAK0jpApaHLvS6844jES0u6k8jYluTNyKgGTewrojtQHQCAp2ZBQbohk0uB/+sLBsCnyFINF1
	daId5lVEMKF+ZrELxpRQqGWI2LRuBEltK+p/enaDRTZtw/7hO961Upt1iFoxt+F4o7oBLnv++2haa
	EEOqA2G9J0aK2CZBtCNpwTJPCkh7zGFQvR48sp7oYW/ofzZg2+twYYQFnmsmJLrMjcZ1xy4wRTlZD
	FOaQrV7A==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:39068 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uWLLq-00000004KvK-1w7I;
	Mon, 30 Jun 2025 16:43:44 -0400
Date: Mon, 30 Jun 2025 16:43:38 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Dan Carpenter <dan.carpenter@linaro.org>
cc: Kernel Janitors List <kernel-janitors@vger.kernel.org>, 
    Lukas Bulwahn <lbulwahn@redhat.com>
Subject: Re: First pass at janitorial kernel cleanup scripts
In-Reply-To: <bc14c7e7-1188-4330-bc0b-cb0a60568cc1@suswa.mountain>
Message-ID: <be53fc9d-529f-50c3-a3b1-f3caba54aad9@crashcourse.ca>
References: <8c4e5d62-7980-bd16-df17-caf76862d4f5@crashcourse.ca> <bc14c7e7-1188-4330-bc0b-cb0a60568cc1@suswa.mountain>
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

On Mon, 30 Jun 2025, Dan Carpenter wrote:

> On Mon, Jun 30, 2025 at 02:02:25PM -0400, Robert P. J. Day wrote:
> >
> >   As promised, I have the first small number of kernel cleanup scripts
> > that should inspire some obvious janitorial work:
> >
> >   https://crashcourse.ca/doku/doku.php?id=linux_kernel_cleanup
> >
> > There will be more scripts coming, and a lot of them will address some
> > rather obvious cleanup that relates to identifying leftover cruft that
> > was overlooked when something was removed from the kernel -- things
> > like:
> >
> >   - are there things being #defined and never referenced?
>
> Quite often people publish these deliberately.  They sort of function
> as documentation.  At one company every time they expose anything
> about the hardware interface it has to be approved by the legal dept
> so they publish every single define that they can possibly think of
> as early as possible so they don't have to go back and forth with
> legal later on.

  Ewwwwwwww ... I do not like that idea. I don't like stuff being
"#define"d unless it's actually required by the proprocessor.
Defining stuff as documentation is just ... ewwwwwwwwww.
>
> >   - are there things defined in Kconfig files that are never used,
> >     or vice versa?
>
> Lukas Bulwahn does a lot of this work already.  It will be interesting
> to see if there is anything his scripts miss.

  Is that the same L. Bulwahn of RISC-V fame? I might need to touch
base.
>
> >   - are there header files that are never included anymore?
>
> That's a good idea.

  I have a script that tracks down exactly that sort of thing. I'm
just cleaning that up now. There seems to still be a fair bit of that.
As a representative example, there is a header file in the kernel
source tree:

  ./sound/soc/amd/include/acp_2_2_enum.h

Does anything include it? Nope:

  $ grep -r acp_2_2_enum.h *
  $

So my scripts still identify plenty of potential cleanup.

More later.

rday
