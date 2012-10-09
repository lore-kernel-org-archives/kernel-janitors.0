From: John Stultz <johnstul@us.ibm.com>
Date: Tue, 09 Oct 2012 19:14:03 +0000
Subject: Re: [patch] time: cast ->raw_interval to u64 to avoid shift overflow
Message-Id: <5074777B.9070907@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121009071823.GA19159@elgon.mountain>
In-Reply-To: <20121009071823.GA19159@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 10/09/2012 12:18 AM, Dan Carpenter wrote:
> We fixed a bunch of integer overflows in timekeeping code during the 3.6
> cycle.  I did an audit based on that and found this potential overflow.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Yep. Looks like this would trigger if you had NOZ idle for more then 4 
seconds.

Thanks for the audit, and sending this in!

Thomas: Mind queuing this?  Probably should be marked for stable too.

Acked-by: John Stultz <johnstul@us.ibm.com>


