From: David Miller <davem@davemloft.net>
Date: Sun, 05 May 2019 07:52:22 +0000
Subject: Re: [PATCH][next] openvswitch: check for null pointer return from nla_nest_start_noflag
Message-Id: <20190505.005222.425677449950429602.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190501134158.15307-1-colin.king@canonical.com>
In-Reply-To: <20190501134158.15307-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: pshelar@ovn.org, netdev@vger.kernel.org, dev@openvswitch.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed,  1 May 2019 14:41:58 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The call to nla_nest_start_noflag can return null in the unlikely
> event that nla_put returns -EMSGSIZE.  Check for this condition to
> avoid a null pointer dereference on pointer nla_reply.
> 
> Addresses-Coverity: ("Dereference null return value")
> Fixes: 11efd5cb04a1 ("openvswitch: Support conntrack zone limit")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thank you.
