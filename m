From: patchwork-bot+netdevbpf@kernel.org
Date: Tue, 22 Dec 2020 01:40:06 +0000
Subject: Re: [PATCH net] atm: idt77252: call pci_disable_device() on error path
Message-Id: <160860120699.2677.5928345202899803037.git-patchwork-notify@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X93dmC4NX0vbTpGp@mwanda>
In-Reply-To: <X93dmC4NX0vbTpGp@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: 3chas3@gmail.com, chas@cmf.nrl.navy.mil, davem@davemloft.net, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Sat, 19 Dec 2020 14:01:44 +0300 you wrote:
> This error path needs to disable the pci device before returning.
> 
> Fixes: ede58ef28e10 ("atm: remove deprecated use of pci api")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/atm/idt77252.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [net] atm: idt77252: call pci_disable_device() on error path
    https://git.kernel.org/netdev/net/c/8df66af5c1e5

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html
