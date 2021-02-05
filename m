From: patchwork-bot+netdevbpf@kernel.org
Date: Fri, 05 Feb 2021 03:00:08 +0000
Subject: Re: [PATCH][next] net: hns3: remove redundant null check of an array
Message-Id: <161249400835.18283.15622720081111992226.git-patchwork-notify@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210203131040.21656-1-colin.king@canonical.com>
In-Reply-To: <20210203131040.21656-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: yisen.zhuang@huawei.com, salil.mehta@huawei.com, davem@davemloft.net, kuba@kernel.org, tanhuazhong@huawei.com, huangguangbin2@huawei.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Wed,  3 Feb 2021 13:10:40 +0000 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The null check of filp->f_path.dentry->d_iname is redundant because
> it is an array of DNAME_INLINE_LEN chars and cannot be a null. Fix
> this by removing the null check.
> 
> Addresses-Coverity: ("Array compared against 0")
> Fixes: 04987ca1b9b6 ("net: hns3: add debugfs support for tm nodes, priority and qset info")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> [...]

Here is the summary with links:
  - [next] net: hns3: remove redundant null check of an array
    https://git.kernel.org/netdev/net-next/c/8f8a42ff003a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html
