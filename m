From: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Date: Mon, 22 May 2017 19:22:32 +0000
Subject: Re: [PATCH 2/3] RDS: IB: Improve a size determination in rds_ib_add_one()
Message-Id: <ecb55de0-72bb-8afd-cb24-c9a3ae26c586@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44b46c51-3665-5f14-dd3b-6e6f230258a7@users.sourceforge.net>
 <e8486283-62ac-ea77-1169-edca3e630637@users.sourceforge.net>
In-Reply-To: <e8486283-62ac-ea77-1169-edca3e630637-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rds-devel-N0ozoZBvEnrZJqsBc5GL+g@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Sowmini Varadhan <sowmini.varadhan-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 5/22/2017 7:12 AM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 22 May 2017 15:40:21 +0200
> 
> Replace the specification of a data structure by a pointer dereference
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
Acked-by: Santosh Shilimkar <santosh.shilimkar@oracle.com>
