Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1256AB8
	for <kernel-janitors@vger.kernel.org>; Thu, 30 May 2024 00:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717029019; cv=none; b=EHnm1ItHxwRph4bKtI/RqLFXPbkm+ULj/qhwP+jJYNWnliC2SAXt0072ZoZQPuu61zkCLoX8zIR5YMYmaVGNzEJzy24DPmguVl9rwBGmUUw3ib9I8gZJHyNoZG8HFwEwuufnUyfb8xWAmOylwLI6+FNihQsZexpbjlnRro7XfwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717029019; c=relaxed/simple;
	bh=a+csLBKh7vG86Q4VxWgkaELUneHoYdn+iWGrbBlVnvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddF49TL0EX/9flVy58hW42mYJ5IU/kefdNmOfo3JRIH5IF4FIvLv0t+Ebyotw9viTFhIFjI2CX0LZ0HuvIDWfgWCcLrPF3cRzDf8VaL1FzPA6TamuCYSEF+VX/rJIUPpjD8MUhpDWtWFHiI0vwo78ztIer/iP0E1nKqyRSKJ33g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=inqQ30BR; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="inqQ30BR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=mDHsrjmsSKuGJOxFPdYl7R9DdKesdciFyou/vLDH22Q=; b=inqQ30BRY9KrFCAN
	bv/llnrdQnVsCQtsb9c9BeObB5g7c8e2PJJO0nD3jCjLOPzxc9b2x874nARHyqI/qdVaVcykfxT1O
	DUT3DX3yaq58jspV71rQPtxWvSUv9dGNaSp/YdREWO7fZwDfODLlAFEwHnD82Jhd3h+T/EJn11KF5
	kPPXl/M8Pby6m308g2vIVH9tkVppD3/+susPHyjZEHjoQPr+bidh5+950+PQlGvmB584TAjapXVyx
	6moNpG1CxD7o407YFHz35PVG3yfjgxeQe2Mxi1qRQsqn0rronUta56+Pn7mC1jlhNxTQsci8NvvcQ
	iy0VaXWCirn9Gb33+Q==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1sCTgN-003HaV-0i;
	Thu, 30 May 2024 00:30:15 +0000
Date: Thu, 30 May 2024 00:30:15 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: cocci@inria.fr, kernel-janitors@vger.kernel.org,
	Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [cocci] Looking at guard usage (with SmPL)
Message-ID: <ZlfIl39GRcXKFRn6@gallifrey>
References: <7eb9626c-da7b-414d-bf50-da1eed27be31@web.de>
 <alpine.DEB.2.22.394.2405261847380.16852@hadrien>
 <2dc6a1c7-79bf-42e3-95cc-599a1e154f57@web.de>
 <Zlckg1LH-2TBew85@gallifrey>
 <e6de2b59-c9c5-4714-8a4d-5c5970b9fad4@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <e6de2b59-c9c5-4714-8a4d-5c5970b9fad4@web.de>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 00:28:43 up 21 days, 11:42,  1 user,  load average: 0.06, 0.04, 0.01
User-Agent: Mutt/2.2.12 (2023-09-09)

* Markus Elfring (Markus.Elfring@web.de) wrote:
> > Is there a way to look for functions that have a lock, followed by unlocks on
> > multiple error paths?
> 
> Probably, yes.
> https://cwe.mitre.org/data/definitions/667.html
> 
> 
> > IMHO the nicest thing with guard is simplifying lots of error paths, and
> > innevitably someone forgets to unlock in one of them.
> 
> Would you like to improve the support anyhow for more complete and succinct
> resource management in affected software areas?

I was just suggesting a perhaps more targeted approach rather than
just looking for all cases of lock/unlock.

Dave

> Regards,
> Markus
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
