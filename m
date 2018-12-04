From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 04 Dec 2018 10:54:14 +0000
Subject: Re: [PATCH v2] ptp: fix an IS_ERR() vs NULL check
Message-Id: <20181204105414.GA23254@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181130163252.e6z33t23j3qud57z@localhost>
 <20181203105506.GA21127@unbuntlaptop>
 <20181204044257.grk3na2wyrx6nssg@localhost>
 <20181204070033.GG3073@unbuntlaptop>
In-Reply-To: <20181204070033.GG3073@unbuntlaptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>

On Tue, Dec 04, 2018 at 10:00:33AM +0300, Dan Carpenter wrote:
> Hi Greg,
> 
> I meant to CC you but I screwed up and added you to the From header
> instead... :(
> 
> Why did you commit 3b1ad360acad ("pps: using ERR_PTR instead of NULL
> while pps_register_source fails")?  You're not listed as a maintainer so
> I wouldn't have known to CC you.

The maintainer told me to do so, see this email thread:
	https://lore.kernel.org/lkml/44edc27b-e679-24e8-aef1-fe5b7570f982@enneenne.com/

> The back story is that the last chunk which changes drivers/ptp/ptp_clock.c
> was dropped by mistake and it's not there in linux-next.  I wrote a
> patch which adds it, but everyone is super confused now...  Here is
> YueHaibing's original patch btw, for reference.
> https://www.spinics.net/lists/netdev/msg535929.html

If you want me to take a fixup patch for this, I will be glad to.  I can
also drop it from my tree as well, just let me know.

Sorry for the confusion.

greg k-h
