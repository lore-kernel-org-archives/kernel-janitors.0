From: David Miller <davem@davemloft.net>
Date: Mon, 28 Dec 2015 05:38:47 +0000
Subject: Re: [PATCH] qlcnic: constify qlcnic_dcb_ops structures
Message-Id: <20151228.003847.613118803384387386.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1451250089-6989-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1451250089-6989-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: Dept-GELinuxNICDev@qlogic.com, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 27 Dec 2015 22:01:29 +0100

> The qlcnic_dcb_ops structures are never modified, so declare them as const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied, thanks Julia.
