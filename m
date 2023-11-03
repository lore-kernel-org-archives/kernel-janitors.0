Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881A47E
	for <kernel-janitors@vger.kernel.org>; Fri,  3 Nov 2023 07:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rqWI9lg+"
X-Greylist: delayed 330 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 03 Nov 2023 00:21:31 PDT
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [IPv6:2001:41d0:203:375::bb])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F88A11B
	for <kernel-janitors@vger.kernel.org>; Fri,  3 Nov 2023 00:21:31 -0700 (PDT)
Date: Fri, 3 Nov 2023 03:15:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1698995758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hpVF05lznDqDx6f1+ea6T4Jp10EfIGdgeBzLRI3fFVk=;
	b=rqWI9lg+57oFBlVY9KB6duYdaOIhQNyobFpHFTwi+FAZZge9Xuox/4TripKYHOgXg6U6Lb
	SFtB2XuGEEQTs2ocniYlqxQBJaN8ohlboDzZ3VkIlcHxQY/uS8X5qbPpNoJDrfMk6DYWJI
	Ecf/imZiSCuNjbcDntarbi0X88S2Myk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Brian Foster <bfoster@redhat.com>, linux-bcachefs@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] bcachefs: add a missing tab to bch2_dev_exists()
Message-ID: <20231103071554.ivjvexzgkj5xlpxz@moria.home.lan>
References: <b5297f95-ee72-4160-8824-e62fd12f6aad@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5297f95-ee72-4160-8824-e62fd12f6aad@moroto.mountain>
X-Migadu-Flow: FLOW_OUT

On Fri, Nov 03, 2023 at 09:34:33AM +0300, Dan Carpenter wrote:
> This line needs to be indented another tab.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  fs/bcachefs/sb-members.h | 2 +-
>  1 file changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/fs/bcachefs/sb-members.h b/fs/bcachefs/sb-members.h
> index 1583e80afcbf..10072088c299 100644
> --- a/fs/bcachefs/sb-members.h
> +++ b/fs/bcachefs/sb-members.h
> @@ -190,7 +190,7 @@ static inline bool bch2_dev_exists(struct bch_sb *sb,
>  				   unsigned dev)
>  {
>  	if (dev < sb->nr_devices) {
> -	struct bch_member m = bch2_sb_member_get(sb, dev);
> +		struct bch_member m = bch2_sb_member_get(sb, dev);
>  		return bch2_member_exists(&m);
>  	}
>  	return false;
> -- 
> 2.42.0
> 

already in my tree
