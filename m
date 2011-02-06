From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Sun, 06 Feb 2011 15:08:24 +0000
Subject: Re: [PATCH] drivers/mtd/maps/ts5500_flash.c: avoid calling
Message-Id: <1297004904.4460.31.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1296666816-21610-1-git-send-email-julia@diku.dk>
In-Reply-To: <1296666816-21610-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org

On Wed, 2011-02-02 at 18:13 +0100, Julia Lawall wrote:
> map_destroy dereferences its argument.  The call is furthermore only
> reachable when this argument is NULL.  Thus the call is dropped.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

