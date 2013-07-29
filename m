From: Jiri Pirko <jiri@resnulli.us>
Date: Mon, 29 Jul 2013 21:17:54 +0000
Subject: Re: [patch] net: remove an unneeded check
Message-Id: <20130729211754.GA6386@minipsycho.orion>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130729191519.GA11874@elgon.mountain>
In-Reply-To: <20130729191519.GA11874@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Patrick McHardy <kaber@trash.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Mon, Jul 29, 2013 at 09:15:19PM CEST, dan.carpenter@oracle.com wrote:
>"ifa->ifa_label" is an array inside the in_ifaddr struct.  It can never
>be NULL so we can remove this check.
>
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Jiri Pirko <jiri@resnulli.us>
