From: David Miller <davem@davemloft.net>
Date: Sat, 09 Jul 2016 04:02:30 +0000
Subject: Re: [patch -next] bnxt: fix a condition
Message-Id: <20160709.000230.1944126559698750228.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160707082309.GC16742@mwanda>
In-Reply-To: <20160707082309.GC16742@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: michael.chan@broadcom.com, huangjw@broadcom.com, aduyck@mirantis.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 7 Jul 2016 11:23:09 +0300

> This code generates as static checker warning because htons(ETH_P_IPV6)
> is always true.  From the context it looks like the && was intended to
> be !=.
> 
> Fixes: 94758f8de037 ('bnxt_en: Add GRO logic for BCM5731X chips.')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
