From: "Mintz, Yuval" <Yuval.Mintz@cavium.com>
Date: Wed, 14 Jun 2017 09:21:32 +0000
Subject: RE: [PATCH net-next] qed: Fix an off by one bug
Message-Id: <BY2PR0701MB2005D7EC2C3C89C305AAF0508DC30@BY2PR0701MB2005.namprd07.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170614091009.GA29394@elgon.mountain>
In-Reply-To: <20170614091009.GA29394@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> The p_l2_info->pp_qid_usage[] array has "p_l2_info->queues" elements so
> the > here should be a >= or we write beyond the end of the array.
> 
> Fixes: bbe3f233ec5e ("qed: Assign a unique per-queue index to queue-cid")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

While it's a theoretical fix [as check is defensive; the queue-id was supposed
to be validated before reaching this part], it's still the right. Thanks Dan.

Acked-by: Yuval Mintz <Yuval.Mintz@cavium.com>
