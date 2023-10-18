Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E15ACDB474
	for <kernel-janitors@archiver.kernel.org>; Wed, 18 Oct 2023 01:00:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232009AbjJRBA0 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 17 Oct 2023 21:00:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjJRBAZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 17 Oct 2023 21:00:25 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6107192
        for <kernel-janitors@vger.kernel.org>; Tue, 17 Oct 2023 18:00:24 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C892AC433CA;
        Wed, 18 Oct 2023 01:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697590823;
        bh=9bt1AZQZu+kPf7xfbsepDklv1R2kPXwB8sI4S2GxjkY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=IcAEBV+bJY4o6YELr3D5GjVhcBkH3+RgMtRFVUdrwlN0uqNKKPp3JLLx4ukweuRSJ
         aljDiTjH1+3xLaS470gaDntRsj8TaEhE29kSkqsQ2YyNv6o6mB6Od5Sw1T1cab/3bE
         FZkXqsoVd+G35JCt6V8y2LKou7kH5T7fBmULVHQd4ZgK0zXA/qnlStxb6gbhDMDCKz
         zB16A247svgCWCbnAMJm4SW56pd3MlKRtBI2RIGVlpx2p456H6nyFRGlCXVtjruMit
         Llp3QfnvHNUPcMKptt6lvU+BHxk9JP2XZBdetiZSnI5QhnaamvXHbHmINu6KPEkW5L
         QXcYm8qRIl+Pw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AEF30E4E9BC;
        Wed, 18 Oct 2023 01:00:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: usb: smsc95xx: Fix an error code in smsc95xx_reset()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169759082371.18882.10002947976673675674.git-patchwork-notify@kernel.org>
Date:   Wed, 18 Oct 2023 01:00:23 +0000
References: <147927f0-9ada-45cc-81ff-75a19dd30b76@moroto.mountain>
In-Reply-To: <147927f0-9ada-45cc-81ff-75a19dd30b76@moroto.mountain>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     steve.glendinning@smsc.com, steve.glendinning@shawell.net,
        UNGLinuxDriver@microchip.com, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        netdev@vger.kernel.org, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 16 Oct 2023 20:28:10 +0300 you wrote:
> Return a negative error code instead of success.
> 
> Fixes: 2f7ca802bdae ("net: Add SMSC LAN9500 USB2.0 10/100 ethernet adapter driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/net/usb/smsc95xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [net] net: usb: smsc95xx: Fix an error code in smsc95xx_reset()
    https://git.kernel.org/netdev/net/c/c53647a5df9e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


