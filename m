From: Kay Sievers <kay@vrfy.org>
Date: Tue, 03 Jul 2012 11:21:01 +0000
Subject: Re: [patch] printk: remove some dead code
Message-Id: <CAPXgP10e5cuNnOqGgBtZQq-6sZ2bpjySbd7thZyLNdij77oaHg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120703104511.GA29501@elgon.mountain>
In-Reply-To: <20120703104511.GA29501@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@elte.hu>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jul 3, 2012 at 12:45 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> Static checkers complain about the impossible condition here.
>
> In 084681d14e ('printk: flush continuation lines immediately to
> console'), we changed msg->level from being a u16 to being an unsigned
> 3 bit bitfield.  That means we can remove the code here to handle log
> levels which are in the tens or hundreds column.

We should do that for the facility value, now that level is split up
in separate fields. I'll prepare a fix.

Thanks,
Kay
