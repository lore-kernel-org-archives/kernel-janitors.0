Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09384A35
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Jun 2025 21:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.212.143.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751317705; cv=none; b=T93BjesIdSvgdCAhr5xkLF8OlnRA4J5jPHmEt4q8xyrrrU+xi5pA7cUxOtfmzSJnQWqZzUGhoDMPQ2Lfd1U3jJd6cF9aUTcq9zcl+P8jfcwa1Rn45rwAK+9cN1cto6oqx8zuBPORWwe03M+U+Jl3oG7x8HIh1e5Bq/4Dy85ELaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751317705; c=relaxed/simple;
	bh=yYaBjtmxCGIxhbsoAFCdwTFvxt0jmgq2hDIAGo2UjYg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WjsVK9Ah9rEeilnHKuRwyZmwfdI1FxWLZ6gQ61lU6qKWAl0yEx20eDn7w1JR6BShpOMnx+3/UqxlhAdawnYVqI264G2qwN69k86JASYA80n1Z5czOts6qc30fFJZQwU6+es/r1P4808SQBopBt0MAFp8R/r1E5sd80omhI+PG/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca; spf=pass smtp.mailfrom=crashcourse.ca; dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b=Y8VFjByQ; arc=none smtp.client-ip=199.212.143.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="Y8VFjByQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6GYjJg+Zwhrzex6vx+08oBtiqh61CDvTFA7yFXID7xo=; b=Y8VFjByQxneCRi7hNlToQ9edwN
	9brKdw8gSNb6AZkfK4MoN4oyeK8l5VuG2bT5RAseaDxq07aDGuQaq/AeXdhAGNX7BFHzX8HAfisxH
	LRREBgFxLq18GAxzC7EsJwzJzXL2uMuH4920lCxoxleZ1+sRIAva0JZLneUh/rcWi6nD+K7VYfrj8
	TPOHq9TmYFsViIoc46a8js7ZQWp8DkEjwqlxIISb/i2FWuRJ5Y/GZ9Z7wFctwdr1/4V/uQhg3AASd
	NmSSonkm7HjLhAJOfzazhRcoqY+kSNhSRX7GLijLelXH9V+NesnAkpejMfUyQ8r6Z4M6CKG8sK//C
	d9RRc3Jw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:43458 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uWLjf-00000004Ph8-1eXp;
	Mon, 30 Jun 2025 17:08:20 -0400
Date: Mon, 30 Jun 2025 17:08:10 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Dan Carpenter <dan.carpenter@linaro.org>
cc: Kernel Janitors List <kernel-janitors@vger.kernel.org>, 
    Lukas Bulwahn <lbulwahn@redhat.com>
Subject: Re: First pass at janitorial kernel cleanup scripts
In-Reply-To: <f4f8cf3e-cbf3-4835-ba02-f5414f772a89@suswa.mountain>
Message-ID: <41ad42b3-dbbc-e511-807a-6d69cec6a34a@crashcourse.ca>
References: <8c4e5d62-7980-bd16-df17-caf76862d4f5@crashcourse.ca> <bc14c7e7-1188-4330-bc0b-cb0a60568cc1@suswa.mountain> <be53fc9d-529f-50c3-a3b1-f3caba54aad9@crashcourse.ca> <f4f8cf3e-cbf3-4835-ba02-f5414f772a89@suswa.mountain>
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

On Tue, 1 Jul 2025, Dan Carpenter wrote:

> On Mon, Jun 30, 2025 at 04:43:38PM -0400, Robert P. J. Day wrote:
> > > >   - are there header files that are never included anymore?
> > >
> > > That's a good idea.
> >
> >   I have a script that tracks down exactly that sort of thing. I'm
> > just cleaning that up now. There seems to still be a fair bit of that.
> > As a representative example, there is a header file in the kernel
> > source tree:
> >
> >   ./sound/soc/amd/include/acp_2_2_enum.h
> >
> > Does anything include it? Nope:
> >
> >   $ grep -r acp_2_2_enum.h *
> >   $
> >
> > So my scripts still identify plenty of potential cleanup.
>
> Yeah...  acp_2_2_enum.h was never used.  But AMD is the company I was
> thinking about which does some of these things to work around
> complications with legal.  There is a probably a reason for the header
> file to exist.
>
> I feel like we have to tie this with a commit the removed the last user.

  Totally agree ... in fact, I added a note to my kernel cleanup wiki
page about using "git log" to track down references to stuff to see
when/why it was removed to more completely understand if something is
*truly* removable.

  As an example, I ran my "find unused headers" script against the
arch/mips directory, and got the following:

===== amon.h =====
./arch/mips/include/asm/amon.h
===== bcm1480_l2c.h =====
./arch/mips/include/asm/sibyte/bcm1480_l2c.h
arch/mips/include/asm/sibyte/bcm1480_l2c.h:    *  L2 Cache constants
and macros		File: bcm1480_l2c.h
===== bcm1480_mc.h =====
./arch/mips/include/asm/sibyte/bcm1480_mc.h
arch/mips/include/asm/sibyte/bcm1480_mc.h:    *  Memory Controller
constants		File: bcm1480_mc.h
===== sb1250_l2c.h =====
./arch/mips/include/asm/sibyte/sb1250_l2c.h
arch/mips/include/asm/sibyte/sb1250_l2c.h:    *  L2 Cache constants
and macros		File: sb1250_l2c.h
===== sb1250_ldt.h =====
./arch/mips/include/asm/sibyte/sb1250_ldt.h
arch/mips/include/asm/sibyte/sb1250_ldt.h:    *  LDT constants
File: sb1250_ldt.h
===== sb1250_mc.h =====
./arch/mips/include/asm/sibyte/sb1250_mc.h
arch/mips/include/asm/sibyte/sb1250_mc.h:    *  Memory Controller
constants		File: sb1250_mc.h
===== sb1250_syncser.h =====
./arch/mips/include/asm/sibyte/sb1250_syncser.h
arch/mips/include/asm/sibyte/sb1250_syncser.h:    *  Synchronous
Serial Constants		 File: sb1250_syncser.h
===== sead3-addr.h =====
./arch/mips/include/asm/mips-boards/sead3-addr.h


As best I can tell, those are header files that are not referenced
from anywhere in the kernel tree.

This is the next script I will add to my wiki page -- there is still a
*buttload* of cleanup ready for someone to tackle.

rday
