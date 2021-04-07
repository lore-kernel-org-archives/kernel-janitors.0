Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 430A7C433ED
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Apr 2021 03:51:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A2CF613CB
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Apr 2021 03:51:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348488AbhDGDvb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 6 Apr 2021 23:51:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25708 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233475AbhDGDva (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Apr 2021 23:51:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617767481;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dQPBNK6da0W8o7+qyhfpn2E8sGg/rV6yzaqbg8AGzeU=;
        b=N2+FRZ/8EJBSB/EGqsuc/HWQz5AsauH7zkBp+h+YMw5rj5Ewu+bQ7x3GNACCEaOAzFhi2K
        wjdgORok1gRxspg2lNoHmymsODFFkhsKkWFO9aUEN14Q9M+NIgp1vBSNmF6wRDBJwh2+Gb
        bRqiShgZZjwWHxYsT6+xPFRLG2sw2ME=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-91f805y7Ng6_mgl84ixtVQ-1; Tue, 06 Apr 2021 23:51:20 -0400
X-MC-Unique: 91f805y7Ng6_mgl84ixtVQ-1
Received: by mail-pf1-f199.google.com with SMTP id u16so11818446pfh.20
        for <kernel-janitors@vger.kernel.org>; Tue, 06 Apr 2021 20:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dQPBNK6da0W8o7+qyhfpn2E8sGg/rV6yzaqbg8AGzeU=;
        b=G8C9ECfJgS6huXNjMMkKhrDZjWJSsFSzts2lznmTP3wGqkY0BzK14ygGpi56LT4jbG
         1GugYFyzsvzpBq5mpcvu9n1mPBX36LxzFFOj/S11X6BHLv3Uwk9BMTffjMID1RhILv3i
         urzMJeVVrJtm6uG67dTTir8RTNavXuEWxpjTXXqT5hTchsbGOCZYJeUG/JifRDWe8GNA
         kzheBWt9qYPPoW77/aUg7XIW0lpuxyhULm1Dll299ZF152AlPPUi3nwQJ2DX4uXsl+2+
         eGipmTQ355z1fjanKdOgPDqflW04zx540pKcBKQe+eTQubbZbSuA083W9I5SwUyHB/QZ
         UnQw==
X-Gm-Message-State: AOAM530UAktTNRGYq+BRkwze29ySqN3U89J420cwSVHW8fC5+K00X/kP
        x33LYF/h/Tdokm1GqJ669DA4ROKLaOWaoQnISop0Moi/R5lG4lxVrWvm1Yuo0gFKCd14KBE3GVl
        PCSP5LVBG2WwuzAcSgPkI9EWdFsYv
X-Received: by 2002:a65:5bca:: with SMTP id o10mr1411728pgr.248.1617767479155;
        Tue, 06 Apr 2021 20:51:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFb0fes/+Orgn9Ga+gUHJeR50ztaEz9kmi0J99mHcpoWtP5bM501fDxtSxuJi0rBF2OwzkfA==
X-Received: by 2002:a65:5bca:: with SMTP id o10mr1411711pgr.248.1617767478926;
        Tue, 06 Apr 2021 20:51:18 -0700 (PDT)
Received: from xiangao.remote.csb ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id q13sm3234459pfc.86.2021.04.06.20.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 20:51:18 -0700 (PDT)
Date:   Wed, 7 Apr 2021 11:51:07 +0800
From:   Gao Xiang <hsiangkao@redhat.com>
To:     Joe Perches <joe@perches.com>
Cc:     Colin King <colin.king@canonical.com>,
        Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
        linux-erofs@lists.ozlabs.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] erofs: fix uninitialized variable i used in a
 while-loop
Message-ID: <20210407035107.GA239118@xiangao.remote.csb>
References: <20210406162718.429852-1-colin.king@canonical.com>
 <20210406235401.GA210667@xiangao.remote.csb>
 <b56a44542a338583279893870ec819d4b1b4e23b.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b56a44542a338583279893870ec819d4b1b4e23b.camel@perches.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Joe,

On Tue, Apr 06, 2021 at 08:38:44PM -0700, Joe Perches wrote:
> On Wed, 2021-04-07 at 07:54 +0800, Gao Xiang wrote:
> > Hi Colin,
> > 
> > On Tue, Apr 06, 2021 at 05:27:18PM +0100, Colin King wrote:
> > > From: Colin Ian King <colin.king@canonical.com>
> > > 
> > > The while-loop iterates until src is non-null or i is 3, however, the
> > > loop counter i is not intinitialied to zero, causing incorrect iteration
> > > counts.  Fix this by initializing it to zero.
> > > 
> > > Addresses-Coverity: ("Uninitialized scalar variable")
> > > Fixes: 1aa5f2e2feed ("erofs: support decompress big pcluster for lz4 backend")
> > > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > 
> > Thank you very much for catching this! It looks good to me,
> > Reviewed-by: Gao Xiang <hsiangkao@redhat.com>
> > 
> > (btw, may I fold this into the original patchset? since such big pcluster
> >  patchset is just applied to for-next for further integration testing, and
> >  the commit id is not stable yet..)
> > 
> > Thanks,
> > Gao Xiang
> 
> I think this code is odd and would be more intelligible using
> a for loop like:

Thanks for your reply/suggestion.

> ---
>  fs/erofs/decompressor.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/erofs/decompressor.c b/fs/erofs/decompressor.c
> index 27aa6a99b371..5a64f4649414 100644
> --- a/fs/erofs/decompressor.c
> +++ b/fs/erofs/decompressor.c
> @@ -286,28 +286,24 @@ static int z_erofs_decompress_generic(struct z_erofs_decompress_req *rq,
>  	}
>  
>  	ret = alg->prepare_destpages(rq, pagepool);
> -	if (ret < 0) {
> +	if (ret < 0)
>  		return ret;
> -	} else if (ret) {
> +	if (ret) {
>  		dst = page_address(*rq->out);
>  		dst_maptype = 1;
>  		goto dstmap_out;
>  	}

I agree with the modification here, thanks!

>  
> -	i = 0;
> -	while (1) {
> +	for (i = 0; i < 3; i++) {
>  		dst = vm_map_ram(rq->out, nrpages_out, -1);
> -
> +		if (dst) {
> +			dst_maptype = 2;
> +			goto dstmap_out;
> +		}
>  		/* retry two more times (totally 3 times) */
> -		if (dst || ++i >= 3)
> -			break;
>  		vm_unmap_aliases();

That is not quite equivalent, since after trying more than 3 times,
(I think) no need to do the final vm_unmap_aliases(), since it's
only used for the next vm_map_ram(). Similar logic also see:
fs/xfs/xfs_buf.c: _xfs_buf_map_pages():

		/*
		 * vm_map_ram() will allocate auxiliary structures (e.g.
		 * pagetables) with GFP_KERNEL, yet we are likely to be under
		 * GFP_NOFS context here. Hence we need to tell memory reclaim
		 * that we are in such a context via PF_MEMALLOC_NOFS to prevent
		 * memory reclaim re-entering the filesystem here and
		 * potentially deadlocking.
		 */
		nofs_flag = memalloc_nofs_save();
		do {
			bp->b_addr = vm_map_ram(bp->b_pages, bp->b_page_count,
						-1);
			if (bp->b_addr)
				break;
			vm_unmap_aliases();
		} while (retried++ <= 1);
		memalloc_nofs_restore(nofs_flag);

		if (!bp->b_addr)
			return -ENOMEM;

but yeah with some modification (and extra vm_unmap_aliases() here
as well...)

Thanks,
Gao Xiang

