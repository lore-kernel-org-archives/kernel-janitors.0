From: David Miller <davem@davemloft.net>
Date: Mon, 18 Jan 2016 19:12:59 +0000
Subject: Re: [PATCH] ide: constify ide_dma_ops structures
Message-Id: <20160118.141259.2240054190302250383.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1447619790-5203-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1447619790-5203-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: kernel-janitors@vger.kernel.org, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 15 Nov 2015 21:36:30 +0100

> The ide_dma_ops structures are never modified, so declare these as const,
> as is already done for the others.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.
