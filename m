From: Or Gerlitz <or.gerlitz@gmail.com>
Date: Thu, 30 Jan 2014 21:05:50 +0000
Subject: Re: [patch] IB/iser: use after free in iser_snd_completion()
Message-Id: <CAJZOPZ+VHvfum+PcOtUW7RCaLcTbmo_sdLhe3oVq2xHCUZMojA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140129131850.GD10678@elgon.mountain>
	<CAJZOPZ+NccdZU7n6pOs2hgim5PWQmU6PdvGxqcTxDErcJmALNA@mail.gmail.com>
In-Reply-To: <CAJZOPZ+NccdZU7n6pOs2hgim5PWQmU6PdvGxqcTxDErcJmALNA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Or Gerlitz <ogerlitz-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Roi Dayan <roid-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, Jan 30, 2014 at 11:04 PM, Or Gerlitz <or.gerlitz@gmail.com> wrote:
> On Wed, Jan 29, 2014, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>> We use "tx_desc" again after we free it.
>
> yep, this is legacy code which isn't much of use over the last years
> and hence the bug went in unnoticed

Acked-by: Or Gerlitz <ogerlitz@mellanox.com>
