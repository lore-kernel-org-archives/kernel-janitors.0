From: David Miller <davem@davemloft.net>
Date: Thu, 05 Feb 2015 08:34:04 +0000
Subject: Re: [PATCH] net: Mellanox: Delete unnecessary checks before the function call "vunmap"
Message-Id: <20150205.003404.261962007607296519.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
	<5317A59D.4@users.sourceforge.net>
	<54D22B29.3020200@users.sourceforge.net>
In-Reply-To: <54D22B29.3020200-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
Cc: eli-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, julia.lawall-L2FTfq7BK8M@public.gmane.org

From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 04 Feb 2015 15:22:33 +0100

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 4 Feb 2015 15:17:00 +0100
> 
> The vunmap() function performs also input parameter validation.
> Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

This does not apply cleanly to the net-next tree, please respin.
