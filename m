From: Jesse Gross <jesse@nicira.com>
Date: Mon, 23 Jul 2012 19:54:00 +0000
Subject: Re: [patch] openvswitch: potential NULL deref in sample()
Message-Id: <CAEP_g=8bjVxkymRZmOZraqY5mrkfG-juAu1zXnTdP=UC8cdoqQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120723074628.GA30892@elgon.mountain>
In-Reply-To: <20120723074628.GA30892-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: dev-yBygre7rU0TnMu66kgdUjQ@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>

On Mon, Jul 23, 2012 at 12:46 AM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:
> If there is no OVS_SAMPLE_ATTR_ACTIONS set then "acts_list" is NULL and
> it leads to a NULL dereference when we call nla_len(acts_list).  This
> is a static checker fix, not something I have seen in testing.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

This can never happen in practice because the action list is validated
at the time that userspace installs the flow.  There are plenty of
things in this category that would appear to be unsafe because we'd
much rather do sanity checking on a per-flow basis rather than
per-packet.
