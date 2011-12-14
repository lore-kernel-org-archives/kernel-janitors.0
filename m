From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Wed, 14 Dec 2011 07:01:00 +0000
Subject: Re: [patch] vlan: add rtnl_dereference() annotations
Message-Id: <1323846060.2846.23.camel@edumazet-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111214062943.GD7499@elgon.mountain>
In-Reply-To: <20111214062943.GD7499@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Patrick McHardy <kaber@trash.net>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Jiri Pirko <jpirko@redhat.com>

Le mercredi 14 décembre 2011 à 09:29 +0300, Dan Carpenter a écrit :
> The original code generates a Sparse warning:
> net/8021q/vlan_core.c:336:9:
> 	error: incompatible types in comparison expression (different address spaces)
> 
> It's ok to dereference __rcu pointers here because we are holding the
> RTNL lock.  I've added some calls to rtnl_dereference() to silence the
> warning.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I haven't tested this, and I'm not super familiar with this code.
> Please review it carefully.
> 

Acked-by: Eric Dumazet <eric.dumazet@gmail.com>


