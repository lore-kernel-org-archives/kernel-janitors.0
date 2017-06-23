From: Joe Perches <joe@perches.com>
Date: Fri, 23 Jun 2017 10:31:44 +0000
Subject: Re: [PATCH -net] tls: return -EFAULT if copy_to_user() fails
Message-Id: <1498213904.24295.10.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170623101544.c5bvwe5cd6e46bd5@mwanda>
In-Reply-To: <20170623101544.c5bvwe5cd6e46bd5@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Dave Watson <davejwatson@fb.com>
Cc: Aviad Yehezkel <aviadye@mellanox.com>, Ilya Lesokhin <ilyal@mellanox.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 2017-06-23 at 13:15 +0300, Dan Carpenter wrote:
> The copy_to_user() function returns the number of bytes remaining but we
> want to return -EFAULT here.

because?

