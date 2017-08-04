From: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Date: Fri, 04 Aug 2017 16:51:15 +0000
Subject: Re: [PATCH 4/4] axonram: Delete an unnecessary variable initialisation in axon_ram_probe()
Message-Id: <70701740-b1cd-d2b6-8334-6dcd727a53f3@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <009fdef0-b2c9-5e98-d32d-14149aec92c5@users.sourceforge.net>
 <d833a646-8345-4cd1-0701-4450615b7a65@users.sourceforge.net>
In-Reply-To: <d833a646-8345-4cd1-0701-4450615b7a65@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jan Kara <jack@suse.cz>, Jens Axboe <axboe@fb.com>, Dan Williams <dan.j.williams@intel.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 08/03/2017 12:17 PM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 3 Aug 2017 20:34:00 +0200
> 
> The local variable "rc" will eventually be set only to an error code.
> Thus omit the explicit initialisation at the beginning.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/powerpc/sysdev/axonram.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/powerpc/sysdev/axonram.c b/arch/powerpc/sysdev/axonram.c
> index 93cc902350db..5677f3371e30 100644
> --- a/arch/powerpc/sysdev/axonram.c
> +++ b/arch/powerpc/sysdev/axonram.c
> @@ -184,7 +184,6 @@ static int axon_ram_probe(struct platform_device *device)
>  	static int axon_ram_bank_id = -1;
>  	struct axon_ram_bank *bank;
>  	struct resource resource;
> -	int rc = 0;

You've completely removed the decleration of "rc" instead of removing the "= 0"
initialization. I would expect a compilation test to have turned up an undeclared use
error for "rc".

-Tyrel

> 
>  	axon_ram_bank_id++;
> 

