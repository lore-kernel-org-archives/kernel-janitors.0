Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 731C8C433F5
	for <kernel-janitors@archiver.kernel.org>; Fri, 18 Mar 2022 00:45:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231243AbiCRArN (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 17 Mar 2022 20:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbiCRArN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 17 Mar 2022 20:47:13 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E06552986E8;
        Thu, 17 Mar 2022 17:45:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 916B3B81F6A;
        Fri, 18 Mar 2022 00:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ECEBC340E9;
        Fri, 18 Mar 2022 00:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647564353;
        bh=869vS8CNRy7w/fO0Z3K24Zwe/P2FIlJv9kmWIGddaJ0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cmr9ZqXCFS93xvfnp/inh6Nz+h9u2D+XvrlcMZOnuSc1PIQ7o0RPB2vZg+8NSTgmM
         ZLYY1svNwPNBZCrXgNDVuQqVmFGP8oIfhtXXN45S8scBQTlfcTISSHPcRq76nLhb/x
         AzvREflIpFQD2J2NcnScnyn0XWGkpmRZd/XQ7YKdNOK7ixyjzFU2Ca3rwrhYjvdM95
         +MMjuj/2dStN4sYluSsNL2ye+ZAxP6gQKnmj4nKkVMQoqrf5soe46X7l5wiuIccrcA
         IL0n31Gko0MEIUGPE15nG3mYp9F4kh7CigmkDwHAa7M3gR6b2+T0QL/A6FPdPS1Vwt
         ksAwLY65cyT+Q==
Date:   Thu, 17 Mar 2022 17:45:47 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     patchwork-bot+netdevbpf@kernel.org
Cc:     Dan Carpenter <dan.carpenter@oracle.com>, pablo@netfilter.org,
        laforge@gnumonks.org, davem@davemloft.net,
        osmocom-net-gprs@lists.osmocom.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] gtp: Remove a bogus tab
Message-ID: <20220317174547.6193437e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <164756101290.14093.7117497281533622987.git-patchwork-notify@kernel.org>
References: <20220317075642.GD25237@kili>
        <164756101290.14093.7117497281533622987.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 17 Mar 2022 23:50:12 +0000 patchwork-bot+netdevbpf@kernel.org
wrote:
> Hello:
> 
> This patch was applied to netdev/net-next.git (master)
> by Tony Nguyen <anthony.l.nguyen@intel.com>:
> 
> On Thu, 17 Mar 2022 10:56:42 +0300 you wrote:
> > The "kfree_skb(skb_to_send);" is not supposed to be indented that far.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/net/gtp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)  
> 
> Here is the summary with links:
>   - [net-next] gtp: Remove a bogus tab
>     https://git.kernel.org/netdev/net-next/c/02f393381d14

Not really, the patch that got applied was the version from Wojciech.
