From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 23 Sep 2020 18:49:56 +0000
Subject: Re: [PATCH] leds: lp50xx: Fix an error handling path in 'lp50xx_probe_dt()'
Message-Id: <faa49efc-5ba5-b6bd-b486-2f7c4611219b@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200922210515.385099-1-christophe.jaillet@wanadoo.fr>
 <20200923133510.GJ4282@kadam>
In-Reply-To: <20200923133510.GJ4282@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: pavel@ucw.cz, dmurphy@ti.com, jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 23/09/2020 à 15:35, Dan Carpenter a écrit :
> I've added Heikki Krogerus to the CC list because my question is mostly
> about commit 59abd83672f7 ("drivers: base: Introducing software nodes to
> the firmware node framework").
> 
> I have been trying to teach Smatch to understand reference counting so
> it can discover these kinds of bugs automatically.
> 
> I don't know how software_node_get_next_child() can work when it doesn't
> call kobject_get().  This sort of bug would have been caught in testing
> because it affects the success path so I must be reading the code wrong.
> 

I had the same reading of the code and thought that I was missing 
something somewhere.

There is the same question about 'acpi_get_next_subnode' which is also a 
'.get_next_child_node' function, without any ref counting, if I'm correct.

CJ
