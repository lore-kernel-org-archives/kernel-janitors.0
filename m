From: David Miller <davem@davemloft.net>
Date: Mon, 25 Jun 2012 22:27:28 +0000
Subject: Re: [PATCH] netxen : Error return off by one for XG port.
Message-Id: <20120625.152728.927283949220930736.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1340189578-18308-1-git-send-email-santoshprasadnayak@gmail.com>
In-Reply-To: <1340189578-18308-1-git-send-email-santoshprasadnayak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: santoshprasadnayak@gmail.com
Cc: sony.chacko@qlogic.com, rajesh.borundia@qlogic.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: santosh nayak <santoshprasadnayak@gmail.com>
Date: Wed, 20 Jun 2012 16:22:58 +0530

> From: Santosh Nayak <santoshprasadnayak@gmail.com>
> 
> There are  NETXEN_NIU_MAX_XG_PORTS ports.
> Port indexing starts from zero.
> Hence we should also return error for  'port = NETXEN_NIU_MAX_XG_PORTS'.
> 
> Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>

Applied.
