From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Sat, 26 Dec 2015 19:59:04 +0000
Subject: Re: [PATCH] coccinelle: api: check for propagation of error from platform_get_irq
Message-Id: <567EF188.7020203@cogentembedded.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1451157891-24881-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1451157891-24881-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

On 12/26/2015 10:24 PM, Julia Lawall wrote:

> The error return value of platform_get_irq seems to often get dropped.

    Maybe it was intentional (see my recent follow-up to your netdev patch). 
But if an error gets unconditionally overriden, deferred probing can't work. 
So your patches seem good things in the end. Thank you!

> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

[...]

MBR, Sergei

