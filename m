From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Mon, 31 May 2010 11:23:31 +0000
Subject: Re: [PATCH 2/11] drivers/watchdog: Eliminate a NULL pointer
Message-Id: <20100531112330.GI3489@rakim.wolfsonmicro.main>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005271432100.5422@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005271432100.5422@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Wim Van Sebroeck <wim@iguana.be>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, May 27, 2010 at 02:32:24PM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> At the point of the call to dev_err, wm8350 is NULL.

Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
