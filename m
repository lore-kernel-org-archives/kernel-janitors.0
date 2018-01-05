From: Sekhar Nori <nsekhar@ti.com>
Date: Fri, 05 Jan 2018 13:57:36 +0000
Subject: Re: [PATCH 07/12] ARM: davinci: drop unneeded newline
Message-Id: <7bad6990-b54d-2373-86b0-7926f636f51d@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1514386305-7402-1-git-send-email-Julia.Lawall@lip6.fr>
 <1514386305-7402-8-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1514386305-7402-8-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Wednesday 27 December 2017 08:21 PM, Julia Lawall wrote:
> gpio_request uses its second argument as a label, so it doesn't seem
> appropriate for it to have a newline.  Done using Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied to my v4.16/soc branch

Thanks,
Sekhar
