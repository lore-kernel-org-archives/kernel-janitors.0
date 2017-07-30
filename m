From: David Miller <davem@davemloft.net>
Date: Sun, 30 Jul 2017 06:28:55 +0000
Subject: Re: [PATCH net] mcs7780: Silence uninitialized variable warning
Message-Id: <20170729.232855.1831311386560187695.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170728144511.tf7nc672hwo35rnn@mwanda>
In-Reply-To: <20170728144511.tf7nc672hwo35rnn@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: samuel@sortiz.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Jul 2017 17:45:11 +0300

> -	__u16 rval;
> +	__u16 rval = -1;

Fixing a bogus warning by assigning a signed constant to an
unsigned variable doesn't really make me all that happy.

I don't think I'll apply this, sorry.

