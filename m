From: "Maciej W. Rozycki" <macro@linux-mips.org>
Date: Mon, 03 Feb 2020 10:20:46 +0000
Subject: Re: [PATCH] defxx: Fix a sentinel at the end of a 'eisa_device_id' structure
Message-Id: <alpine.LFD.2.21.2002031015530.752735@eddie.linux-mips.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200202142341.22124-1-christophe.jaillet@wanadoo.fr> <20200203095553.GN1778@kadam>
In-Reply-To: <20200203095553.GN1778@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 3 Feb 2020, Dan Carpenter wrote:

> > diff --git a/drivers/net/fddi/defxx.c b/drivers/net/fddi/defxx.c
> > index 077c68498f04..7ef0c57f07c6 100644
> > --- a/drivers/net/fddi/defxx.c
> > +++ b/drivers/net/fddi/defxx.c
> > @@ -3768,11 +3768,11 @@ static void dfx_pci_unregister(struct pci_dev *pdev)
> >  
> >  #ifdef CONFIG_EISA
> >  static const struct eisa_device_id dfx_eisa_table[] = {
> > -        { "DEC3001", DEFEA_PROD_ID_1 },
> > -        { "DEC3002", DEFEA_PROD_ID_2 },
> > -        { "DEC3003", DEFEA_PROD_ID_3 },
> > -        { "DEC3004", DEFEA_PROD_ID_4 },
> > -        { }
> > +	{ "DEC3001", DEFEA_PROD_ID_1 },
> > +	{ "DEC3002", DEFEA_PROD_ID_2 },
> > +	{ "DEC3003", DEFEA_PROD_ID_3 },
> > +	{ "DEC3004", DEFEA_PROD_ID_4 },
> > +	{ "" }
> 
> You haven't changed runtime at all.  :P (struct eisa_device_id)->sig[]
> is an array, not a pointer.  There is no NULL dereference because an
> array in the middle of another array can't be NULL.

 Right, the code is good as it stands (I should have more faith in my past 
achievements ;) ).  Except for the whitespace issue, which I suppose might 
not be worth bothering to fix.  Thanks for your meticulousness!

  Maciej
