From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Aug 2016 10:11:03 +0000
Subject: Re: [patch] tty: amiserial.c: remove a double irq restore
Message-Id: <20160804101102.GA4134@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160804053403.GL775@mwanda>
 <41427059-b5e4-1b30-e577-5a1cf3f81b29@suse.cz>
In-Reply-To: <41427059-b5e4-1b30-e577-5a1cf3f81b29@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Slaby <jslaby@suse.cz>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Oh...  Wow.  I'm really sorry about that.  Thanks for catching the
mistake.

It should as well have been caught by static analysis but it wasn't.
I will work on this so it doesn't happen again.  And I will try to be
more careful as well.

regards,
dan carpenter
