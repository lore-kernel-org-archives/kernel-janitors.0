From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Mon, 30 Aug 2010 13:17:35 +0000
Subject: Re: [patch] mtd/pcmciamtd: remove dead code
Message-Id: <1283174255.12995.78.camel@brekeke>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100824115627.GD29330@bicker>
In-Reply-To: <20100824115627.GD29330@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <error27@gmail.com>
Cc: Karsten Keil <keil@b1-systems.de>, kernel-janitors@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, Magnus Damm <damm@opensource.se>, Alexander Kurz <linux@kbdbabel.org>, linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>

On Tue, 2010-08-24 at 13:56 +0200, Dan Carpenter wrote:
> This code isn't reachable.  I looked through the git history and it
> hasn't been reachable for years.  Someone removed the label to silence
> gcc's unused label warning but these few lines accidentally got left
> behind.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Pushed to l2-mtd-2.6.git / master, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)

