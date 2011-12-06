From: Jesse Gross <jesse@nicira.com>
Date: Tue, 06 Dec 2011 17:32:13 +0000
Subject: Re: [patch] openvswitch: small potential memory leak in ovs_vport_alloc()
Message-Id: <CAEP_g=_McLiPzKMM-9PGqddsYe7q6jYkCyAJcE1MU=Q4_Fou4g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111206062707.GA8433@elgon.mountain>
In-Reply-To: <20111206062707.GA8433-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: dev-yBygre7rU0TnMu66kgdUjQ@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>

On Mon, Dec 5, 2011 at 10:27 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We're unlikely to hit this leak, but the static checkers complain if we
> don't take care of it.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Jesse Gross <jesse@nicira.com>

Thanks Dan.
