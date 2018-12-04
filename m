From: Richard Cochran <richardcochran@gmail.com>
Date: Tue, 04 Dec 2018 14:55:38 +0000
Subject: Re: [PATCH v2] ptp: fix an IS_ERR() vs NULL check
Message-Id: <20181204145538.dnyqlfspnpqmojop@localhost>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>

On Tue, Dec 04, 2018 at 10:00:33AM +0300, Dan Carpenter wrote:
> 
> Why did you commit 3b1ad360acad ("pps: using ERR_PTR instead of NULL
> while pps_register_source fails")?  You're not listed as a maintainer so
> I wouldn't have known to CC you.

I'm confused.  Where is that commit?

   $ git show 3b1ad360acad
   fatal: ambiguous argument '3b1ad360acad': unknown revision or path not in the working tree.

I'm pulling from:

   torvalds git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git (fetch)
   stable   git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git (fetch)

(and also from net and net-next)

Thanks,
Richard
