From: David Miller <davem@davemloft.net>
Date: Tue, 19 Feb 2019 22:11:00 +0000
Subject: Re: [PATCH v4] net: ns83820: code cleanup for ns83820_probe_phy()
Message-Id: <20190219.141100.1059737970253170004.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190219134510.51835-1-maowenan@huawei.com>
In-Reply-To: <20190219134510.51835-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maowenan@huawei.com
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, john.fastabend@gmail.com, hawk@kernel.org, jakub.kicinski@netronome.com, daniel@iogearbox.net, ast@kernel.org, julia.lawall@lip6.fr, wharms@bfs.de

From: Mao Wenan <maowenan@huawei.com>
Date: Tue, 19 Feb 2019 21:45:10 +0800

> This patch is to do code cleanup for ns83820_probe_phy().
> It deletes unused variable 'first', commented out code,
> and the pointless 'for' loop.
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> Acked-by: Julia Lawall <julia.lawall@lip6.fr>
> ---
>  v3->v4: delete pointless 'for' loop, variable 'i', and so on.

Before pushing out I realized I applied v3 instead of this v4, but
that's now fixed up.
