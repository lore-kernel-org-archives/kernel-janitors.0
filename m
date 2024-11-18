Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8DD1BC3F
	for <kernel-janitors@vger.kernel.org>; Mon, 18 Nov 2024 02:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731898087; cv=none; b=WMnC5S1wnkLuvAYraY+v5Dj+qhJbUHFk4dvwA+GbaKsknO14DdmLDg607uVf6wJ4Y9XGAxhdM5uK1VoTKnxac1+gTydNDD3Q6kwJjrFJDf3shrfuyMBHhkosswiwbqCrtTIrE4Rurs7wZ+pAu5rIFmqCG5LZGstMaNbBT8FwjvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731898087; c=relaxed/simple;
	bh=NCi+3KO1Ma+wJFu6TZPSTBqnRCE1cjnkcaPkIhoZdio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mqk2RP6GqYL65MhPBiJUd6TgToCGGs1OJCchQrZglgRUdp7pHukQivbYxxlJ/plP/JbfI6C5Uq/oXcW9r79RbkeMHY2lysRmIZeP+e5wl+V7TGB58bJ/2gzD/vpmo/rlt12NoRDWF1g/gKl4m/0olUTv6qyZimkl0MZchowjsjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gtk8YqeS; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gtk8YqeS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bCT6Z/CxjEugfSA+JJOt1Hugzq1ZIgStzbS2z0l6a+I=; b=gtk8YqeSAL2azmtvlUukKwkNl8
	WUTPQ9g/Tm5n7H7OvkqNNAjC/vAUGAIcvrhr+x5HO910frjBplYNlg1tGvaUFu9hN/YDgYCXF3Qwv
	UMmKLHpzOF6LwKCCYs1lGZOJzn/8TIXftkLU4KmacQuU8731tMT3HVSsbGxmZdJhgQRWd7Dg1iD1J
	PQvrbia6C53Iy85s3ZStk2YpVfdSf4I3XcwTlsuTPODjImgNYTS9z4ZqNhPSaBvLRXG3ECmpTzumV
	D1MwgwDsrfnfJPYEom9juXaKa5WHvoXg3nqMydja6vXoPrKgwoan3M6UKz6S3dUAXU+VRl+KKc8dS
	uqHnmkDA==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tCrnv-00000002Uq7-2GnG;
	Mon, 18 Nov 2024 02:47:55 +0000
Date: Mon, 18 Nov 2024 02:47:55 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Alexandre Ferrieux <alexandre.ferrieux@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: RFC: chasing all idr_remove() misses
Message-ID: <Zzqq2ypY0JKrwlMb@casper.infradead.org>
References: <97f3b17f-2e92-4cb7-8ee5-3a76969fb2cf@orange.com>
 <304a9635-9bb0-4dbe-94c9-135f43dd8217@stanley.mountain>
 <0b537aa4-7dba-4290-8b83-444023571425@orange.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b537aa4-7dba-4290-8b83-444023571425@orange.com>

On Sun, Nov 17, 2024 at 04:07:43PM +0100, Alexandre Ferrieux wrote:
> On 16/11/2024 20:43, Dan Carpenter wrote:
> >
> > On Sat, Nov 16, 2024 at 06:45:37PM +0100, Alexandre Ferrieux wrote:
> >>
> >>   73af53d82076 net: sched: cls_u32: Fix u32's systematic failure to free IDR
> >>                entries for hnodes.
> >>
> >> So, unless we have reasons to think cls_u32 was the only place where two ID
> >> encodings might lend themselves to confusion, I'm wondering if it wouldn't
> >> make sense to chase the issue more systematically
> >>
> > Matthew Wilcox maintains IDR so it's really up to him.  I don't think adding
> > a WARN_ON_ONCE() in idr_remove() for NULL returns is a bad idea but we could
> > hide it behind a #if DEBUG_IDR or something and try run syzkaller on it first.
> 
> Thanks Dan. Now, I'm not familiar with the syzbot feeding process, can you help
> me out ? Is the next step to:
> 
>  (a) invent the new debug flag (e.g. "DEBUG_IDR") then post a patch using it;
> wait for its acceptation and merge ; then contact syzbot operators to add it in
> (some of) its builds
> 
>  (b) use some existing wide-range debug flag so that syzbot will automagically
> test IDR once the patch is merged
> 
>  (c) wait for you or Matthew to handle all of this

IDR is deprecated.  I'm not excited about patches that make it better.
IDR users should be converted to use the XArray API.
