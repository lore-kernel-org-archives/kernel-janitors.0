From: Matthew Wilcox <willy@debian.org>
Date: Fri, 27 Feb 2004 15:17:35 +0000
Subject: Re: [Kernel-janitors] serial.c cli() patch
Message-Id: <20040227151735.GK25779@parcelfarce.linux.theplanet.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <403D1CC3.6080906@chello.nl>
In-Reply-To: <403D1CC3.6080906@chello.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Feb 26, 2004 at 12:44:10AM +0100, Debian User wrote:
> Matthew Wilcox wrote:
> >On Wed, Feb 25, 2004 at 11:08:03PM +0100, Debian User wrote:
> >
> >>I tried to remove the cli() calls from serial.c. I just used a global 
> >>spin_lock_t serial_lock, to replace the cli() calls with 
> >>spin_lock_irqsave().
> >
> >
> >Why?  Do you have an SMP CRIS system?
> >
> Um no I don't. I don't know the architecture but it looked like a good 
> file to start on some newbie work.
> But since you ask me this I can assume that there is no SMP CRIS system? :)
> If so I gues I can throw away the patch.

Yeah, CRIS is an embedded CPU, so the danger of it becoming SMP is
pretty small.  In general, if you want to work on a serial driver, the
first thing to do is convert it to the new serial core in drivers/serial.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
