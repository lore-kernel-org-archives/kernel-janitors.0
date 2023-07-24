Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DE0BC001B0
	for <kernel-janitors@archiver.kernel.org>; Mon, 24 Jul 2023 08:06:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231148AbjGXIGw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 24 Jul 2023 04:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbjGXIGv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 24 Jul 2023 04:06:51 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF10B3
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Jul 2023 01:06:50 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fbd33a57ddso31164985e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Jul 2023 01:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690186008; x=1690790808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mpp1awV/UuxiXQSbBJIE04gOo8cLtwnTyn1HjOR6Ckw=;
        b=IA6G4arH+P/PSwGztuxoPiXc54udZRCzZyQ25ylPHmpVvtq2FMMiAboJbSW89kEHmm
         LtlMbPyfzdyiMTOQhudNr0YCz8G0XcZHH+LYiVxq6aq6YGBgsDU+4FMTvhHArsLdqKM4
         5+Ji/puuDKECDtdmtLJx5D45w/CPM7C9HLtFfdKjQ2AyJgrCEBlYYHXmwFAYBggFeGgH
         n6TItejQxMNZL6k1HXn9yy9IbHqKIkZmxSwsrOqyKeZAw9no6TPkNarK95Fsxq3lBPUH
         b4/vM9rQ+WxQdA8P4bkt1UlDxGWjKvhBoxxuOGZIO52kzLuao4kAzoQoXqeefx+NbnrU
         gJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690186008; x=1690790808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mpp1awV/UuxiXQSbBJIE04gOo8cLtwnTyn1HjOR6Ckw=;
        b=ZuuK0ZSA0clVmlEeprUqTIdOqNIWTXYV0ZTAmhzGMUpshpd4RQCo+cVE7Dt0OjSLIN
         GM5o+GmStEs8Cy50rtUgjnPye4In2FpSC+a9OOzhRCzVFMLNaHJwKjlSm/qbBrQ29FFp
         f2X6jd3W/Mfu3BtzH7XH5joYQWZvDwqT2RKkjYDBSZyQvtbiLYBVsaiXKCQjY/rZVVYz
         mfQ1m8WDvKCnUPSKVMO1MMrOG4n/VcbRn5+0x3tDxexQXVx3U22aKxh4sWSy9FHWRzCX
         RNmLVGK43RlHEXIfRaLzPZpMbar2VYTL21/8PAtwqGqWHWI+e6myFu/bUoR8yKpDpb3k
         6nAA==
X-Gm-Message-State: ABy/qLZyZZHhUMlt39H8Rz1ndnqojHnb/vlnmz/7mIP5IwNDM167nr92
        t2UlaPKtIcyw4k10KFVt+oDHgA==
X-Google-Smtp-Source: APBJJlGEpLbG0wk2IPF6/fqJfa3GFTLj2S2AuNoL1+3e4ZhnXOHJYtjJ5zoOtT5ZAyQ1axx1RnX0eg==
X-Received: by 2002:a7b:c4c7:0:b0:3fc:5d2:9286 with SMTP id g7-20020a7bc4c7000000b003fc05d29286mr5759318wmk.2.1690186008605;
        Mon, 24 Jul 2023 01:06:48 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z5-20020a7bc7c5000000b003fbe4cecc3bsm12347742wmk.16.2023.07.24.01.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 01:06:48 -0700 (PDT)
Date:   Mon, 24 Jul 2023 11:06:45 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Anna Schumaker <anna@kernel.org>,
        Trond Myklebust <trond.myklebust@hammerspace.com>,
        Jens Axboe <axboe@kernel.dk>, Jack Wang <jinpu.wang@ionos.com>,
        Dave Chinner <dchinner@redhat.com>,
        Hannes Reinecke <hare@suse.de>,
        Christian Brauner <brauner@kernel.org>,
        linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] nfs/blocklayout: Use the passed in gfp flags
Message-ID: <06e08274-f78d-4c13-9bbf-dff19ed6c5b3@kadam.mountain>
References: <e655db6f-471b-4184-8907-0551e909acbb@moroto.mountain>
 <CAFX2JfmdpaRWbBypM+Xd4omd86mAbMNQ79+=xAtJXNjip95Sag@mail.gmail.com>
 <e0e9d80e-0e69-e685-c2d5-a658a173b9ce@wanadoo.fr>
 <49ebb356-0a0d-7ec0-3d6a-4fb79272c41f@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49ebb356-0a0d-7ec0-3d6a-4fb79272c41f@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jul 21, 2023 at 08:14:03PM +0200, Marion & Christophe JAILLET wrote:
> I can't remind the call chain myself, but my browser history can.
> 
> gfp_mask is propagated in all the below functions:
> 
> filelayout_pg_init_write()
> --> fl_pnfs_update_layout(..., GFP_NOFS)
> --> filelayout_check_deviceid()
> --> nfs4_find_get_deviceid()
> --> nfs4_get_device_info()
> --> alloc_deviceid_node()	function pointer in struct pnfs_layoutdriver_type
> --> bl_alloc_deviceid_node()
> --> bl_parse_deviceid()
> --> bl_parse_slice()  /  bl_parse_concat()
> 
> CJ

Thanks Christophe,

Let me re-send with a corrected commit message.

regards,
dan carpenter

