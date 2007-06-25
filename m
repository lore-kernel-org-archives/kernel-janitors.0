From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 25 Jun 2007 12:27:42 +0000
Subject: [KJ] Re: [PATCH]is_power_of_2-ufs/super.c
Message-Id: <Pine.LNX.4.64.0706250826300.4499@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1181808559.2474.9.camel@merlin.linuxcoe.com>
 <20070625121316.GA19544@saeurebad.de>
In-Reply-To: <20070625121316.GA19544@saeurebad.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Weiner <hannes-kernel@saeurebad.de>
Cc: vignesh babu <vignesh.babu@wipro.com>, daniel.pirkl@email.cz, dushistov@mail.ru, linux-kernel <linux-kernel@vger.kernel.org>, Kernel Janitors List <kernel-janitors@lists.osdl.org>

On Mon, 25 Jun 2007, Johannes Weiner wrote:

> Hi,
>
> On Thu, Jun 14, 2007 at 01:39:18PM +0530, vignesh babu wrote:
> > Replacing (n & (n-1)) in the context of power of 2 checks
> > with is_power_of_2
>
> You might want to run
>
> 	egrep -R '([a-zA-Z0-9_.>]+) *& *\(\1 *- *1\)' /usr/src/linux
>
> This does not match if the check is broken into multiple lines,
> though. Still, 66 matches so far. Perhaps a big patch that removes
> most of these occurrences would be more appropriate.

this cleanup project is already well documented here:

http://fsdev.net/wiki/index.php?title=Power_of_2_stuff

and it's unlikely that you'd get a big patch in that tries to do all
of that at once.  it's much easier to do it a subsystem at a time.

rday

p.s.  that wiki page could probably use some updating.

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
