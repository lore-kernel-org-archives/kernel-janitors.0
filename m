From: Jeff Garzik <jgarzik@pobox.com>
Date: Sat, 11 Feb 2006 22:54:52 +0000
Subject: Re: [KJ] Fwd: libata janitor project
Message-Id: <43EE6B3C.7050107@pobox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060210132138.GA11586@mipter.zuzino.mipt.ru>
In-Reply-To: <20060210132138.GA11586@mipter.zuzino.mipt.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Eric Sesterhenn wrote:
> hi,
> 
> 
>>Long term, we should work to replace the assert() in libata with 
>>standard kernel WARN_ON().
>>
>>If someone wanted to handle that conversion, that would be useful.  Make 
>>sure to pay attention, the sense of each test must be reversed.
> 
> 
> Guess after doing all this BUG() stuff its my fate to tackle this :)
> This patchs cleans all users of assert() which include libata.h. I hope i
> got the negation right every time.
> 
> Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

thanks, we had several submissions of this, I appreciate all of them!

	Jeff



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
