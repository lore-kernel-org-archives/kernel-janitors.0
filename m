Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B65DE81DF4
	for <kernel-janitors@archiver.kernel.org>; Fri,  6 Oct 2023 13:26:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232277AbjJFNZ7 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 6 Oct 2023 09:25:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232082AbjJFNZ6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 6 Oct 2023 09:25:58 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFA5995
        for <kernel-janitors@vger.kernel.org>; Fri,  6 Oct 2023 06:25:57 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9523DC433C7;
        Fri,  6 Oct 2023 13:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696598757;
        bh=GK6+gdGAri1G6rozMe9+EwaIXQ9xuRPorgKW+tLw1L4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hyXzPBiYVRHBuL1QwV3tmCN0UqHukILJ3h4u8TxJvG9SgcfyjffCHRnrTkmecrBcI
         Aq01AZUiCeZQIJc5233PU9okbYh1Bcm38ceGU1KtFnp7D9TV9NWx4rh2B6yH02w5ep
         GoiwWthZ8JntltpZhFJhyVWfzBsrBJ6gs2izE1og9o0GfRszEET1xMjbAqAyzHLxL6
         g7qrZZFt52GRRoulRee3sO9n9rMj7KiZMp93qoahLcY2rMXUQMI2iiB8QkuEQwcc8e
         UE6GlyTi6Uq53a9ovcKOcnfTiQUsl7oRN/JEypGlOefT++3f2cGcnuv9I7XlJb9TVW
         QJEiC4XDXMM6g==
Date:   Fri, 6 Oct 2023 15:25:53 +0200
From:   Simon Horman <horms@kernel.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net v2] ixgbe: fix crash with empty VF macvlan list
Message-ID: <ZSAK4eB2Wkl5RImI@kernel.org>
References: <ZSADNdIw8zFx1xw2@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSADNdIw8zFx1xw2@kadam>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Oct 06, 2023 at 03:53:09PM +0300, Dan Carpenter wrote:
> The adapter->vf_mvs.l list needs to be initialized even if the list is
> empty.  Otherwise it will lead to crashes.
> 
> Fixes: a1cbb15c1397 ("ixgbe: Add macvlan support for VF")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: Use the correct fixes tag.  Thanks, Simon.

Reviewed-by: Simon Horman <horms@kernel.org>
