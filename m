From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 09 Apr 2013 06:22:24 +0000
Subject: Re: [patch] tty: mxser: forever loops on error
Message-Id: <20130409062224.GB9245@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130409051838.GB1516@longonot.mountain>
 <5163AC2B.7060804@ispras.ru>
In-Reply-To: <5163AC2B.7060804@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexey Khoroshilov <khoroshilov@ispras.ru>
Cc: Jiri Slaby <jirislaby@gmail.com>, kbuild@01.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Apr 09, 2013 at 09:50:35AM +0400, Alexey Khoroshilov wrote:
> Hi Dan,
> 
> Thank you for the patch.
> 
> We are also trying to fix the issue:
> https://lkml.org/lkml/2013/2/19/29
> https://lkml.org/lkml/2013/4/8/55
> 
> and the fix is finally in Greg's tty git tree since yesterday:
>     git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git
> (tty-linus branch).
> 

Good deal.

Btw, by the time that Fenguang's kbuild scripts emailed you, it was
already too late to send a v2 patch.

regards,
dan carpenter
