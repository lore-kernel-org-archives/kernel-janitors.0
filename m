From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 30 May 2007 11:13:13 +0000
Subject: [KJ] Re: [PATCH] BLUETOOTH: Remove the redundant non-seekable llseek
Message-Id: <Pine.LNX.4.64.0705300707410.11849@localhost.localdomain>
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

> I wasn't aware of that fact, but after reading through the VFS code
> I agree that your patch is perfectly fine. Other drivers are using
> no_llseek in some cases, but even that is not needed at all. So full
> ACK from my side.

for people who want the full explanation of what's going on here, you
can read the brilliantly-named "safe seeks" article here:

  http://lwn.net/Articles/97154/

which explains how the nonseekable_open() call added to the end of
your regular device open() call prevents not just regular lseeks but
also the pread() and pwrite() calls, so some of those older tests to
avoid lseek'ing are no longer necessary, as you can see from the
trivial implementation of nonseekable_open():

int nonseekable_open(struct inode *inode, struct file *filp)
{
        filp->f_mode &= ~(FMODE_LSEEK | FMODE_PREAD | FMODE_PWRITE);
        return 0;
}

i've already done a quick scan of the tree and submitted patches to
remove code that is now superfluous given the use of
nonseekable_open().

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
