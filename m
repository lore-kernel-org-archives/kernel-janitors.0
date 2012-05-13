From: David Miller <davem@davemloft.net>
Date: Sun, 13 May 2012 19:47:42 +0000
Subject: Re: [patch] openvswitch: checking wrong variable in queue_userspace_packet()
Message-Id: <20120513.154742.1704782535326120910.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120513184418.GB16541@elgon.mountain>
	<CAEP_g=_LojOio0E5K_vYBkO3BKdW9F=dDam4zwffyZPbSZJd2Q@mail.gmail.com>
In-Reply-To: <CAEP_g=_LojOio0E5K_vYBkO3BKdW9F=dDam4zwffyZPbSZJd2Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jesse-l0M0P4e3n4LQT0dZR+AlfA@public.gmane.org
Cc: dev-yBygre7rU0TnMu66kgdUjQ@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org

From: Jesse Gross <jesse@nicira.com>
Date: Sun, 13 May 2012 12:22:29 -0700

> On Sun, May 13, 2012 at 11:44 AM, Dan Carpenter
> <dan.carpenter@oracle.com> wrote:
>> "skb" is non-NULL here, for example we dereference it in skb_clone().
>> The intent was to test "nskb" which was just set.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Thanks Dan.
> 
> Acked-by: Jesse Gross <jesse@nicira.com>

Applied.
