From: Felipe W Damasio <felipewd@terra.com.br>
Date: Thu, 06 Oct 2005 18:46:07 +0000
Subject: Re: [KJ] [PATCH] cris: kgdb: remove double_this()
Message-Id: <434570EF.3060106@terra.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051005204541.GB27229@mipter.zuzino.mipt.ru>
In-Reply-To: <20051005204541.GB27229@mipter.zuzino.mipt.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

    Hi,

    Or better yet, even if it is actually necessary, why wasn't it made 
inline.

    Or even a define.

    Or...yeah, why was it made in the first place? :-)

    Cheers,

Felipe Damasio

Ricardo Nabinger Sanchez wrote:

>Quoting  Alexey Dobriyan <adobriyan@gmail.com>
>Sent on  Thu, 6 Oct 2005 00:45:41 +0400
>
>Hello,
>
>  
>
>>-int
>>-double_this(int x)
>>-{
>>-        return 2 * x;
>>-}
>>    
>>
>
>I'm wondering why this "2*x" wrapper was ever made.
>
>  
>
>------------------------------------------------------------------------
>
>_______________________________________________
>Kernel-janitors mailing list
>Kernel-janitors@lists.osdl.org
>https://lists.osdl.org/mailman/listinfo/kernel-janitors
>  
>
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
