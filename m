Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B83E81DE0
	for <kernel-janitors@archiver.kernel.org>; Fri,  6 Oct 2023 11:21:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232047AbjJFLVO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 6 Oct 2023 07:21:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232078AbjJFLVB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 6 Oct 2023 07:21:01 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A3871A3
        for <kernel-janitors@vger.kernel.org>; Fri,  6 Oct 2023 04:20:40 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54EC9C43391;
        Fri,  6 Oct 2023 11:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696591239;
        bh=kFxs3hCHi5I7QGQEivRopqVOmOAgS/9t+tGmtdBttGc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mCcUDI1sjfPB1CvknDDtG1tn84Y2URFKyd53KY8zku88U5DB3EpJUDU3bB0SYda5X
         R8kuI8ImDqWCZLYUwRdoNXSu48nYi2cUNyMUFB0iVNiEm2Dnh9WQUs1Q0ZxzijHWUi
         ldakbVs5lCckneaPw05pgx0pSmhRyJxOmh2DPS5BpG+6tgLo78DJp6wVUipVrWGkmD
         pQOSI8PdCeSfO03ABwPZoAoF7jSRsWH3WgSG1bB3OgAd0nPJAEpOKgwQUOuEhrX4AQ
         tWI7HMTjThoTtNScL8bvsXILW3dx195PD515nL244Ev8QV80MWcYzPy5drLO61/sau
         TsqFRUGLKqPPg==
Date:   Fri, 6 Oct 2023 13:20:34 +0200
From:   Simon Horman <horms@kernel.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Jinjie Ruan <ruanjinjie@huawei.com>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jacob Keller <jacob.e.keller@intel.com>,
        intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] igb: Fix an end of loop test
Message-ID: <ZR/tginYKa7Zcwug@kernel.org>
References: <4d61f086-c7b4-4762-b025-0ba5df08968b@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d61f086-c7b4-4762-b025-0ba5df08968b@moroto.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Oct 05, 2023 at 04:57:21PM +0300, Dan Carpenter wrote:
> When we exit a list_for_each_entry() without hitting a break statement,
> the list iterator isn't NULL, it just point to an offset off the
> list_head.  In that situation, it wouldn't be too surprising for
> entry->free to be true and we end up corrupting memory.
> 
> The way to test for these is to just set a flag.
> 
> Fixes: c1fec890458a ("ethernet/intel: Use list_for_each_entry() helper")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Simon Horman <horms@kernel.org>
