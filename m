From: David Miller <davem@davemloft.net>
Date: Fri, 26 Aug 2011 16:51:51 +0000
Subject: Re: [patch -next] bna: off by one in bfa_msgq_rspq_pi_update()
Message-Id: <20110826.125151.231397633353837929.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110824113028.GD5975@shale.localdomain>
In-Reply-To: <20110824113028.GD5975@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: rmody@brocade.com, ddutt@brocade.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Wed, 24 Aug 2011 14:30:28 +0300

> The rspq->rsphdlr[] array has BFI_MC_MAX elements, so this test was
> off by one.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
