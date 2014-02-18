From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Feb 2014 12:59:52 +0000
Subject: Re: regmap: Separate regmap dev initialization
Message-Id: <20140218125952.GK26776@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140218122410.GA9825@elgon.mountain>
In-Reply-To: <20140218122410.GA9825@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Feb 18, 2014 at 01:33:30PM +0100, Michal Simek wrote:
> Hi Dan,
> 
> On 02/18/2014 01:24 PM, Dan Carpenter wrote:
> > Hello Michal Simek,
> > 
> > The patch 6cfec04bcc05: "regmap: Separate regmap dev initialization"
> > from Feb 10, 2014, leads to the following static checker warning:
> > 
> > 	drivers/base/regmap/regmap.c:765 regmap_init()
> > 	warn: add curly braces?
> > 
> > drivers/base/regmap/regmap.c
> >    759          ret = regcache_init(map, config);
> >    760          if (ret != 0)
> >    761                  goto err_range;
> >    762  
> >    763          if (dev)
> >    764                  ret = regmap_attach_dev(dev, map, config);
> >    765                  if (ret != 0)
> >    766                          goto err_regcache;
> > 
> > Please add curly braces or adjust the indenting to not confuse the
> > static checkers.
> 
> I am aware about this. Mark has already applied RFC to any his branch
> :-(. I can send v2 but it is up to Mark if he wants to fix it or not.
> 

Oh, crap.  Sorry, I reported this twice.  I didn't mean to do that.

I normally grep my outbox to avoid this but I had a typo in my grep this
time.

regards,
dan carpenter

