From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Wed, 14 Nov 2007 09:21:51 +0000
Subject: Re: [PATCH 1/4] drivers/i2c: Drop redundant includes of
Message-Id: <alpine.LFD.0.9999.0711140416160.4673@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0711132231080.18337@ask.diku.dk> <alpine.LFD.0.9999.0711131632490.26111@localhost.localdomain> <Pine.LNX.4.64.0711140707120.25487@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0711140707120.25487@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: khali@linux-fr.org, i2c@lm-sensors.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 14 Nov 2007, Julia Lawall wrote:

> > > From: Julia Lawall <julia@diku.dk>
> > >
> > > Drop #include <linux/moduleparam.h> in files that also include #include
> > > <linux/module.h>.  module.h includes moduleparam.h already.
> >
> > i'm not convinced that's a good idea.  while module.h does
> > currently (and unfortunately) include moduleparam.h, there may
> > come a day when those header files are refactored to actually make
> > sense, at which point all those missing moduleparam.h inclusions
> > will cause all sorts of bad things to happen.
>
> They were removed from the drivers/media files in August:
> 9c12224a607a4b22ab86784e3394b52810b9507c
> Perhaps they should be put back there then?

i went down this road before a few months back, checking on how many
source files were unnecessarily including moduleparam.h, and the
result was literally *hundreds*.  i took a shot at cleaning that up,
and even factoring the non-parameter-related content out of that file,
but the change would have been hugely disruptive.

as it is now, since module.h includes moduleparam.h, there is (as you
can see) no reason whatever for *anyone* to include moduleparam.h.
at least right now.

but if anyone ever aspires to tidy up this chaos, then all you'd end
up doing is putting all those includes back in.  so unless there's a
long-term goal here, it would seem safest to just leave things the way
they are.  but that's someone else's decision, not mine.  i'm just
reporting on how quickly things got unpleasant when *i* tried to do
something with this once upon a time.

rday
--

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
