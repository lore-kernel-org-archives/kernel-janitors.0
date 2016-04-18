From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Mon, 18 Apr 2016 12:19:37 +0000
Subject: Re: [patch -next] udp: fix if statement in SIOCINQ ioctl
Message-Id: <1460981977.10638.105.camel@edumazet-glaptop3.roam.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160418084449.GA12410@mwanda>
In-Reply-To: <20160418084449.GA12410@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, Willem de Bruijn <willemb@google.com>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Patrick McHardy <kaber@trash.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 2016-04-18 at 11:44 +0300, Dan Carpenter wrote:
> We deleted a line of code and accidentally made the "return put_user()"
> part of the if statement when it's supposed to be unconditional.
> 
> Fixes: 9f9a45beaa96 ('udp: do not expect udp headers on ioctl SIOCINQ')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Eric Dumazet <edumazet@google.com>


