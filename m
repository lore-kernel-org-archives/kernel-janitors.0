From: patchwork-bot+netdevbpf@kernel.org
Date: Tue, 08 Dec 2020 03:30:06 +0000
Subject: Re: [PATCH] bpf: propagate __user annotations properly
Message-Id: <160739820678.1788.12048920183003808630.git-patchwork-notify@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201207123720.19111-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201207123720.19111-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, kafai@fb.com, songliubraving@fb.com, yhs@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org, kernel-janitors@vger.kernel.org

Hello:

This patch was applied to bpf/bpf-next.git (refs/heads/master):

On Mon,  7 Dec 2020 13:37:20 +0100 you wrote:
> __htab_map_lookup_and_delete_batch() stores a user pointer in the local
> variable ubatch and uses that in copy_{from,to}_user(), but ubatch misses a
> __user annotation.
> 
> So, sparse warns in the various assignments and uses of ubatch:
> 
>   kernel/bpf/hashtab.c:1415:24: warning: incorrect type in initializer
>     (different address spaces)
>   kernel/bpf/hashtab.c:1415:24:    expected void *ubatch
>   kernel/bpf/hashtab.c:1415:24:    got void [noderef] __user *
> 
> [...]

Here is the summary with links:
  - bpf: propagate __user annotations properly
    https://git.kernel.org/bpf/bpf-next/c/2f4b03195fe8

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html
