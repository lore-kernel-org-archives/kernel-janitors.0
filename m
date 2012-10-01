From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 01 Oct 2012 20:51:56 +0000
Subject: Re: How to automatically get subsystem name for a file?
Message-Id: <20121001205156.GQ4587@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CA+MoWDrjiGQtBdr_n5TEwDJDv4pDyitKqHmruCy7-ur0GwKp0w@mail.gmail.com>
In-Reply-To: <CA+MoWDrjiGQtBdr_n5TEwDJDv4pDyitKqHmruCy7-ur0GwKp0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Oct 01, 2012 at 04:49:13PM -0300, Ezequiel Garcia wrote:
> On Mon, Oct 1, 2012 at 3:49 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > On Mon, Oct 01, 2012 at 06:57:44PM +0200, Peter Senna Tschudin wrote:
> >> I'm trying to figure it out how to automatically get the correct
> >> subsystem string for putting on the first line of the commit message /
> >> subject of the patch message. For example:
> >>
> >> Subject: [PATCH 001/142] arch/x86: Replace memcpy with struct assignment
> >>                                        ^^^^^^^^^^
> >> arch/x86 is only the first two levels of directories from Kernel
> >> source. This may not be smart enough...
> >>
> >
> > You have to do it manually.  Here are the relevant lines from my
> > patch script.
> >
> 
> Manually? Sure there must be some way of auto do it.

There really isn't an automatic way.  For example [media] and [SCSI]
are non-standard.

I look at it as a good thing that people have to do it manually.  It
hopefully makes them slow down a bit.

regards,
dan carpenter

