From: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Date: Wed, 17 Jan 2018 18:03:41 +0000
Subject: Re: [PATCH] memory-EMIF: Use seq_putc() in emif_regdump_show()
Message-Id: <0ca52803-4ca8-c9e9-05bb-a142dc5ba24f@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1762e245-a88d-f82e-57e8-a4dab179ca03@users.sourceforge.net>
In-Reply-To: <1762e245-a88d-f82e-57e8-a4dab179ca03@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, kernel-janitors@vger.kernel.org, Santosh Shilimkar <ssantosh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>

On 1/13/2018 1:34 AM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 13 Jan 2018 10:24:03 +0100
> 
> A single character (line break) should be put into a sequence.
> Thus use the corresponding function "seq_putc".
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
Looks fine. Will pick it up for next merge window.

Regards,
Santosh
