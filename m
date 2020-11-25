From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Wed, 25 Nov 2020 12:16:57 +0000
Subject: Re: [PATCH] leds: lp50xx: Fix an error handling path in 'lp50xx_probe_dt()'
Message-Id: <20201125121657.GH1008337@kuha.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200922210515.385099-1-christophe.jaillet@wanadoo.fr>
 <20200923133510.GJ4282@kadam>
 <faa49efc-5ba5-b6bd-b486-2f7c4611219b@wanadoo.fr>
 <20200924064932.GP18329@kadam>
 <20200928115301.GB3987353@kuha.fi.intel.com>
 <20201125104629.GE25562@amd>
In-Reply-To: <20201125104629.GE25562@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pavel Machek <pavel@ucw.cz>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, dmurphy@ti.com, jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Nov 25, 2020 at 11:46:29AM +0100, Pavel Machek wrote:
> Hi!
> 
> > > > > I have been trying to teach Smatch to understand reference counting so
> > > > > it can discover these kinds of bugs automatically.
> > > > > 
> > > > > I don't know how software_node_get_next_child() can work when it doesn't
> > > > > call kobject_get().  This sort of bug would have been caught in testing
> > > > > because it affects the success path so I must be reading the code wrong.
> > > > > 
> > > > 
> > > > I had the same reading of the code and thought that I was missing something
> > > > somewhere.
> > > > 
> > > > There is the same question about 'acpi_get_next_subnode' which is also a
> > > > '.get_next_child_node' function, without any ref counting, if I'm correct.
> > > > 
> > > 
> > > Yeah, but there aren't any ->get/put() ops for the acpi_get_next_subnode()
> > > stuff so it's not a problem.  (Presumably there is some other sort of
> > > refcounting policy there).
> > 
> > OK, so I guess we need to make software_node_get_next_child()
> > mimic the behaviour of of_get_next_available_child(), and not
> > acpi_get_next_subnode(). Does the attached patch work?
> 
> Does not sound unreasonable. Did it get solved, somehow?

Has anybody tested my patch?

thanks,

-- 
heikki
