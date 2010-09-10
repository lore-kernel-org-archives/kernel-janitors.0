From: Greg KH <greg@kroah.com>
Date: Fri, 10 Sep 2010 17:09:13 +0000
Subject: Re: Opinion about Linux Foundation courses
Message-Id: <20100910170913.GC6193@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTikugt28Lsf9wgCyOD=t4SK4pMyCNxCU5Yahs_nz@mail.gmail.com>
In-Reply-To: <AANLkTikugt28Lsf9wgCyOD=t4SK4pMyCNxCU5Yahs_nz@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Sep 10, 2010 at 03:31:14PM +0530, Rahul Ruikar wrote:
> Thanks Greg,
> I have query related to which git tree to take as reference for bug
> fix / code review . .etc

It depends on the subsystem you are concerned about.

>  I am aware of this one
> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb-2.6.git

That is for no one to use, didn't you notice the description of it:
	"Junk tree, do not use".

I use that ONLY to send patches to Linus, so consider it a private tree
for just me to use occasionally in this manner.

>  I mean developers who post their patches in "linux-usb" mailing
> list.. Do they always refer to above git tree. ?

No.

See the MAINTAINERS file for the locations of the developer trees for
the different subsystems, they are all specified there.

If you want to see all of the developer trees together, use the
linux-next tree, that is what it is there for.

If you want to report bugs, they can be reported against any tree you
find :)

But most importantly, test Linus's tree, that is where we care about
bugs the most.

Hope this helps,

greg k-h
