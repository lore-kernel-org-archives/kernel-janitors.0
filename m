From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Aug 2014 10:21:34 +0000
Subject: Re: [patch] partitions: aix.c: off by one bug
Message-Id: <20140805102134.GS4804@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140805080959.GA13605@mwanda>
 <20140805101010.GA24281@frolo.macqel>
In-Reply-To: <20140805101010.GA24281@frolo.macqel>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philippe De Muyter <phdm@macqel.be>
Cc: Jens Axboe <axboe@kernel.dk>, Fabian Frederick <fabf@skynet.be>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Aug 05, 2014 at 12:10:11PM +0200, Philippe De Muyter wrote:
> Did you encounter the bug in real life, or only by code review ?
> 
> If this has a real risk to happen, a pr_warn would be welcome.

Static analysis.

regards,
dan carpenter

