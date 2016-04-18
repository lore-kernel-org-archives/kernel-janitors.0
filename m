From: David Miller <davem@davemloft.net>
Date: Mon, 18 Apr 2016 17:40:39 +0000
Subject: Re: [patch -next] udp: fix if statement in SIOCINQ ioctl
Message-Id: <20160418.134039.321599420584841995.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160418084449.GA12410@mwanda>
In-Reply-To: <20160418084449.GA12410@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: willemb@google.com, kuznet@ms2.inr.ac.ru, jmorris@namei.org, yoshfuji@linux-ipv6.org, kaber@trash.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 18 Apr 2016 11:44:49 +0300

> We deleted a line of code and accidentally made the "return put_user()"
> part of the if statement when it's supposed to be unconditional.
> 
> Fixes: 9f9a45beaa96 ('udp: do not expect udp headers on ioctl SIOCINQ')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
