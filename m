From: David Miller <davem@davemloft.net>
Date: Tue, 06 Dec 2011 17:59:09 +0000
Subject: Re: [patch] openvswitch: small potential memory leak in
Message-Id: <20111206.125909.79679060316604834.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111206062707.GA8433@elgon.mountain>
	<CAEP_g=_McLiPzKMM-9PGqddsYe7q6jYkCyAJcE1MU=Q4_Fou4g@mail.gmail.com>
In-Reply-To: <CAEP_g=_McLiPzKMM-9PGqddsYe7q6jYkCyAJcE1MU=Q4_Fou4g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jesse-l0M0P4e3n4LQT0dZR+AlfA@public.gmane.org
Cc: dev-yBygre7rU0TnMu66kgdUjQ@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org

From: Jesse Gross <jesse@nicira.com>
Date: Tue, 6 Dec 2011 09:32:13 -0800

> On Mon, Dec 5, 2011 at 10:27 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>> We're unlikely to hit this leak, but the static checkers complain if we
>> don't take care of it.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Acked-by: Jesse Gross <jesse@nicira.com>

Applied, thanks.
