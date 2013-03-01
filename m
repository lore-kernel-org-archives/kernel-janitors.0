From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 01 Mar 2013 21:31:36 +0000
Subject: Re: [patch] applicom: use correct array offset
Message-Id: <201303012131.37086.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130301203146.GC22066@longonot.mountain>
In-Reply-To: <20130301203146.GC22066@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, David Woodhouse <dwmw2@infradead.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Friday 01 March 2013, Dan Carpenter wrote:
> We're iterating through abps[] printing information, but here we
> use the wrong array index.  IndexCard comes from the user and in
> this case it was specifically not range checked because we didn't
> expect to use it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

Wow, that is a crappy driver ;-) Dave Woodhouse was apparently the last
person who understood it and had something to do with it, and that was back
in the 90s. It looks like the vendor actually has its own (much worse)
driver for this product line and only supports more recent cards than
our driver does. I doubt that there is anyone using this.

Should we just kill the driver?

	Arnd
