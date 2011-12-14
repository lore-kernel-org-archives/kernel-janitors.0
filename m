From: David Miller <davem@davemloft.net>
Date: Wed, 14 Dec 2011 07:47:19 +0000
Subject: Re: [patch] vlan: add rtnl_dereference() annotations
Message-Id: <20111214.024719.723458248077070552.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111214062943.GD7499@elgon.mountain>
In-Reply-To: <20111214062943.GD7499@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: kaber@trash.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, jpirko@redhat.com

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Dec 2011 09:29:43 +0300

> The original code generates a Sparse warning:
> net/8021q/vlan_core.c:336:9:
> 	error: incompatible types in comparison expression (different address spaces)
> 
> It's ok to dereference __rcu pointers here because we are holding the
> RTNL lock.  I've added some calls to rtnl_dereference() to silence the
> warning.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
