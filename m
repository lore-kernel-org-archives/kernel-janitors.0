From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 30 May 2007 09:20:10 +0000
Subject: [KJ] Re: [PATCH] BLUETOOTH: Remove the redundant non-seekable llseek
Message-Id: <Pine.LNX.4.64.0705300515140.10188@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1180509984.21432.155.camel@aeonflux.holtmann.net>
In-Reply-To: <1180509984.21432.155.camel@aeonflux.holtmann.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 30 May 2007, Marcel Holtmann wrote:

> Hi Robert,
>
> > Remove the llseek method given that the open method already calls
> > nonseekable_open().
> >
> > Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>
> >
> > ---
> >
> > given that the fops open() method already calls nonseekable_open()
> > at the end, it would seem that this old-style method for
> > preventing lseeking is redundant.  am i reading that correctly?
>
> I wasn't aware of that fact, but after reading through the VFS code
> I agree that your patch is perfectly fine. Other drivers are using
> no_llseek in some cases, but even that is not needed at all. So full
> ACK from my side.

i've already submitted a few other patches to remove the no_llseek()
from other drivers if they don't need it, so don't think i'm just
picking on *you*, marcel. :-)

rday

p.s.  i really *hate* the fact that that routine is called
"nonseekable_open" since it gives the impression that it's somehow a
full replacement for a "regular" open, when its entire implementation
consists of:

int nonseekable_open(struct inode *inode, struct file *filp)
{
        filp->f_mode &= ~(FMODE_LSEEK | FMODE_PREAD | FMODE_PWRITE);
        return 0;
}

really, it should have been called something like "set_nonseekable" or
"make_me_nonseekable" or something similar.  oh, well ...

rday
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
