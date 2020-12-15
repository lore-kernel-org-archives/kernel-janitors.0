From: patchwork-bot+netdevbpf@kernel.org
Date: Tue, 15 Dec 2020 04:00:07 +0000
Subject: Re: [PATCH][next] net: hns3: fix expression that is currently always true
Message-Id: <160800480755.12571.337817358900148497.git-patchwork-notify@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201215000033.85383-1-colin.king@canonical.com>
In-Reply-To: <20201215000033.85383-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: yisen.zhuang@huawei.com, salil.mehta@huawei.com, davem@davemloft.net, kuba@kernel.org, tanhuazhong@huawei.com, shenjian15@huawei.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Tue, 15 Dec 2020 00:00:33 +0000 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The ||  condition in hdev->fd_active_type != HCLGE_FD_ARFS_ACTIVE ||
> hdev->fd_active_type != HCLGE_FD_RULE_NONE will always be true because
> hdev->fd_active_type cannot be equal to two different values at the same
> time. The expression is always true which is not correct. Fix this by
> replacing || with && to correct the logic in the expression.
> 
> [...]

Here is the summary with links:
  - [next] net: hns3: fix expression that is currently always true
    https://git.kernel.org/netdev/net-next/c/efd5a1584537

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html
