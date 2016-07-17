From: Brian Norris <computersforpeace@gmail.com>
Date: Sun, 17 Jul 2016 03:54:04 +0000
Subject: Re: [patch] mtd: maps: sa1100-flash: potential NULL dereference
Message-Id: <20160717035404.GA14744@brian-ubuntu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160715110629.GB9258@mwanda> <20160716003209.GC76613@google.com>
 <20160716090041.GC32247@mwanda>
In-Reply-To: <20160716090041.GC32247@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Frans Klaver <fransklaver@gmail.com>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Jul 16, 2016 at 12:00:41PM +0300, Dan Carpenter wrote:
> I like the Fixes tag because it was my invention.  :)  It's a separate
> thing from -stable.

Ha, nice. Well I have nothing against the tag, and nothing against this
patch. It's good to know that the Fixes tag is not (necessarily) a
request-for-stable tag.

> It's nice for reviewing so you can see the original intent of the patch
> you're fixing.  Also it forces you to find the original authors and CC
> them so hopefully they Ack the patch.  The other thing is it lets you
> collect data about which patches introduce bugs and how quickly they
> get fixed.  So for example, lwn.net recently had an article about bug
> that are backported into the -stable tree.

All good things. I know personally it's helpful when tracking down bugs,
or backporting drivers or features.

Regards,
Brian
