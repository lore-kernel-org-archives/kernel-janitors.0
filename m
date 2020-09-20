From: Julia Lawall <julia.lawall@inria.fr>
Date: Sun, 20 Sep 2020 12:47:11 +0000
Subject: Re: [PATCH 01/14] pch_uart: drop double zeroing
Message-Id: <alpine.DEB.2.22.394.2009201443590.2966@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr> <1600601186-7420-2-git-send-email-Julia.Lawall@inria.fr> <20200920121404.GA2830482@kroah.com>
In-Reply-To: <20200920121404.GA2830482@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org



On Sun, 20 Sep 2020, Greg Kroah-Hartman wrote:

> On Sun, Sep 20, 2020 at 01:26:13PM +0200, Julia Lawall wrote:
> > sg_init_table zeroes its first argument, so the allocation of that argument
> > doesn't have to.
> >
> > the semantic patch that makes this change is as follows:
> > (http://coccinelle.lip6.fr/)
> >
> > // <smpl>
> > @@
> > expression x,n,flags;
> > @@
> >
> > x > > - kcalloc
> > + kmalloc_array
> >   (n,sizeof(struct scatterlist),flags)
> > ...
> > sg_init_table(x,n)
> > // </smpl>
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>
> It inits the first entry in the array, but what about all of the other
> ones?  Is that "safe" to have uninitialized data in them like your
> change causes to happen?

Sorry, I don't follow.  The complete code is:

        priv->sg_tx_p = kcalloc(num, sizeof(struct scatterlist), GFP_ATOMIC);
        if (!priv->sg_tx_p) {
		dev_err(priv->port.dev, "%s:kzalloc Failed\n", __func__);
                return 0;
	}

	sg_init_table(priv->sg_tx_p, num); /* Initialize SG table */

and the definition of sg_init_table is:

void sg_init_table(struct scatterlist *sgl, unsigned int nents)
{
	memset(sgl, 0, sizeof(*sgl) * nents);
	sg_init_marker(sgl, nents);
}

It looks to me like it zeroes all of the elements?  The same file does
contain a call:

sg_init_table(&priv->sg_rx, 1);

But that's not the one associated with the patch.

julia
