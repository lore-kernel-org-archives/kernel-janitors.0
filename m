From: David Miller <davem@davemloft.net>
Date: Wed, 01 Feb 2012 07:53:10 +0000
Subject: Re: [patch] xfrm6: remove unneeded NULL check in __xfrm6_output()
Message-Id: <20120201.025310.1777485011852016937.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120201074526.GC22179@elgon.mountain>
In-Reply-To: <20120201074526.GC22179@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: steffen.klassert@secunet.com, kuznet@ms2.inr.ac.ru, jmorris@namei.org, yoshfuji@linux-ipv6.org, kaber@trash.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 1 Feb 2012 10:45:26 +0300

> We don't check for NULL consistently in __xfrm6_output().  If "x" were
> NULL here it would lead to an OOPs later.  I asked Steffen Klassert
> about this and he suggested that we remove the NULL check.
> 
> On 10/29/11, Steffen Klassert <steffen.klassert@secunet.com> wrote:
>>> net/ipv6/xfrm6_output.c
>>>    148	
>>>    149		if ((x && x->props.mode = XFRM_MODE_TUNNEL) &&
>>>                           ^
>>
>> x can't be null here. It would be a bug if __xfrm6_output() is called
>> without a xfrm_state attached to the skb. I think we can just remove
>> this null check.
> 
> Cc: Steffen Klassert <steffen.klassert@secunet.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
