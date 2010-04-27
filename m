From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Tue, 27 Apr 2010 07:19:36 +0000
Subject: Re: [PATCH 2/3] drivers/mtd/maps: Eliminate use after free
Message-Id: <1272352776.26036.0.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1004021447160.17695@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1004021447160.17695@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org

On Fri, 2010-04-02 at 14:47 +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Moved the debugging message before the call to map_destroy, which frees its
> argument.  The message is also slightly changed to reflect its new
> position.
> 
> A simplified version of the semantic patch that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

