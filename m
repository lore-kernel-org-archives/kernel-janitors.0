From: Jesse Gross <jesse@nicira.com>
Date: Sun, 13 May 2012 19:22:29 +0000
Subject: Re: [patch] openvswitch: checking wrong variable in queue_userspace_packet()
Message-Id: <CAEP_g=_LojOio0E5K_vYBkO3BKdW9F=dDam4zwffyZPbSZJd2Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120513184418.GB16541@elgon.mountain>
In-Reply-To: <20120513184418.GB16541-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: dev-yBygre7rU0TnMu66kgdUjQ@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>

On Sun, May 13, 2012 at 11:44 AM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:
> "skb" is non-NULL here, for example we dereference it in skb_clone().
> The intent was to test "nskb" which was just set.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks Dan.

Acked-by: Jesse Gross <jesse@nicira.com>
