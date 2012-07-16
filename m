From: Stefan Roese <sr@denx.de>
Date: Mon, 16 Jul 2012 09:38:19 +0000
Subject: Re: [PATCH] drivers/mtd/devices/spear_smi.c: failure test for null rather than negative integer
Message-Id: <201207161138.19985.sr@denx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1341997118-25042-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1341997118-25042-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org

On Wednesday 11 July 2012 10:58:38 Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> dev_get_platdata returns a pointer, so the failure value would be NULL
> rather than a negative integer.
> 
> The semantic match that finds this problem is: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression x,e;
> statement S1,S2;
> @@
> 
> *x = dev_get_platdata(...)
> ... when != x = e
> *if (x < 0) S1 else S2
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Stefan Roese <sr@denx.de>
 
Thanks,
Stefan
