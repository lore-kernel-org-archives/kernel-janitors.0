From: Duncan Palmer <dunk_palmer@yahoo.com>
Date: Sun, 13 Feb 2005 23:46:06 +0000
Subject: [KJ] Re: [PATCH] Add module autoloading support to input layer
Message-Id: <20050213234606.37561.qmail@web60604.mail.yahoo.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============13729855223169585=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050211074026.GA1675@ucw.cz>
In-Reply-To: <20050211074026.GA1675@ucw.cz>
To: kernel-janitors@vger.kernel.org

--===============13729855223169585==
Content-Type: text/plain; charset=us-ascii


--- Vojtech Pavlik <vojtech@suse.cz> wrote:

> On Fri, Feb 11, 2005 at 09:19:49AM -0800, Stephen
> Hemminger wrote:
>
> > There are two parts here: one is adding the
> aliases and the other
> > is the auto loading. The aliases are a good idea
> even without the auto loading
> > because it separates the definition from the
> implementation and simplifies
> > the hotplug handling.
> 
> However, hotplug doesn't load the handler modules by
> module name or
> module handler device node number. It loads based on
> module table
> bitmaps that either do or don't match a specific
> input device.
> 

Sorry, my mistake. I'd somehow convinced myself that
the bitmap was used for mapping which event handlers
handled events from which input device drivers
(correct), and for telling hotplug which input device
drivers, as opposed to event handlers, to load (not
correct). Not sure how I managed that...

It may be useful to have aliases for the input device
drivers as they currently have none, and some at least
rely on aliases defined under /etc/modprobe.d/ for
module loading. However, I imagine loading of input
event drivers is handled in different ways depending
on whether or not they can be detected and what
susbsystem does the detecting (for example hotplug
figures out it needs to load psmouse by looking at
entries under /sys/bus/pnp/devices/). So, this makes
it a bit difficult to define alias names that are
useful...

Dunk






	
		
__________________________________ 
Do you Yahoo!? 
Yahoo! Mail - You care about security. So do we. 
http://promotions.yahoo.com/new_mail

--===============13729855223169585==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============13729855223169585==--
