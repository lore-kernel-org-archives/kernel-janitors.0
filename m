From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 28 May 2016 09:15:59 +0000
Subject: Re: [PATCH] Revert "i2c: dev: switch from register_chrdev to cdev API"
Message-Id: <20160528091559.GR11011@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1464426467-1824-1-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1464426467-1824-1-git-send-email-wsa@the-dreams.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Erico Nunes <erico.nunes@datacom.ind.br>, kernel-janitors@vger.kernel.org, LKP <lkp@01.org>

On Sat, May 28, 2016 at 11:07:47AM +0200, Wolfram Sang wrote:
> This reverts commit d6760b14d4a1243f918d983bba1e35c5a5cd5a6d. When
> hitting Linus' tree, buildbots ran additional checks and found boot
> problems. Although Dan Carpenter provided an obvious fix already, I
> still could not reproduce one problem manually (at least not on a
> Saturday morning). So we'll try again later after some more
> investigation.
> 

These kinds of use after frees don't always cause a runtime problem.  I
found it using static analysis, but I bet you could detect it if you
enabled kasan.  The other option is to enable PAGE_POISONING?

regards,
dan carpenter

