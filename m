From: Joe Perches <joe@perches.com>
Date: Mon, 30 Dec 2013 23:17:02 +0000
Subject: Re: [PATCH 4/11]  use ether_addr_equal_64bits
Message-Id: <1388445422.26796.38.camel@joe-AO722>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1388427307-8691-1-git-send-email-Julia.Lawall@lip6.fr>
	 <1388427307-8691-5-git-send-email-Julia.Lawall@lip6.fr>
	 <1388429761.4410.1.camel@jlt4.sipsolutions.net>
	 <alpine.DEB.2.02.1312302057420.2209@localhost6.localdomain6>
	 <1388438724.4573.2.camel@jlt4.sipsolutions.net>
	 <20131230215701.GA4938@khazad-dum.debian.net>
	 <1388445188.18164.0.camel@jlt4.sipsolutions.net>
In-Reply-To: <1388445188.18164.0.camel@jlt4.sipsolutions.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Intel Linux Wireless <ilw@linux.intel.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2013-12-31 at 00:13 +0100, Johannes Berg wrote:
> On Mon, 2013-12-30 at 19:57 -0200, Henrique de Moraes Holschuh wrote:
> > On Mon, 30 Dec 2013, Johannes Berg wrote:
> > > On Mon, 2013-12-30 at 20:58 +0100, Julia Lawall wrote:
> > > > > Is there any way we could catch (sparse, or some other script?) that
> > > > > struct reorganising won't break the condition needed ("within a
> > > > > structure that contains at least two more bytes")?
> > > > 
> > > > What kind of reorganizing could happen?  Do you mean that the programmer 
> > > > might do at some time in the future, or something the compiler might do?
> > > 
> > > I'm just thinking of a programmer, e.g. changing a struct like this:
> > > 
> > >  struct foo {
> > >    u8 addr[ETH_ALEN];
> > > -  u16 dummy;
> > >  };

I don't know of a way to catch that.
Anyone else?

