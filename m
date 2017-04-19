From: "Mintz, Yuval" <Yuval.Mintz@cavium.com>
Date: Wed, 19 Apr 2017 10:12:44 +0000
Subject: RE: [PATCH net-next] qede: allocate enough data for ->arfs_fltr_bmap
Message-Id: <BL2PR07MB23064ACD404C3789B1E7DDC28D180@BL2PR07MB2306.namprd07.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170419095432.GA4266@mwanda>
In-Reply-To: <20170419095432.GA4266@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "Chopra, Manish" <Manish.Chopra@cavium.com>
Cc: "Elior, Ariel" <Ariel.Elior@cavium.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "Chopra@mwanda" <Chopra@mwanda>

> We've got the number of longs, yes, but we should multiply by
> sizeof(long) to get the number of bytes needed.
> 
> Fixes: e4917d46a653 ("qede: Add aRFS support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks Dan.

Acked-by: Yuval Mintz <Yuval.Mintz@cavium.com>
