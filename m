From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Mon, 30 Aug 2010 13:13:40 +0000
Subject: Re: [PATCH 3/7] drivers/mtd/nand/mpc5121_nfc.c: Add of_node_put to
Message-Id: <1283174020.12995.77.camel@brekeke>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283075566-27441-1-git-send-email-julia@diku.dk>
	 <1283075566-27441-4-git-send-email-julia@diku.dk>
In-Reply-To: <1283075566-27441-4-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia@diku.dk>
Cc: David Woodhouse <dwmw2@infradead.org>, kernel-janitors@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org

On Sun, 2010-08-29 at 11:52 +0200, Julia Lawall wrote:
> Add a call to of_node_put in the error handling code following a call to
> of_find_compatible_node.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)

Pushed to l2-mtd-2.6.git / master, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)

