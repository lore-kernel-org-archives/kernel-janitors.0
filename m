From: David Miller <davem@davemloft.net>
Date: Tue, 03 May 2016 17:03:23 +0000
Subject: Re: [PATCH] VSOCK: constify vsock_transport structure
Message-Id: <20160503.130323.1929865256655720740.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1462106955-22131-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1462106955-22131-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun,  1 May 2016 14:49:15 +0200

> The vsock_transport structure is never modified, so declare it as const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.
