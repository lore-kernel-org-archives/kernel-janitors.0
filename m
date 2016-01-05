From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Jan 2016 12:44:37 +0000
Subject: Re: [patch v2] usb: gadget: f_midi: missing unlock on error path
Message-Id: <20160105124437.GD23363@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160105102809.GA26420@mwanda>
In-Reply-To: <20160105102809.GA26420@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jan 05, 2016 at 01:28:11PM +0100, Julia Lawall wrote:
> 
> 
> On Tue, 5 Jan 2016, kbuild test robot wrote:
> 
> > Hi Dan,
> >
> > [auto build test WARNING on balbi-usb/next]
> > [also build test WARNING on v4.4-rc8 next-20160105]
> > [if your patch is applied to the wrong git tree, please drop us a note to help improving the system]
> >
> > url:    https://github.com/0day-ci/linux/commits/Dan-Carpenter/usb-gadget-f_midi-missing-unlock-on-error-path/20160105-183115
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git next
> >
> >
> > coccinelle warnings: (new ones prefixed by >>)
> >
> > >> drivers/usb/gadget/function/f_midi.c:1233:14-21: ERROR: midi is NULL but dereferenced.
> 
> It's a false positive for coccinelle, but I wonder if avoiding duplicating
> the mutex_lock is really worth it?

It's not the most beautiful code in the world.  I considered a bunch of
different ways to write it...  This is what Felipe Tonello wanted,
though.

regards,
dan carpenter

