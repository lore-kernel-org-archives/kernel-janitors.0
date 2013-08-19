From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Date: Mon, 19 Aug 2013 07:33:29 +0000
Subject: Re: [patch -next] ipip: dereferencing an ERR_PTR in ip_tunnel_init_net()
Message-Id: <5211CA49.7080609@6wind.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130819070510.GE28591@elgon.mountain>
In-Reply-To: <20130819070510.GE28591@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Patrick McHardy <kaber@trash.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 19/08/2013 09:05, Dan Carpenter a =E9crit :
> We need to move the derefernce after the IS_ERR() check.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
