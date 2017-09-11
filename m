From: David Miller <davem@davemloft.net>
Date: Mon, 11 Sep 2017 17:29:34 +0000
Subject: Re: [PATCH net] phy: mvebu-cp110: checking for NULL instead of IS_ERR()
Message-Id: <20170911.102934.1357684377387473638.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170908103137.zck6bw66sge4fhua@mwanda>
        <20170908.210905.626281012369795940.davem@davemloft.net>
        <1bc9c815-08ba-1095-eb6d-a753b3d0c755@ti.com>
In-Reply-To: <1bc9c815-08ba-1095-eb6d-a753b3d0c755@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kishon@ti.com
Cc: dan.carpenter@oracle.com, antoine.tenart@free-electrons.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Kishon Vijay Abraham I <kishon@ti.com>
Date: Mon, 11 Sep 2017 12:54:47 +0530

> On Saturday 09 September 2017 09:39 AM, David Miller wrote:
>> Yeah let's sort this out before I apply this fix to my tree.
> 
> I'll take this fix in linux-phy tree after -rc1 is tagged if that's okay with you.

No problem, although I don't see why one would delay bug fixes... ever.

