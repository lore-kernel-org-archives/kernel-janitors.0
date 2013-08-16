From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Fri, 16 Aug 2013 14:51:50 +0000
Subject: Re: [PATCH 4/29] mtd: simplify use of devm_ioremap_resource
Message-Id: <1376664710.2089.382.camel@sauron.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376471493-22215-1-git-send-email-Julia.Lawall@lip6.fr>
 <1376471493-22215-5-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376471493-22215-5-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org

On Wed, 2013-08-14 at 11:11 +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Remove unneeded error handling on the result of a call to
> platform_get_resource when the value is passed to devm_ioremap_resource.
> 
> Move the call to platform_get_resource adjacent to the call to
> devm_ioremap_resource to make the connection between them more clear.

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy

