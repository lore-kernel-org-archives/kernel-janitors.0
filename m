Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D698C1FB2
	for <kernel-janitors@vger.kernel.org>; Wed, 29 May 2024 12:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716987016; cv=none; b=D324RdXlpi9woQVdQkAA+/M5Y7Vtjh0EuOMIRwTQbcnRKIlvUzw3SCthzhnkP++42RyvBg+8dHeBRE0993cGmiZUi+OdxO9/0PG4izytNBmSDsyBhA4NMpgPZZg0drj+lY+xKQYU5xFJnvEekrLEG2YzSy1WwDPMOvnD0mUIJZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716987016; c=relaxed/simple;
	bh=Fnhx9Ylg6M3O6+xg2M50ElbDPTLFYFyKP0zb7I/aitA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P8zTTOTuGXsoCb51GrsL2mFT6g73Cw3r7Ow66e6xI02r0lJrAVkxin3DG/Gg1EDte9igFpgRXt/HOgV1b7Y8cwQwXTOPbiR8E8F07q+TCvuxC5Sdzc4iCB0ErmHpG/FPwtIYfKKEwxIkrm4ewz2RGETnvxiVS8b35zQVPYqpsnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=TEka3UIJ; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="TEka3UIJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=r36bhOmN3Bx2P63NRl9wAnVpJThBMy8ADPsdG74PdjU=; b=TEka3UIJrzeZYoY5
	zYTVR1NQ69zo4rre5o9zGE/fs9rTXcshHDmtY73YTU9kCVx9YpBWgZgflD7pYRBPjgU09eLzkxiQp
	HUj51II05IQldgtWmaXHVwHr1sF34Jt5mYtc6gauLXnkpARfLK8OKY3O+ryjoZwcXEhRalk12PG5R
	WcGPaLdFSQz7+HyEINw0OI5HyW4x1wh57VzbhDgYyeUpysau0grlXC30iTw08SsvsYtayvzEqw0Su
	MmRmqFeUs/wreQa6toZqL93j1NoqMkPZxPHZFK3ZylUxQToh4l35w+cWcuKY1U1s7Dul3HkbJhBCL
	bI3UOwliO41f3Rz0gw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1sCIkt-003BB4-0N;
	Wed, 29 May 2024 12:50:11 +0000
Date: Wed, 29 May 2024 12:50:11 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Julia Lawall <julia.lawall@inria.fr>, cocci@inria.fr,
	kernel-janitors@vger.kernel.org
Subject: Re: [cocci] Looking at guard usage (with SmPL)
Message-ID: <Zlckg1LH-2TBew85@gallifrey>
References: <7eb9626c-da7b-414d-bf50-da1eed27be31@web.de>
 <alpine.DEB.2.22.394.2405261847380.16852@hadrien>
 <2dc6a1c7-79bf-42e3-95cc-599a1e154f57@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2dc6a1c7-79bf-42e3-95cc-599a1e154f57@web.de>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 12:48:20 up 21 days, 2 min,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Markus Elfring (Markus.Elfring@web.de) wrote:
> > I'm not the one to decide whether we should use cleanup for mutex locks.
> 
> Would you get further development ideas from another bit of source code analysis
> which can be performed also with the help of the following small script variant
> for the semantic patch language?

Is there a way to look for functions that have a lock, followed by unlocks on
multiple error paths?
IMHO the nicest thing with guard is simplifying lots of error paths, and
innevitably someone forgets to unlock in one of them.

Dave

> 
> @initialize:python@
> @@
> import sys
> delimiter = "|"
> 
> def format_data(places, item, input):
>    for place in places:
>       sys.stdout.write(delimiter.join([item,
>                                        str(input),
>                                        place.current_element,
>                                        place.file,
>                                        place.line,
>                                        str(int(place.column) + 1)
>                                       ]))
>       sys.stdout.write("\n")
> 
> @find@
> expression list el;
> identifier item;
> position p;
> @@
>  guard@p (item) (el);
> 
> @script:python output@
> input << find.el;
> item << find.item;
> places << find.p;
> @@
> format_data(places, item, input)
> 
> 
> 
> Thus it seems that special “guards” are used at 678 source code places
> of the software “Linux next-20240529”.
> https://elixir.bootlin.com/linux/v6.10-rc1/source/include/linux/cleanup.h#L124
> 
> Will interests accordingly grow for further collateral evolution?
> 
> Regards,
> Markus
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
