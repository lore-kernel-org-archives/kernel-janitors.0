From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sun, 20 Sep 2020 12:14:04 +0000
Subject: Re: [PATCH 01/14] pch_uart: drop double zeroing
Message-Id: <20200920121404.GA2830482@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
 <1600601186-7420-2-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1600601186-7420-2-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Sep 20, 2020 at 01:26:13PM +0200, Julia Lawall wrote:
> sg_init_table zeroes its first argument, so the allocation of that argument
> doesn't have to.
> 
> the semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression x,n,flags;
> @@
> 
> x = 
> - kcalloc
> + kmalloc_array
>   (n,sizeof(struct scatterlist),flags)
> ...
> sg_init_table(x,n)
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

It inits the first entry in the array, but what about all of the other
ones?  Is that "safe" to have uninitialized data in them like your
change causes to happen?

thanks,

greg k-h
