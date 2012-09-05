From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Wed, 05 Sep 2012 23:43:41 +0000
Subject: Re: [PATCH 1/4] drivers/spi/spi-sh-hspi.c: drop frees of devm_ alloc'd data
Message-Id: <20120905234340.GH10580@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1346517191-8794-1-git-send-email-Julia.Lawall@lip6.fr>
	<1346517191-8794-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1346517191-8794-2-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Cc: spi-devel-general-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Sat, Sep 01, 2012 at 06:33:08PM +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> devm free functions should not have to be explicitly used.

Applied, thanks.
