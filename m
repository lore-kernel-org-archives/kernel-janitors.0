From: Cyrill Gorcunov <gorcunov@gmail.com>
Date: Fri, 01 Aug 2014 08:32:22 +0000
Subject: Re: [patch] timerfd: remove an always true check
Message-Id: <20140801083222.GF17343@moon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140801082848.GF28869@mwanda>
In-Reply-To: <20140801082848.GF28869@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Aug 01, 2014 at 11:28:48AM +0300, Dan Carpenter wrote:
> We would have returned -EINVAL earlier if ticks wasn't set.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Cyrill Gorcunov <gorcunov@openvz.org>

Yeah, thanks a lot, Dan!
