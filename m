From: "Mintz, Yuval" <Yuval.Mintz@cavium.com>
Date: Sun, 30 Apr 2017 07:54:32 +0000
Subject: RE: [PATCH net] qed: Unlock on error in qed_vf_pf_acquire()
Message-Id: <BLUPR0701MB200472744FABF8DA1E2118BE8D150@BLUPR0701MB2004.namprd07.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170428125608.djln5r7h4d53it5s@mwanda>
In-Reply-To: <20170428125608.djln5r7h4d53it5s@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Elior, Ariel" <Ariel.Elior@cavium.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> My static checker complains that we're holding a mutex on this error path.
> Let's goto exit instead of returning directly.
> 
> Fixes: b0bccb69eba3 ("qed: Change locking scheme for VF channel")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Yuval, could you review this one a bit carefully and also check that my Fixes
> tag is correct because I'm not certain.

Yes it seems like the right one. Thanks!

Acked-by: Yuval Mintz <Yuval.Mintz@cavium.com>
