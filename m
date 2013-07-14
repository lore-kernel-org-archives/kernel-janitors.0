From: Dan Carpenter <error27@gmail.com>
Date: Sun, 14 Jul 2013 19:40:37 +0000
Subject: Re: [patch -stable] svcrdma: underflow issue in decode_write_list()
Message-Id: <CA+_b7D+2O2E0S4vQY37SZcK3VTPUdd1cP8y9NuZM-HWwP3HNGw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130712063903.GB29320@longonot.mountain>
	<51DFBD49.7000205@bfs.de>
In-Reply-To: <51DFBD49.7000205@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wharms@bfs.de
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Trond Myklebust <Trond.Myklebust@netapp.com>, "J. Bruce Fields" <bfields@fieldses.org>, "David S. Miller" <davem@davemloft.net>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 7/12/13, walter harms <wharms@bfs.de> wrote:

> i am struggling to understand what is actually checked here.
> Perhaps this improves the readability a bit
>  if ( nchunks < 0 ||
>        sizeof(struct rpcrdma_write_chunk) * nchunks > (SIZE_MAX - start) ||

That doesn't work.

This is one of the few times I get to use algebra in real life.  Yay!
The problem is you have to
have the nchunks by itself and the trusted bits on the other side.  So
the multiply becomes a
divide.

There are lots of these checks in the kernel.  It's idiomatic.

regards,
dan carpenter
