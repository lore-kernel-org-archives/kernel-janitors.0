From: Greg KH <gregkh@linuxfoundation.org>
Date: Fri, 28 Feb 2014 22:24:03 +0000
Subject: Re: [PATCH] staging: sb105x: b_pci_mp.c: fix for non-member access
Message-Id: <20140228222403.GA8543@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1393554063-25823-1-git-send-email-gmate.amit@gmail.com>
 <20140228222040.GA27989@kroah.com>
In-Reply-To: <20140228222040.GA27989@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Kumar Amit Mehta <gmate.amit@gmail.com>
Cc: devel@driverdev.osuosl.org, lisa@xenapiadmin.com, lidza.louina@gmail.com, kernel-janitors@vger.kernel.org, josh@joshtriplett.org, linux-kernel@vger.kernel.org, rashika.kheria@gmail.com, dan.carpenter@oracle.com

On Fri, Feb 28, 2014 at 02:20:40PM -0800, Greg KH wrote:
> On Fri, Feb 28, 2014 at 04:21:03AM +0200, Kumar Amit Mehta wrote:
> > 'struct tty_struct’ has no member named ‘low_latency’
> 
> This driver is marked BROKEN, and can't even compile, how did you test
> this patch?

Don't worry about it anymore, I've now deleted the driver entirely, as
no one has cared about it in the past year that it has been disabled
from the kernel build.

thanks,

greg k-h
