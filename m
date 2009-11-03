From: Jeff Garzik <jgarzik@pobox.com>
Date: Tue, 03 Nov 2009 21:17:53 +0000
Subject: Re: [PATCH 10/14] drivers/ata/libata: Move dereference after NULL
Message-Id: <4AF09E01.1060205@pobox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0910170841270.9213@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0910170841270.9213@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 10/17/2009 02:41 AM, Julia Lawall wrote:
> From: Julia Lawall<julia@diku.dk>
>
> In each case, if the NULL test on qc is needed, then the derefernce
> should be after the NULL test.
>
> A simplified version of the semantic match that detects this problem is as
> follows (http://coccinelle.lip6.fr/):
>
> //<smpl>
> @match exists@
> expression x, E;
> identifier fld;
> @@
>
> * x->fld
>    ... when != \(x = E\|&x\)
> * x = NULL
> //</smpl>
>
> Signed-off-by: Julia Lawall<julia@diku.dk>

applied


