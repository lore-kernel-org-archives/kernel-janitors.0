Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A563C433F5
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 Jan 2022 15:50:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236522AbiAJPug (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 10 Jan 2022 10:50:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236611AbiAJPud (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 Jan 2022 10:50:33 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1AF9C061748
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jan 2022 07:50:33 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id c10so13086357qte.2
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jan 2022 07:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=taJK4990Hf5ggLF7x5d/tJzG7fwO4y08TUkbCKMXkXM=;
        b=SU3mKDe+NFt3ELa2q1426sexnDWTv18yKIPDP2du70kd2dvXb52pbMprOX3r4vXwnT
         RbL/u0D3fPqnhE75Zta7ky5PgQl+H7WlhwgI11Y9Dz1SlLlNyp1vZelvZQfiKOIBLikl
         9VdKprbwittxaamxOVCN3EL4GuHf/srjHctuYUzkQ2alUkCvKBgXraQVXsc11RTekBnu
         iacR1txVlA/jNx6GNjsFWSQwvPhSc/uJHfJ/mKUmnB7DVKYliIoB4dEZciKewszMijkI
         vO1LhdxWqyO0YGpmagOxmsqhoVMgkRSsEN7ww+ni+rjYhOHFPPU2YpgW1eD0xXLut+sY
         VFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=taJK4990Hf5ggLF7x5d/tJzG7fwO4y08TUkbCKMXkXM=;
        b=GZrugjNCdOniA/KyKQV06smkFUj+BSeSBsDM118nyDEDcEiCzJkWmpfh7TZgsgHTeG
         4GjoNbFX4AINxktPPd/MreF6QuayriQXYA5Zkz2/KD/uqTSHKJNoNgA0Qgz4JFOfpK5n
         AK94bTfnKWZBejrZ/LEzYET7p+kGDPflBs1K5kGSqu5/nE2OrLHsDqUn8S56xCZtEo7Y
         ALDPnyoGdscfu5e1xGn/VfRky34S0XW37FvyrABRcwOPU1mmvcuM1Udx7RLfLO1oCBEN
         6mmltGBc/H9+rVQy4IPlFPKm48oMUbhtYb1aTa76uKYN+3fXIxBr3bW/FaTkzyDuDPAT
         2v0w==
X-Gm-Message-State: AOAM5328kmeqNrANBkI3IU7OLHm91U3M4IRc6HZgch4XTJ1ZVsJtNm4F
        X48YjeiMbnydNFujn5RQ8qRZfw==
X-Google-Smtp-Source: ABdhPJxBj0ZyPgNVhc4jPK7tenIAOTO7n8CuI533poIMXs6L4y67rXu3AheljFk+wuxJDExcGtdWCQ==
X-Received: by 2002:ac8:74c6:: with SMTP id j6mr229936qtr.557.1641829832895;
        Mon, 10 Jan 2022 07:50:32 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id r4sm900398qta.51.2022.01.10.07.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 07:50:32 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1n6wwJ-00DpQ8-Ir; Mon, 10 Jan 2022 11:50:31 -0400
Date:   Mon, 10 Jan 2022 11:50:31 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-rdma@vger.kernel.org
Subject: Re: [PATCH] IB/mthca: Remove useless DMA-32 fallback configuration
Message-ID: <20220110155031.GI6467@ziepe.ca>
References: <4aeb3dcf39490334acf583e723a08ea7262b0912.1641716983.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4aeb3dcf39490334acf583e723a08ea7262b0912.1641716983.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Jan 09, 2022 at 09:30:09AM +0100, Christophe JAILLET wrote:
> As stated in [1], dma_set_mask() with a 64-bit mask never fails if
> dev->dma_mask is non-NULL.
> So, if it fails, the 32 bits case will also fail for the same reason.
> 
> Simplify code and remove some dead code accordingly.
> 
> [1]: https://lkml.org/lkml/2021/6/7/398

Can you use lore links please?

Jason
