From: David Miller <davem@davemloft.net>
Date: Tue, 23 Aug 2016 00:05:51 +0000
Subject: Re: [PATCH] mlx5/core: Use memdup_user() rather than duplicating its implementation
Message-Id: <20160822.170551.1169143382468496713.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
        <ceb39933-438d-920d-f294-ea0ce32fd171@users.sourceforge.net>
In-Reply-To: <ceb39933-438d-920d-f294-ea0ce32fd171-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
Cc: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, leonro-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, matanb-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, julia.lawall-L2FTfq7BK8M@public.gmane.org

From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 Aug 2016 08:01:22 +0200

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 20 Aug 2016 07:50:09 +0200
> 
> * Reuse existing functionality from memdup_user() instead of keeping
>   duplicate source code.
> 
>   This issue was detected by using the Coccinelle software.
> 
> * Return directly if this copy operation failed.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied.
