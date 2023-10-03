Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC9DE7AD57
	for <kernel-janitors@archiver.kernel.org>; Tue,  3 Oct 2023 14:20:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234771AbjJCOUb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 3 Oct 2023 10:20:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238752AbjJCOU3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 3 Oct 2023 10:20:29 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55ED09E
        for <kernel-janitors@vger.kernel.org>; Tue,  3 Oct 2023 07:20:25 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E83E7C433CA;
        Tue,  3 Oct 2023 14:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696342825;
        bh=C1PjOzaL6zGFv+xuvVXZQ13drp+ZYgssUutzpbcy2Ak=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=E/88OPYA3oZRLgnKZRERHOlLix5vAteTZXojrXTtyNsTNmKYsqQoYvdc2QcSIXnkf
         I48CMArszW0e82A01Z/Rf/mcs4B/IVuSTjEigA2OZMpDWWL6Y8u7L/F9vCrFdYhQLV
         k4XrdQwSCKHvcz19dKsefaFwxBsfTYHw4r02SpiROVTaVPTvXZ5u+XIJCJVBbc3qC6
         xAnChi5Qwv8dlcMx7HVamAdiMRLbeqltLqLfvsxKNu4YhOisU2ixwZbtsa+/GdKJ8Q
         onW+W6fkXa1iUBGPDf2xBs4GvMqdfj+N9W1hgmCn/KIxbM0zyHEYNG2gFa+cr3foWk
         IvqctveWokijQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C95DEE632D1;
        Tue,  3 Oct 2023 14:20:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: microchip: sparx5: clean up error checking in
 vcap_show_admin()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169634282481.20237.11023023965900224021.git-patchwork-notify@kernel.org>
Date:   Tue, 03 Oct 2023 14:20:24 +0000
References: <b88eba86-9488-4749-a896-7c7050132e7b@moroto.mountain>
In-Reply-To: <b88eba86-9488-4749-a896-7c7050132e7b@moroto.mountain>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     lars.povlsen@microchip.com, horatiu.vultur@microchip.com,
        Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
        UNGLinuxDriver@microchip.com, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 8 Sep 2023 10:03:37 +0300 you wrote:
> The vcap_decode_rule() never returns NULL.  There is no need to check
> for that.  This code assumes that if it did return NULL we should
> end abruptly and return success.  It is confusing.  Fix the check to
> just be if (IS_ERR()) instead of if (IS_ERR_OR_NULL()).
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202309070831.hTvj9ekP-lkp@intel.com/
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> [...]

Here is the summary with links:
  - [net-next] net: microchip: sparx5: clean up error checking in vcap_show_admin()
    https://git.kernel.org/netdev/net-next/c/788f63c4dc17

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


