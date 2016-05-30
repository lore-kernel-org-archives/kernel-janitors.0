From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 30 May 2016 07:05:47 +0000
Subject: Re: [PATCH] Revert "i2c: dev: switch from register_chrdev to cdev API"
Message-Id: <20160530070547.GA18199@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1464426467-1824-1-git-send-email-wsa@the-dreams.de>
 <20160528091559.GR11011@mwanda>
 <20160528160458.GA1614@katana>
In-Reply-To: <20160528160458.GA1614@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Erico Nunes <erico.nunes@datacom.ind.br>, kernel-janitors@vger.kernel.org, LKP <lkp@01.org>

On Sat, May 28, 2016 at 06:04:58PM +0200, Wolfram Sang wrote:
> 
> > These kinds of use after frees don't always cause a runtime problem.  I
> > found it using static analysis, but I bet you could detect it if you
> > enabled kasan.  The other option is to enable PAGE_POISONING?
> 
> Thanks, PAGE_POISONING did trigger the issue. So, I now picked up your
> patch instead of the revert because I could verify the problem and the
> proper solution. Thanks again.
> 
> What I still wonder: Which analysis reported the problem to you? I
> always run sparse, smatch, cppcheck, and coccicheck on the patches when
> applying and no-one reported the issue.

It's a Smatch warning but you have to build the cross function db to
detect this.  It takes a while (a few hours) but the command is simple
enough.

	./smatch_scripts/build_kernel_data.sh

regards,
dan carpenter

