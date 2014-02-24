From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 24 Feb 2014 21:11:51 +0000
Subject: Re: [PATCH] Replace min macro with min_t
Message-Id: <20140224211151.GJ26722@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <530bb134.84ce0e0a.2d96.2b6b@mx.google.com>
In-Reply-To: <530bb134.84ce0e0a.2d96.2b6b@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

It's sort of a lot of work to review all 79 changes...  Your patch is
correct, but I think you are going to get mixed reactions from
maintainers.  A lot of them don't like to review cleanups like this.

I guess my advice would be to split it up and send it to the friendliest
maintainers first and see how they respond then slowly feed it to the
other maintainers.  When you get to the unfriendliest maintainers you
can handle then stop.  :P

Staging is the friendliest subsystem, but none of these patches touch
staging.  Maybe wireless and usb.

regards,
dan carpenter

