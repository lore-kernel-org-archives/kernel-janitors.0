From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Thu, 26 May 2005 18:47:30 +0000
Subject: Re: [KJ] [PATCH 2.6.11.10] arch/cris: fixes static strings declaration
Message-Id: <200505262247.31206.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050526122502.7aa13915.rnsanchez@terra.com.br>
In-Reply-To: <20050526122502.7aa13915.rnsanchez@terra.com.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thursday 26 May 2005 22:27, walter harms wrote:

> you ask for it :)
> 
>   cris-gcc -v
> Reading specs from /usr/local/cris/lib/gcc-lib/cris/2.96/specs
> gcc version 2.96 Axis release R46/1.25

Aha!

> #include <stdio.h>
> //char *foo = "blah";
> char foo[]="blah";
> int main()
> {
> printf("%s\n",foo);
> 
> }
> 
>   size test_string  (char [])
>     text    data     bss     dec     hex filename
>      769     252      36    1057     421 test_string
> 
> 
> size test_string2  (char *)
>     text    data     bss     dec     hex filename
>      777     248      40    1065     429 test_string2
> 
> 
> sorry, i could not resist :)

Care to repeat this on arch/cris/arch-v10/drivers/axisflashmap.o ? ;-)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
