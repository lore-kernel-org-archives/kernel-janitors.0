From: David Miller <davem@davemloft.net>
Date: Thu, 17 Jul 2014 23:48:53 +0000
Subject: Re: [patch v2] wan/x25_asy: integer overflow in x25_asy_change_mtu()
Message-Id: <20140717.164853.1912480906913796691.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405588471.10255.70.camel@edumazet-glaptop2.roam.corp.google.com>
	<20140717105044.GA28140@mwanda>
In-Reply-To: <20140717105044.GA28140@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: teg@jklm.no, dh.herrmann@gmail.com, netdev@vger.kernel.org, eric.dumazet@gmail.com, David.Laight@ACULAB.COM, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 Jul 2014 13:50:45 +0300

> If "newmtu * 2 + 4" is too large then it can cause an integer overflow
> leading to memory corruption.  Eric Dumazet suggests that 65534 is a
> reasonable upper limit.
> 
> Btw, "newmtu" is not allowed to be a negative number because of the
> check in dev_set_mtu(), so that's ok.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: Cap it at 65534 instead of just testing for integer overflows.
>     Thanks David and Eric!

Applied.
