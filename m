From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Wed, 06 Jul 2005 18:24:36 +0000
Subject: Re: [KJ] stumped... implicitly truncated warning mystery
Message-Id: <200507062224.36796.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <42CC197E.2030207@cs.pdx.edu>
In-Reply-To: <42CC197E.2030207@cs.pdx.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wednesday 06 July 2005 21:48, Jesse Millan wrote:
> GCC4.0.0 is giving me a warning that I cant seem to get rid of. In the
> file drivers/net/wireless/wavelan_cs.c on lines 3607 and 3608 is the
> following assignment:
> 
> cfblk.ifrm_spc = 0x20;
> cfblk.slottim_low = 0x20;
> 
> where ifrm_spc and slottim_low are both of type unsigned char.

They are bitfields.

drivers/net/wireless/i82593.h:

168	  u_char            : 4,
169	         ifrm_spc   : 4;
170	  u_char            : 5,
171	         slottim_low : 3;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
