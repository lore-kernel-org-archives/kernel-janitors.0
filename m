From: Stephen Warren <swarren@wwwdotorg.org>
Date: Thu, 15 Aug 2013 22:07:49 +0000
Subject: Re: [PATCH 6/29] tegra: simplify use of devm_ioremap_resource
Message-Id: <520D5135.7020503@wwwdotorg.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376471493-22215-1-git-send-email-Julia.Lawall@lip6.fr> <1376471493-22215-7-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376471493-22215-7-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 08/14/2013 03:11 AM, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Remove unneeded error handling on the result of a call to
> platform_get_resource when the value is passed to devm_ioremap_resource.

I have applied this to Tegra's for-3.12/cleanup branch.
