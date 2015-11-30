From: Haggai Eran <haggaie@mellanox.com>
Date: Mon, 30 Nov 2015 06:07:57 +0000
Subject: Re: [PATCH 3/3] IB/core: constify mmu_notifier_ops structures
Message-Id: <565BE7BD.80000@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1448834571-2988-1-git-send-email-Julia.Lawall@lip6.fr>
 <1448834571-2988-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1448834571-2988-4-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 30/11/2015 00:02, Julia Lawall wrote:
> This mmu_notifier_ops structure is never modified, so declare it as
> const, like the other mmu_notifier_ops structures.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Reviewed-by: Haggai Eran <haggaie@mellanox.com>

Thanks,
Haggai

