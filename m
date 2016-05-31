From: David Miller <davem@davemloft.net>
Date: Tue, 31 May 2016 18:53:12 +0000
Subject: Re: [patch] atm: firestream: add more reserved strings
Message-Id: <20160531.115312.2224370646479410237.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160527103350.GA3255@mwanda>
In-Reply-To: <20160527103350.GA3255@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: 3chas3@gmail.com, patrick@bitwizard.nl, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 27 May 2016 13:33:50 +0300

> This bug was there when the driver was first added in back in year 2000.
> It causes a Smatch warning:
> 
>     drivers/atm/firestream.c:849 process_incoming()
>     error: buffer overflow 'res_strings' 60 <= 63
> 
> There are supposed to be 64 entries in this array and the missing
> strings are clearly in the 30 40 range.  I added them as reserved 37 to
> reserved 40.  It's possible that strings are really supposed to be added
> in the middle instead of at the end, but this approach is safe, in that
> it fixes the bug and doesn't break anything that wasn't already broken.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
