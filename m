From: Javier Martinez Canillas <javier@osg.samsung.com>
Date: Mon, 12 Oct 2015 22:40:36 +0000
Subject: Re: [PATCH 3/3] ARM: EXYNOS: delete unneeded of_node_put
Message-Id: <561C36E4.3050804@osg.samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1444682596-3065-1-git-send-email-Julia.Lawall@lip6.fr>
 <1444682596-3065-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1444682596-3065-4-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Hello Julia,

On 10/12/2015 10:43 PM, Julia Lawall wrote:
> Device node iterators perform an of_node_put on each iteration, so putting
> an of_node_put before going around to the next iteration results in a
> double put.
> 
> Problem found using Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>

Krzysztof sent the same patch yesterday and was already applied:
https://lkml.org/lkml/2015/10/12/688

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
