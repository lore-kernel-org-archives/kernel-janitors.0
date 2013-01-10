From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 10 Jan 2013 18:58:29 +0000
Subject: Re: Q: generic module{init,exit} boilerplate
Message-Id: <alpine.DEB.2.02.1301101955430.1955@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ADE657CA350FB648AAC2C43247A983F00207A6CBA7AB@AUSP01VMBX24.collaborationhost.net>
In-Reply-To: <ADE657CA350FB648AAC2C43247A983F00207A6CBA7AB@AUSP01VMBX24.collaborationhost.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 10 Jan 2013, Dan Carpenter wrote:

> On Thu, Jan 10, 2013 at 11:12:43AM -0600, H Hartley Sweeten wrote:
> > Hello all,
> >
> > There are a number of drivers/modules in the kernel that have
> > a "do nothing" module init/exit of the form:
> >
>
> Do you have a real life example?  Why would people do that?

I find 39 occurrences, although the first one I looked at had a big #if 0
in the module_init function.  Here are some examples:

drivers/media/common/saa7146/saa7146_fops.c
drivers/media/platform/soc_camera/soc_mediabus.c
drivers/tty/serial/suncore.c

There are also a bunch of comedi drivers.  Around half of the examples are
sound drivers, eg:

sound/synth/emux/emux.c
sound/synth/util_mem.c
sound/isa/sb/sb16_csp.c

julia
