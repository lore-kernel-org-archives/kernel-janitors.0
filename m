From: Johan Hovold <johan@kernel.org>
Date: Sat, 15 Oct 2016 09:15:36 +0000
Subject: Re: [patch] greybus: fix a leak on error in gb_module_create()
Message-Id: <20161015091536.GA13900@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161014191639.GB21917@mwanda>
In-Reply-To: <20161014191639.GB21917@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Oct 14, 2016 at 10:18:21PM +0300, Dan Carpenter wrote:
> We should release ->interfaces[0] as well.

Indeed. Thanks for the fix.

> Fixes: b15d97d77017 ("greybus: core: add module abstraction")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Johan Hovold <johan@kernel.org>

Johan
