Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C621AE95A82
	for <kernel-janitors@archiver.kernel.org>; Sun,  8 Oct 2023 13:01:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344774AbjJHNBr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 8 Oct 2023 09:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344746AbjJHNBq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 8 Oct 2023 09:01:46 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B85F1B6
        for <kernel-janitors@vger.kernel.org>; Sun,  8 Oct 2023 06:01:45 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A371C433CA;
        Sun,  8 Oct 2023 13:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696770105;
        bh=HMuod/sQIBw25FNhGwfbVXfGLURFP8W2BfMfTcjpq+o=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ghPM3dBYNFZaBw/WGu7afyySXeE3nhQ5KkfF75BcjKKPfsrBM2k0/zW1NuquFgLFL
         v75QORsaFHH3flxcllDSImgy65GbqqZAxLJTGEKbx5hLi6yGy2FDwOtByGbMq3L7jq
         j5UqSoqiQ9irS7aCcHPp7j7pU0svn2iF8vXHal4c2tUO07ZNhZ3PtQdCqKCLqi/l4M
         gC4N1DqVVWk4xiCZeyj83kHOZFM010K2Viwc+oyzveM2J6r4S4RPYgsvsLIsBpmnSo
         6c1PFvHCWpehkWN9z3wgzNeR+/7XgcuXEBedUOR/tvuazSBK/gu6IKcRGV95svNdzm
         9JNax29I1DoGw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3FEBDC395E0;
        Sun,  8 Oct 2023 13:01:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] mlxsw: fix mlxsw_sp2_nve_vxlan_learning_set() return type
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169677010525.31796.12660644499166832802.git-patchwork-notify@kernel.org>
Date:   Sun, 08 Oct 2023 13:01:45 +0000
References: <6b2eb847-1d23-4b72-a1da-204df03f69d3@moroto.mountain>
In-Reply-To: <6b2eb847-1d23-4b72-a1da-204df03f69d3@moroto.mountain>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     idosch@mellanox.com, idosch@nvidia.com, petrm@nvidia.com,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Thu, 5 Oct 2023 17:00:12 +0300 you wrote:
> The mlxsw_sp2_nve_vxlan_learning_set() function is supposed to return
> zero on success or negative error codes.  So it needs to be type int
> instead of bool.
> 
> Fixes: 4ee70efab68d ("mlxsw: spectrum_nve: Add support for VXLAN on Spectrum-2")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> [...]

Here is the summary with links:
  - [net] mlxsw: fix mlxsw_sp2_nve_vxlan_learning_set() return type
    https://git.kernel.org/netdev/net/c/1e0b72a2a643

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


