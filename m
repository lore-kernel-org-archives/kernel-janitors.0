From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 Jun 2012 07:57:46 +0000
Subject: Re: [PATCH] netxen: Error return off by one in 'netxen_nic_set_pauseparam()'.
Message-Id: <20120620075746.GT4400@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1340177259-14083-1-git-send-email-santoshprasadnayak@gmail.com>
In-Reply-To: <1340177259-14083-1-git-send-email-santoshprasadnayak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: santosh nayak <santoshprasadnayak@gmail.com>
Cc: sony.chacko@qlogic.com, rajesh.borundia@qlogic.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jun 20, 2012 at 12:57:39PM +0530, santosh nayak wrote:
> From: Santosh Nayak <santoshprasadnayak@gmail.com>
> 
> There are 'NETXEN_NIU_MAX_GBE_PORTS'  GBE ports. Port indexing starts
> from zero. 
> Hence we should also return error for "port = NETXEN_NIU_MAX_GBE_PORTS"
> 

So my understanding is that you are guessing on this based on the
fact that, "Who counts from 0-4 inclusive?".  I can't argue with
that logic.

Looking some more at NETXEN_NIU_MAX_XG_PORTS.  It is used off by one
4 times and it's used correctly 1 time.

regards,
dan carpenter

