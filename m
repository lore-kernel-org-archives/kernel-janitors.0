From: Sagi Grimberg <sagig@dev.mellanox.co.il>
Date: Sun, 29 Nov 2015 09:31:12 +0000
Subject: Re: [PATCH] IB/iser: constify iser_reg_ops structure
Message-Id: <565AC5E0.5030703@dev.mellanox.co.il>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1448725924-26376-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1448725924-26376-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Or Gerlitz <ogerlitz@mellanox.com>
Cc: kernel-janitors@vger.kernel.org, Sagi Grimberg <sagig@mellanox.com>, Roi Dayan <roid@mellanox.com>, Doug Ledford <dledford@redhat.com>, Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org



On 28/11/2015 17:52, Julia Lawall wrote:
> The iser_reg_ops structures are never modified, so declare them as const.
>
> Done with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Thanks,

Acked-by: Sagi Grimberg <sagig@mellanox.com>
