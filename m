From: David Miller <davem@davemloft.net>
Date: Sat, 07 May 2016 19:16:16 +0000
Subject: Re: [patch 2/2] netxen: reversed condition in netxen_nic_set_link_parameters()
Message-Id: <20160507.151616.1691068510125905278.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160505131944.GC3038@mwanda>
In-Reply-To: <20160505131944.GC3038@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: manish.chopra@qlogic.com, sony.chacko@qlogic.com, rajesh.borundia@qlogic.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 5 May 2016 16:19:44 +0300

> My static checker complains that we are using "autoneg" without
> initializing it.  The problem is the ->phy_read() condition is reversed
> so we only set this on error instead of success.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
