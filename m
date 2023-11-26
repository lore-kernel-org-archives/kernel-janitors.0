Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB9CCA43
	for <kernel-janitors@vger.kernel.org>; Sun, 26 Nov 2023 15:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SMgQA+y+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE8D5C433C9;
	Sun, 26 Nov 2023 15:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701011838;
	bh=mlKmjTq1YkDid0Jztqm64+Hd0IdQBCJuAG//PGNC4vI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SMgQA+y+63fGhGr3hSYLUWHuMxc44IydSrsbsu9Nkyz1PVjHPYYK/5XDlbMGEj8p7
	 nwPAnZHDnzsOzTCeaDnVNv6XxqXTHEG3KeBjKqK+a/BTQ6ynlQVZ7Xwfj904hUB5B+
	 ZeFaBXB91AzkmtMAGFujDIYHq7/4mIpCeSatTszw=
Date: Sun, 26 Nov 2023 15:17:15 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] kernfs:  reorder 'struct kernfs_node' to save some memory
Message-ID: <2023112636-ouch-estrogen-1a5e@gregkh>
References: <465890c56c6f5ad702a091a1ecd3c70bd4a3a74c.1701010150.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <465890c56c6f5ad702a091a1ecd3c70bd4a3a74c.1701010150.git.christophe.jaillet@wanadoo.fr>

On Sun, Nov 26, 2023 at 03:49:37PM +0100, Christophe JAILLET wrote:
> 'struct kernfs_node' uses a dedicated cache, so shrinking its size is
> always a good idea.
> 
> On my system, each entry is 128 bytes and their are 32 entries per pages.
> After the re-ordering, the struct is 120 bytes and 34 entries are stored
> in each page.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> The numbers below are with a allmodconfig configuration. The delta is
> related to CONFIG_DEBUG_LOCK_ALLOC and struct lockdep_map	dep_map.
> 
> When I checked on my system, it would have saved 372kb of RAM:
>   sudo less /proc/slabinfo | grep kernf
>   kernfs_node_cache  49397  49504    128   32    1 : tunables    0    0    0 : slabdata   1547   1547      0
> 
> I have left flags close to the union, I *think* that they are related.
> I don't if having 'mode' here is logical or not.

I'm all for fixing up holes, but have you checked this before and after
with lockdep disabled?  That's usually the biggest chunk, and can cause
alignment issues, perhaps moving that to the end would make more sense?
With that, I think everything can fit in 2 cachelines except for the
lockdep structure?

thanks,

greg k-h
