From: Richard Cochran <richardcochran@gmail.com>
Date: Thu, 06 Dec 2018 12:38:43 +0000
Subject: Re: [PATCH v2] ptp: fix an IS_ERR() vs NULL check
Message-Id: <20181206123843.f637bvkvzibev2p5@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181130163252.e6z33t23j3qud57z@localhost>
 <20181203105506.GA21127@unbuntlaptop>
 <20181204044257.grk3na2wyrx6nssg@localhost>
 <20181204070033.GG3073@unbuntlaptop>
 <20181204145538.dnyqlfspnpqmojop@localhost>
 <20181204151049.GK3073@unbuntlaptop>
In-Reply-To: <20181204151049.GK3073@unbuntlaptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>

Greg,

On Tue, Dec 04, 2018 at 06:10:49PM +0300, Dan Carpenter wrote:
> On Tue, Dec 04, 2018 at 06:55:38AM -0800, Richard Cochran wrote:
> > On Tue, Dec 04, 2018 at 10:00:33AM +0300, Dan Carpenter wrote:
> > > 
> > > Why did you commit 3b1ad360acad ("pps: using ERR_PTR instead of NULL
> > > while pps_register_source fails")?  You're not listed as a maintainer so
> > > I wouldn't have known to CC you.
> > 
> > I'm confused.  Where is that commit?

...

> I'm on linux-next but originally it came from the char-misc-next tree.
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-next

Commit 3b1ad360acad changes a return value in the PPS core, but it is
missing the hunk for the caller in drivers/ptp/ptp_clock.c.  Can that
be amended?

Thanks,
Richard
