From: David Miller <davem@davemloft.net>
Date: Fri, 23 Jun 2017 18:20:30 +0000
Subject: Re: [PATCH -net] tls: return -EFAULT if copy_to_user() fails
Message-Id: <20170623.142030.1486260738446581677.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170623101544.c5bvwe5cd6e46bd5@mwanda>
In-Reply-To: <20170623101544.c5bvwe5cd6e46bd5@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: davejwatson@fb.com, aviadye@mellanox.com, ilyal@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Jun 2017 13:15:44 +0300

> The copy_to_user() function returns the number of bytes remaining but we
> want to return -EFAULT here.
> 
> Fixes: 3c4d7559159b ("tls: kernel TLS support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Dan, I happened to realize that tls is only in net-next, but please
indicate the target tree properly in your Subject lines in the
future.

Applied, thanks.
