From: Greg KH <gregkh@linuxfoundation.org>
Date: Mon, 14 Apr 2014 18:46:18 +0000
Subject: Re: Help required for Compiling a staging driver
Message-Id: <20140414184618.GA13336@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Apr 15, 2014 at 12:08:18AM +0530, Kumar Gaurav wrote:
> Hi All,
> 
> I'm trying to upgrade a driver using semaphore to use mutex. I have 
> applied the required changes. Now i want to compile it to ensure that i 
> didn't broke the kernel.
> 
> Driver Path:drivers/staging/dgap/
> I Marked this driver to load as loadable module
> 
>      kumar@anandlinux:/usr/linux-git$ grep CONFIG_DGAP .config
>      CONFIG_DGAP=m
> 
> Now I'm trying to compile it using below command and getting result as given
>      kumar@anandlinux:/usr/linux-git$ sudo make M=drivers/staging/dgap/
>        Building modules, stage 2.
>        MODPOST 0 modules

Never build kernel code as root.  We used to have a bug in the build
system that if you did this, it would delete your whole filesystem.
Some of us argued that we should leave it there just to keep people from
ever doing this again :)

> So, No module is getting build and again i'm not getting any Error as 
> well. Please tell me where i'm doing wrong.

Have you built this kernel source tree before?  Do a full build first,
before trying to just build one directory.  That should resolve the
issue.

And again, not as root please.

greg k-h
