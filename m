From: David Miller <davem@davemloft.net>
Date: Wed, 24 Jul 2013 22:45:14 +0000
Subject: Re: [patch] mlx5: use after free in mlx5_cmd_comp_handler()
Message-Id: <20130724.154514.498183770995136243.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130722080201.GG14617@longonot.mountain>
	<20130724163544.GA29427@mtldesk30>
In-Reply-To: <20130724163544.GA29427@mtldesk30>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: eli-LDSdmyG8hGV8YrgS2mwiifqBs+8SCbDb@public.gmane.org
Cc: dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, moshel-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, eli-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Eli Cohen <eli@dev.mellanox.co.il>
Date: Wed, 24 Jul 2013 19:35:44 +0300

> This race has been spotted and fixed by Moshe Lazer two weeks ago.
> Anyways,
> 
> Acked by Eli Cohen <eli@mellanox.com>

Applied.
