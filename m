Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1E7C61DA4
	for <kernel-janitors@archiver.kernel.org>; Thu, 16 Feb 2023 05:30:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbjBPFaZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 16 Feb 2023 00:30:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbjBPFaX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 16 Feb 2023 00:30:23 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 457B440DB;
        Wed, 15 Feb 2023 21:30:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D20F561E98;
        Thu, 16 Feb 2023 05:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2613FC433A7;
        Thu, 16 Feb 2023 05:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676525419;
        bh=8taGhAa3ezrsNt9ICR/ULzHLloT4PreJpvb01iqeoV0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=E0C083RvD//3ws/GemD+5s/OUyYBWXQgnOGpA9/+91eTZuPm7nb73EstM0cxPk7o9
         DdzWDoYtBQBPPxIiZo31L5yXrSxDfvQ6vEklEi6dmdC6hh1PTf9S9ior/OYC3ELFMj
         cdKNDE8gPa5jwD/DiCJI8JalCLtJoG3ybgQCXGIPZjrPDq1oFcEbPKNPGNCWF04dh+
         qIW9LkymIH6JgS5Tcn4099GJpgk1JcV7iidM1feXaHDu47z4BrzQNiwqG3eLIG56P1
         GanClKVglRAGl9DWc9gDyetUv8DylKsifXSTgF7L4A/eRcGsQKPU0XvboWSYqY6wEJ
         60eDQxJkwylow==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 084C2E4D026;
        Thu, 16 Feb 2023 05:30:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 net-next] net: phy: motorcomm: uninitialized variables in
 yt8531_link_change_notify()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <167652541903.5481.7404304709458067270.git-patchwork-notify@kernel.org>
Date:   Thu, 16 Feb 2023 05:30:19 +0000
References: <Y+xd2yJet2ImHLoQ@kili>
In-Reply-To: <Y+xd2yJet2ImHLoQ@kili>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Frank.Sae@motor-comm.com, andrew@lunn.ch, hkallweit1@gmail.com,
        linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 15 Feb 2023 07:21:47 +0300 you wrote:
> These booleans are never set to false, but are just used without being
> initialized.
> 
> Fixes: 4ac94f728a58 ("net: phy: Add driver for Motorcomm yt8531 gigabit ethernet phy")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> v2: reverse Christmas tree.  Also add "motorcomm" to the subject.  It
> really feels like previous patches to this driver should have had
> motorcomm in the subject as well.  It's a common anti-pattern to only
> put the subsystem name and not the driver name when adding a new file.
> 
> [...]

Here is the summary with links:
  - [v2,net-next] net: phy: motorcomm: uninitialized variables in yt8531_link_change_notify()
    https://git.kernel.org/netdev/net-next/c/9753613f7399

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


