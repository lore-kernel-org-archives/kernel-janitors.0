From: Dominik Brodowski <linux@dominikbrodowski.net>
Date: Sun, 29 Aug 2010 19:15:49 +0000
Subject: Re: [patch] mtd/pcmciamtd: remove dead code
Message-Id: <20100829191549.GA753@isilmar-3.linta.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100824115627.GD29330@bicker>
In-Reply-To: <20100824115627.GD29330@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, kernel-janitors@vger.kernel.org, Magnus Damm <damm@opensource.se>, Alexander Kurz <linux@kbdbabel.org>, linux-mtd@lists.infradead.org, Karsten Keil <keil@b1-systems.de>

On Tue, Aug 24, 2010 at 01:56:27PM +0200, Dan Carpenter wrote:
> This code isn't reachable.  I looked through the git history and it
> hasn't been reachable for years.  Someone removed the label to silence
> gcc's unused label warning but these few lines accidentally got left
> behind.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
Acked-by: Dominik Brodowski <linux@dominikbrodowski.net>

Thanks,
	Dominik
