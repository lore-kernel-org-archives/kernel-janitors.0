Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F8F3911CF;
	Thu,  3 Sep 2026 20:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.212.143.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788465760; cv=none; b=gSMg2iafEoQbg1Ld1bkHdw23o53E+IUqiL8L4+v94TbDPDcWU5Vk3ME22EUeYbHyrjsdI08zbJXi26nXwgxF1zpRshFisV2foSyejkW+tS0KCcHLlBR2NgPZnkWofRuPC1ahkU864ILwBBnxXKmdlreTfAB0iTayM0G0s8aSRVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788465760; c=relaxed/simple;
	bh=0aJm78f2DfYBg8zJZI2YzJEG+FK+qVmsZ8yi+KU4yIc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ISBzZvULbdi5764BdySVmRasXcSMv8ex0qArTVQiOjfoE0Xzw2og+r/5tJ0O+fm8hZAZHLAK2fuqPSrVXa2A5MtmoXxL0MxnPsfZySpQJAW1h629FnygJCKc7QvlbV8HFRuqiaagN9NPLLw+jKY/bBCb+Up+3wjvp0jZMX1FI9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca; spf=pass smtp.mailfrom=crashcourse.ca; dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b=lD7t4CTf; arc=none smtp.client-ip=199.212.143.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="lD7t4CTf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TQFBKb0arpU3xnnfHdea/D1cO6St0WXDwcH5iaCLRrg=; b=lD7t4CTf7jFvg7PAc/uK12OrvO
	Wdibl4AjrEO60zFhJEiJY+eTIPLuo+NNJHNAd/ujOugbRUYq702aP3bhcghbhgu5gBobbED2DHID2
	zlnmyK8UxRd4S2pglq3oupZv1IK1OmWIMBC8SymV1/trXF53vtnwoJuHcfxLeNJbPSjl/nJdAsMrv
	4LxQsFs1CF+uANqoUasI5Juvg9AkmDX6YlamWOhpCmE6fLNOl9SwOm9dFxxlm0swofYJX9ZdTsOSt
	0KgDW6KO4UjjKwWupVY/flCsp2qyzja0F+sEBC/1RvumTKmt8+D1lpwCgAEu0EhEMUw0m2F4GofI3
	WLVPxY/g==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:56356 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1x2D6G-00000000riq-35wQ;
	Thu, 03 Sep 2026 15:27:53 -0400
Date: Thu, 3 Sep 2026 15:25:59 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Matthew Sakai <msakai@redhat.com>
cc: Colin Ian King <colin.i.king@gmail.com>, dm-devel@lists.linux.dev, 
    kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] dm vdo: Fix spelling mistake "postive" ->
 "positive"
In-Reply-To: <1d2cd544-97a6-4ddd-8758-048bbd104eb5@redhat.com>
Message-ID: <ae8b93d1-2967-d4bf-4c2d-2b110b9d2fc4@crashcourse.ca>
References: <20260903152325.16304-1-colin.i.king@gmail.com> <1d2cd544-97a6-4ddd-8758-048bbd104eb5@redhat.com>
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

On Thu, 3 Sep 2026, Matthew Sakai wrote:

> I had to look at this for quite a while to figure out what was going on.
> We made the same spelling error twice in the same function and somehow only
> noticed the first one previously? Anyway,
>
> Reviewed-by: Matthew Sakai <msakai@redhat.com>
>
> On 9/3/26 11:23 AM, Colin Ian King wrote:
> > There is another spelling mistake in a vdo_log_error message that
> > I somehow overlooked last time. Fix it.
> >
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> > ---
> >   drivers/md/dm-vdo/dm-vdo-target.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/md/dm-vdo/dm-vdo-target.c
> > b/drivers/md/dm-vdo/dm-vdo-target.c
> > index 1d8375cc3c3e..043549b1fc2e 100644
> > --- a/drivers/md/dm-vdo/dm-vdo-target.c
> > +++ b/drivers/md/dm-vdo/dm-vdo-target.c
> > @@ -443,7 +443,7 @@ static int __must_check parse_slab_size(const char
> > *slab_str, block_count_t *sla
> >     	result = kstrtoull(slab_str, 10, &value);
> >   	if (result) {
> > -		vdo_log_error("optional parameter error: invalid slab size,
> > must be a postive integer");
> > +		vdo_log_error("optional parameter error: invalid slab size,
> > must be a positive integer");
> >   		return -EINVAL;
> >   	}

  My rule from years back was ... you find one typo, you "grep -rw"
the entire kernel tree.

rday
