From: David Miller <davem@davemloft.net>
Date: Tue, 05 Jan 2016 02:58:42 +0000
Subject: Re: [PATCH] chelsio: constify cphy_ops structures
Message-Id: <20160104.215842.805773938758908870.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1451826577-21403-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1451826577-21403-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: santosh@chelsio.com, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun,  3 Jan 2016 14:09:37 +0100

> The cphy_ops structures are never modified, so declare them as const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied, thanks Julia.
