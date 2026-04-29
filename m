Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB6230BF4F;
	Wed, 29 Apr 2026 13:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777470833; cv=none; b=JZSePAnG9kHYxWQR2uSKFE3p8BTswOH/Cxv/34mTmVqS1jD61IN44IQq1kRV1QDLIMWPxkWroN/mSzrL9NHF03WDs6wo0ZqWHMlW5aMtBya5HttHBCLrDDrfL2mJumQ6ZbdFF56+pVhmq6DWKtenLdxmGb9ivM+1wVl3cUfx6E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777470833; c=relaxed/simple;
	bh=zyM3oSngkf0lTcAcjmx/ZSMzjd45Vpj1737frwKqPG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YSIzU+8GSSLK599zFYrM7iMIes4vsU97w9u1ElaciRUaqnUcUAdJfeRtTYYMjwpZWasCWeWtrfMkDpF8aPBdxTitWMu3XTk8dnhxrDYmWpF9MQsz94HNgizeMPjDJmWPieuaAQ6ZHdrM/YyEycZ2AhFVm2JJEP5Zz+LWUc8o+YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VUO6EZ1U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VUO6EZ1U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B488C19425;
	Wed, 29 Apr 2026 13:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777470832;
	bh=zyM3oSngkf0lTcAcjmx/ZSMzjd45Vpj1737frwKqPG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VUO6EZ1UpeQ6MUPFlcIRhMnd4DK3OGczrtGkRhl4gwVsgTVh/yj2el5l/GZjZVfDN
	 olbn1AOHcMETwS/uygpr04CBmL75Pc3ZlvAb5QBY3zZIQ84e6x3w/cTT1Q2Dg4ARXC
	 lg1o6EIh9cHmq4+HOEYct61mhvZKIlZTgXX3ibTw=
Date: Wed, 29 Apr 2026 15:53:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Linus Probert <linus.probert@gmail.com>
Cc: error27@gmail.com, kernel-janitors@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix potential speculative cpu oob
 read
Message-ID: <2026042932-lily-carried-5274@gregkh>
References: <20260429111016.1260295-1-linus.probert@gmail.com>
 <2026042959-discourse-favorable-edc5@gregkh>
 <177746672061.1273374.6835519289220492184.b4-reply@b4>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177746672061.1273374.6835519289220492184.b4-reply@b4>

On Wed, Apr 29, 2026 at 02:45:20PM +0200, Linus Probert wrote:
> On 2026-04-29 13:31:46+02:00, Greg Kroah-Hartman wrote:
> > On Wed, Apr 29, 2026 at 01:10:16PM +0200, Linus Probert wrote:
> > 
> > > Fixes potential speculative cpu oob read in os_intfs.c by guarding the
> > > index with array_index_nospec.
> > > 
> > > Fixes smatch warning:
> > > warn: potential spectre issue 'rtw_1d_to_queue' [r]
> > 
> > Is this value controlled by a user?  Or is it just a normal operation
> > that happens that is not controlled?  In other words, can a user
> > manipulate this directly to be out of range?
> > 
> > thanks,
> > 
> > greg k-h
> 
> To my understanding, yes. Which is somewhat limited due to being rather
> new to kernel code and not having access to this hardware. The priority
> is extracted from ip header which can be user controlled.
> 
> However, looking closer at the execution before I see that in both cases
> bounding is performed on the value as follows:
> 
> 	dscp = ip_hdr(skb)->tos & 0xfc;
> 	prio = dscp >> 5;
> 
> So my change here adds no additional security. The smatch warning is a
> false positive. It only warned on one of the cases. Most likely because
> the bounding happened in a function call and it only sees the u32.
> 
> Some quick LLM research told me this (in my own words but have not
> verified extensively):
> 
> The case where the bounding is performed in a function call could be
> susceptible to *Spectre v4 (Speculative Store Bypass)*.
> But the fix I applied here only applies to v1 so no additional security
> on that front either.
> 
> This is probably best to NAK unless we just want to remove a false
> positive smatch warning. But I personally don't agree with that.

Yes, let's fix the tool instead.  The '&' above shows that this is not
really a spectre issue that you can actually trigger.

thanks,

greg k-h
