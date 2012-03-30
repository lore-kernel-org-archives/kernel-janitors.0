From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 30 Mar 2012 12:20:16 +0000
Subject: Re: [PATCH] Drivers: hv: Fix return type of hv_post_message().
Message-Id: <20120330122016.GG3289@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1333107513-10434-1-git-send-email-santoshprasadnayak@gmail.com>
In-Reply-To: <1333107513-10434-1-git-send-email-santoshprasadnayak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Mar 30, 2012 at 02:53:13PM +0300, Dan Carpenter wrote:
> On Fri, Mar 30, 2012 at 05:08:33PM +0530, santosh nayak wrote:
> > From: Santosh Nayak <santoshprasadnayak@gmail.com>
> > 
> > On failed memory allocation 'hv_post_message()' returns -ENOMEM.
> > As return type of this function is 'u16', -ENOMEM becomes 65524.
> > Change the return type from 'u16' to 'int'.
> > 
> > Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>
> 
> Too late.  :P  I just fixed this one two days ago...
> 

Btw, for a while a bunch of us were sending duplicate patches.  So
that's why part of the reason why we CC kernel-janitors.   Also I do
appreciate Walter's reviews as well.

regards,
dan carpenter

