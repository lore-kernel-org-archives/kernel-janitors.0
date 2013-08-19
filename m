From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Mon, 19 Aug 2013 13:38:09 +0000
Subject: Re: [PATCH 3/6] mtd: fsmc_nand: simplify platform_get_resource_byname/devm_ioremap_resource
Message-Id: <1376919489.2089.464.camel@sauron.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376902316-18520-1-git-send-email-Julia.Lawall@lip6.fr>
 <1376902316-18520-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376902316-18520-4-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org

On Mon, 2013-08-19 at 10:51 +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Remove unneeded error handling on the result of a call to
> platform_get_resource_byname when the value is passed to devm_ioremap_resource.
> 
> A simplified version of the semantic patch that makes this change is as
> follows: (http://coccinelle.lip6.fr/)

Pushed to l2-mtd.git, thanks.

-- 
Best Regards,
Artem Bityutskiy

