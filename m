From: David Miller <davem@davemloft.net>
Date: Mon, 06 Aug 2018 20:15:35 +0000
Subject: Re: [PATCH net-next] ipv4: frags: precedence bug in ip_expire()
Message-Id: <20180806.131535.1240437188311937267.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180806191735.c5miffnrhl2w2ljh@kili.mountain>
In-Reply-To: <20180806191735.c5miffnrhl2w2ljh@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: posk@google.com, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 6 Aug 2018 22:17:35 +0300

> We accidentally removed the parentheses here, but they are required
> because '!' has higher precedence than '&'.
> 
> Fixes: fa0f527358bd ("ip: use rb trees for IP frag queue.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Ugh, good catch, applied, thanks!
