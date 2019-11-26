From: David Miller <davem@davemloft.net>
Date: Tue, 26 Nov 2019 23:17:53 +0000
Subject: Re: [PATCH net] net: dsa: silence a static checker warning
Message-Id: <20191126.151753.744862410233394124.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191126121854.6omnd7upthqsrwgj@kili.mountain>
In-Reply-To: <20191126121854.6omnd7upthqsrwgj@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: andrew@lunn.ch, olteanv@gmail.com, vivien.didelot@gmail.com, f.fainelli@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 26 Nov 2019 15:18:54 +0300

> This code is harmless but it triggers a Smatch static checker warning:
> 
>     net/dsa/tag_8021q.c:108 dsa_8021q_restore_pvid()
>     error: uninitialized symbol 'pvid'.
> 
> I believe that UBSan will complain at run time as well.  The solution is
> to just re-order the conditions.
> 
> Fixes: c80ed84e7688 ("net: dsa: tag_8021q: Fix dsa_8021q_restore_pvid for an absent pvid")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

THis doesn't apply to the current net tree.
