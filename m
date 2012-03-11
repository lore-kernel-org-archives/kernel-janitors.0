From: Sergei Shtylyov <sshtylyov@mvista.com>
Date: Sun, 11 Mar 2012 10:04:51 +0000
Subject: Re: [PATCH] drivers/ata/pata_mpc52xx.c: add missing kfree
Message-Id: <4F5C78C3.1070208@mvista.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331402199-8000-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1331402199-8000-1-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-ide-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jeff Garzik <jgarzik-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>

Hello.

On 10-03-2012 21:56, Julia Lawall wrote:

> From: Julia Lawall<Julia.Lawall@lip6.fr>

> There is no need to call the devm cleanup functions on failure of a probe
> or remove function.

    This doesn't correlate with the subject.

> Signed-off-by: Julia Lawall<Julia.Lawall@lip6.fr>

WBR, Sergei
