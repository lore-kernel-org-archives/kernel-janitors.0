Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A49C77B75
	for <kernel-janitors@archiver.kernel.org>; Sun,  7 May 2023 08:17:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbjEGIRA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 7 May 2023 04:17:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbjEGIQ7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 7 May 2023 04:16:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 546A9100D9
        for <kernel-janitors@vger.kernel.org>; Sun,  7 May 2023 01:16:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C648460A24
        for <kernel-janitors@vger.kernel.org>; Sun,  7 May 2023 08:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64DB7C4339B;
        Sun,  7 May 2023 08:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683447417;
        bh=pk+gMcvuNBgi+w1ujp4aIcnAky8R6DcTjrv1pw+rtu0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vQqihPiDdT/ZMEuxk/s5GNd77dQXgRLZw12WEEbLKHEbVkhP6boP7z+NyCP1NqD0u
         bvGTw/xsJ8GOaao+RVoLJWZ6PZNdeoY5YHDRid0E3QX/wJ7BKCQfZ9o6g/oopkxz+R
         as2dS3DdqWyHKKQCIjmllvCu6xRYZKvFhAhIqy8i7DUYV0F2dOKeO9eUTmHJ4BsQqs
         DZocYz1aLLbWU2DIbV4+MP8cImF7DMYySamW4OpoKPVRUWyLDFX2rKrvoLMshvvBWv
         O5De22MM/nymzDYHT6iHoZMY1+VaCbCc+HvmKc5J5M9173MDOTjePFt53wu8WHTlpR
         5eaDO5TfzivSQ==
Date:   Sun, 7 May 2023 11:16:52 +0300
From:   Leon Romanovsky <leon@kernel.org>
To:     Simon Horman <simon.horman@corigine.com>,
        wuych <yunchuan@nfschina.com>
Cc:     ioana.ciornei@nxp.com, davem@davemloft.net, kuba@kernel.org,
        pabeni@redhat.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] net:ethernet:freescale:dpaa2:Remove unnecessary (void*)
 conversions
Message-ID: <20230507081652.GE525452@unreal>
References: <20230506094428.772239-1-yunchuan@nfschina.com>
 <ZFY0rlWDt1421Tvo@corigine.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZFY0rlWDt1421Tvo@corigine.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, May 06, 2023 at 01:06:22PM +0200, Simon Horman wrote:
> On Sat, May 06, 2023 at 05:44:28PM +0800, wuych wrote:
> > Pointer variables of void * type do not require type cast.
> > 
> > Signed-off-by: wuych <yunchuan@nfschina.com>
> 
> Hi,
> 
> this looks good, but a few things to improve:
> 
> * Did you miss the instance in  dpaa2_dbg_bp_show()
> * For networking patches, please set the target tree in the subject.
>   As this is not a fix it should be 'net-next' (if it was a fix it would be
>   'net')
>   [PATCH net-next v2] ...
> * As per the form letter below, -net-next is currently closed,
>   so please repost after May 8th.
> * I think the subject prefix should be dpaa2-eth:
>   [PATCH net-next v2] dpaa2: ...
> * I think the patch subject could be a bit clearer
>   [PATCH net-next v2] dpaa2: Remove unnecessary cast of void pointers

Plus, another thing to consider is to take seriously feedback for other
patches https://lore.kernel.org/netdev/19409d2b4222b3a5c6fc0cedbfa7844b6eb3440f.camel@redhat.com/

Thanks
