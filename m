From: David Miller <davem@davemloft.net>
Date: Fri, 09 Mar 2018 02:50:23 +0000
Subject: Re: [PATCH 2/2 net-next] net/ncsi: unlock on error in ncsi_set_interface_nl()
Message-Id: <20180308.215023.1992855527469199544.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180308093628.GD16525@mwanda>
In-Reply-To: <20180308093628.GD16525@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: sam@mendozajonas.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 8 Mar 2018 12:36:28 +0300

> There are two error paths which are missing unlocks in this function.
> 
> Fixes: 955dc68cb9b2 ("net/ncsi: Add generic netlink family")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Also applied, thanks Dan.
