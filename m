From: Patrick McHardy <kaber@trash.net>
Date: Mon, 04 Jan 2010 14:23:23 +0000
Subject: Re: [PATCH 5/5] net/ipv4 : Correct the size argument to kzalloc
Message-Id: <4B41F9DB.1010908@trash.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0912292016230.4001@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0912292016230.4001@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: "David S. Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, "Pekka Savola (ipv6)" <pekkas@netcore.fi>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> obj has type struct snmp_object **, not struct snmp_object *.  But indeed
> it is not even clear why kmalloc is needed.  The memory is freed by the end
> of the function, so the local variable of pointer type should be sufficient.

Thanks. As this is basically just an unneeded and oversized allocation
without any bad consequences, I've applied it to nf-next-2.6.git.


