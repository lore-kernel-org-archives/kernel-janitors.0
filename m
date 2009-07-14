From: Julia Lawall <julia@diku.dk>
Date: Tue, 14 Jul 2009 12:15:42 +0000
Subject: Re: [PATCH 1/2] fs/xfs: Drop unnecessary NULL test
Message-Id: <Pine.LNX.4.64.0907141412550.456@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907131209250.6808@ask.diku.dk>
	<bzy7hybzh6k.fsf@fransum.emea.sgi.com>
In-Reply-To: <bzy7hybzh6k.fsf@fransum.emea.sgi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Olaf Weber <olaf@sgi.com>
Cc: xfs-masters@oss.sgi.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, xfs@oss.sgi.com

On Tue, 14 Jul 2009, Olaf Weber wrote:

> Julia Lawall writes:
> 
> > From: Julia Lawall <julia@diku.dk>
> > The result of container_of should not be NULL.  In particular, in this case
> > the argument to the enclosing function has passed though INIT_DELAYED_WORK,
> > which dereferences it, implying that its container cannot be NULL.
> 
> Given the defn of container_of() it seems clear that neither its input
> pointer nor its result should ever be NULL.

container_of just does pointer arithmetic.  The result of that arithmetic 
can be NULL, ie if the argument was obtained from an expression of the 
form &x->f where x was NULL.  But in principle, values should be checked 
for NULL beforehand.

julia
