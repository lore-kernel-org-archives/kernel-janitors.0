From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Sat, 19 Oct 2013 11:03:46 +0000
Subject: Re: [patch] firewire: info leak in ioctl_get_info()
Message-Id: <20131019130346.5f8ad3a5@stein>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131019091020.GE9312@longonot.mountain>
In-Reply-To: <20131019091020.GE9312@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Oct 19 Clemens Ladisch wrote:
> Dan Carpenter wrote:
> > There is a 4 byte hole in the bus_reset struct at the end of the struct
> > after ->generation.
> 
> queue_bus_reset_event() uses kzalloc(), and ioctl_get_info() does not copy
> the hole.

Yep.  In other words, the ioctl_get_info() information leak has been
fixed by commit 790198f74c9d "firewire: cdev: fix user memory corruption
(i386 userland on amd64 kernel)".  Its subject doesn't say so, but the
changelog does.
-- 
Stefan Richter
-===-==-= =-=- =--=
http://arcgraph.de/sr/
