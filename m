From: Ed Cashin <ecashin@coraid.com>
Date: Sat, 19 Dec 2009 18:22:54 +0000
Subject: Re: [PATCH 1/7] drivers/block/aoe: Use kzalloc for allocating only one thing
Message-Id: <20091219182254.GB2266@Ed-Cashins-MacBook-Pro.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0912190815550.30546@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0912190815550.30546@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Dec 19, 2009 at 08:16:13AM +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Use kzalloc rather than kcalloc(1,...)

I suppose so.  The calloc function has always been silly, but
everybody knows that, so I don't really think this patch helps
anything.  I guess somebody disagrees with me.
