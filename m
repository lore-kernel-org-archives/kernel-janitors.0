From: Jason Cooper <jason@lakedaemon.net>
Date: Sun, 24 Nov 2013 13:03:57 +0000
Subject: Re: [patch] bus: mvebu-mbus: potential forever loop in mvebu_mbus_init()
Message-Id: <20131124130357.GC29241@titan.lakedaemon.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131113075024.GH25541@elgon.mountain>
In-Reply-To: <20131113075024.GH25541@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Nov 24, 2013 at 08:20:59AM -0300, Ezequiel Garcia wrote:
> On Wed, Nov 13, 2013 at 02:32:32PM -0300, Ezequiel Garcia wrote:
> > On Wed, Nov 13, 2013 at 10:50:24AM +0300, Dan Carpenter wrote:
> > > "of_id->compatible" is an array and not a pointer so it can never be
> > > NULL.
> > > 
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > > I'm not able to compile this.
> > > 
> > > diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
> > > index 2394e97..c646a76 100644
> > > --- a/drivers/bus/mvebu-mbus.c
> > > +++ b/drivers/bus/mvebu-mbus.c
> > > @@ -734,11 +734,11 @@ int __init mvebu_mbus_init(const char *soc, phys_addr_t mbuswins_phys_base,
> > >  {
> > >  	const struct of_device_id *of_id;
> > >  
> > > -	for (of_id = of_mvebu_mbus_ids; of_id->compatible; of_id++)
> > > +	for (of_id = of_mvebu_mbus_ids; of_id->compatible[0]; of_id++)
> > >  		if (!strcmp(of_id->compatible, soc))
> > >  			break;
> > >  
> > > -	if (!of_id->compatible) {
> > > +	if (!of_id->compatible[0]) {
> > >  		pr_err("could not find a matching SoC family\n");
> > >  		return -ENODEV;
> > >  	}
> > 
> > Nice catch.
> > 
> > Just for the sake of it, I reproduced the bug, and then tested it's
> > solved by the patch. The issue only hits the old platforms that aren't
> > converted to DT.
> > 
> > Acked-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> > 
> 
> Jason:
> 
> FWIW, in case you've missed this mail, I tested this when Dan reported
> it. See above.

Fixed.  Sorry I missed that.

thx,

Jason.
