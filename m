From: Jesse Millan <jessem@cs.pdx.edu>
Date: Wed, 06 Jul 2005 18:03:02 +0000
Subject: Re: [KJ] stumped... implicitly truncated warning mystery
Message-Id: <42CC1CD6.5050905@cs.pdx.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <42CC197E.2030207@cs.pdx.edu>
In-Reply-To: <42CC197E.2030207@cs.pdx.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Dave Jones wrote:
> On Wed, Jul 06, 2005 at 10:48:46AM -0700, Jesse Millan wrote:
>  > 
>  > Hey all,
>  > 
>  > GCC4.0.0 is giving me a warning that I cant seem to get rid of. In the
>  > file drivers/net/wireless/wavelan_cs.c on lines 3607 and 3608 is the
>  > following assignment:
>  > 
>  > cfblk.ifrm_spc = 0x20;
>  > cfblk.slottim_low = 0x20;
>  > 
>  > where ifrm_spc and slottim_low are both of type unsigned char.
> 
> No, look again.  They are bitfields.
> 
>   u_char        : 4,
>      ifrm_spc   : 4;
> 
> 4 bits isn't enough space to encode 0x20 which is 0b100000
> 
>   u_char        : 5,
>      slottim_low : 3;
> 
> Likewise, 3 bits is too small.
> 
> 		Dave
> 
> 

Thank you Dave!

-- 
Jesse Millan
CNS Unix Team
Portland State University
Phone: (503) 725-9151
Mobile: (503) 453-0748
GPG key: www.system-calls.com/gpg.php

grep --recursive --ignore-case 'SHOULD WORK' /usr/src/linux/* | wc
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
