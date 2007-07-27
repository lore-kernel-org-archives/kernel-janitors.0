From: Petr Stehlik <pstehlik@sophics.cz>
Date: Fri, 27 Jul 2007 10:56:38 +0000
Subject: Re: [PATCH 08/68] 0 -> NULL, for arch/m68k
Message-Id: <46A9CF66.90108@sophics.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707270944.LAA17213@ifs.emn.fr>
In-Reply-To: <200707270944.LAA17213@ifs.emn.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yoann Padioleau <padator@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, geert@linux-m68k.org, zippel@linux-m68k.org, linux-m68k@vger.kernel.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org

Yoann Padioleau wrote:
> When comparing a pointer, it's clearer to compare it to NULL than to 0.

>  	stram_start = phys_to_virt(0);
> -	kernel_in_stram = (stram_start = 0);
> +	kernel_in_stram = (stram_start = NULL);

stram_start is more like an offset than pointer, IMHO. And 0 is a valid 
offset. The "=NULL" does not make much sense in this particular case. 
NULL is usually used when checking for an uninitialized pointer, right?

Petr

