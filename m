From: Jesse Barnes <jbarnes@virtuousgeek.org>
Date: Fri, 13 Feb 2009 21:16:22 +0000
Subject: Re: [PATCH 4/6] drivers/pci: introduce missing kfree
Message-Id: <200902131316.23071.jbarnes@virtuousgeek.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0902082244490.25891@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0902082244490.25891@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sunday, February 8, 2009 1:45 pm Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
>
> Error handling code following a kmalloc should free the allocated data.
> Since the subsequent code that could provoke an error does not use the
> allocated data, the allocation is just moved below it.
>
> The semantic match that finds the problem is as follows:
> (http://www.emn.fr/x-info/coccinelle/)

Applied to my linux-next branch, thanks.
-- 
Jesse Barnes, Intel Open Source Technology Center
