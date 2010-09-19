From: David Miller <davem@davemloft.net>
Date: Sun, 19 Sep 2010 18:26:02 +0000
Subject: Re: [patch -next] bna: off by one
Message-Id: <20100919.112602.183060281.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100918234144.GB6236@bicker>
In-Reply-To: <20100918234144.GB6236@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: rmody@brocade.com, ddutt@brocade.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Sun, 19 Sep 2010 01:41:44 +0200

> The mod->mbhdlr[] array has BFI_MC_MAX elements.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied, thanks Dan.
