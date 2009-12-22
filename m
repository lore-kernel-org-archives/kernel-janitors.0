From: Jon Masters <jonathan@jonmasters.org>
Date: Tue, 22 Dec 2009 13:30:34 +0000
Subject: Re: [PATCH 1/2] misc: add __init/__exit macros to
Message-Id: <1261488634.2791.6.camel@tonnant>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1261470564-23754-1-git-send-email-peterhuewe@gmx.de>
	 <20091222130246.GA2368@pengutronix.de>
In-Reply-To: <20091222130246.GA2368@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: peterhuewe@gmx.de, Jiri Kosina <trivial@kernel.org>, kernel-janitors@vger.kernel.org, Jon Masters <jcm@jonmasters.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org

On Tue, 2009-12-22 at 14:02 +0100, Uwe Kleine-König wrote:
> Hello,
> 
> On Tue, Dec 22, 2009 at 09:29:23AM +0100, peterhuewe@gmx.de wrote:
> > From: Peter Huewe <peterhuewe@gmx.de>
> > 
> > Trivial patch which adds the __init/__exit macros to the module_init/
> > module_exit functions of
> > 
> > drivers/misc/hwlat_detector.c
> > 
> > Please have a look at the small patch and either pull it through
> > your tree, or please ack' it so Jiri can pull it through the trivial
> > tree.
> > 
> > Patch against linux-next-tree, 22. Dez 08:38:18 CET 2009
> > but also present in linus tree.
> > 
> > Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
> > ---
> The commit log contains some things that are maybe interesting in this
> mail, but not in git (base tree, plea to look, exact filename).
> 
> Apart from Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

I'll get to this later. Just spent 2 days (should have been 10 hours
door to door) traveling to the UK in the worst storms for ten years on
*both* sides of the atlantic. Currently rediscovering sleep ;)

Jon.


