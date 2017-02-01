From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Wed, 01 Feb 2017 15:26:17 +0000
Subject: Re: [patch] ipv6: pointer math error in ip6_tnl_parse_tlv_enc_lim()
Message-Id: <1485962777.6360.142.camel@edumazet-glaptop3.roam.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170201084632.GA29912@mwanda>
In-Reply-To: <20170201084632.GA29912@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Patrick McHardy <kaber@trash.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2017-02-01 at 11:46 +0300, Dan Carpenter wrote:
> Casting is a high precedence operation but "off" and "i" are in terms of
> bytes so we need to have some parenthesis here.
> 
> Fixes: fbfa743a9d2a ("ipv6: fix ip6_tnl_parse_tlv_enc_lim()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Silly me. Thanks Dan !

Acked-by: Eric Dumazet <edumazet@google.com>


