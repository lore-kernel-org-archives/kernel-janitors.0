From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Fri, 23 Feb 2007 18:15:51 +0000
Subject: Re: [KJ] [RFC][PATCH] BIT macro cleanup
Message-Id: <45DF2F57.2080309@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3b44d3fb0702222056k1d2a9b57q69a3555a09a9058e@mail.gmail.com>	 <3b44d3fb0702230014x4ee4a1dewdc624c54b3635e15@mail.gmail.com>	 <45DEAC45.7090105@student.ltu.se>	 <3b44d3fb0702230215o2fbd5a3y25729e481a447149@mail.gmail.com>	 <45DEF5EE.4030002@student.ltu.se>	 <d120d5000702230657s1860efb3o6986277901f13d03@mail.gmail.com>	 <45DF1165.2080003@student.ltu.se> <d120d5000702230905r6b50a1bbm3b71551f855cdf01@mail.gmail.com>
In-Reply-To: <d120d5000702230905r6b50a1bbm3b71551f855cdf01@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Milind Choudhary <milindchoudhary@gmail.com>, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, linux-input@atrey.karlin.mff.cuni.cz, linux-joystick@atrey.karlin.mff.cuni.cz

Dmitry Torokhov wrote:
> I was not talking about name (I hate BITWRAP) but behavior.
Oh, my bad :)
>
>> but mainly since it only enables wrapping of the long-type.
>
> I'd provde BIT and separate LLBIT for ones who really need long long.
> People who intereseted in smaller than BITS_PER_LONG bitmaps shoud use
> your proposal - BIT(x % DESIRED_WITH) and BIT should do modulo
> BITS_PER_LONG internally.
I agree that _if_ there is a "BITWRAP" then it should be long, but I 
don't see the reason for it to be in bitops.h when it is only input.h 
that uses it. + I find it different with BIT since it works as well with 
'char' as 'long'.
Also, I think it would be best if the name indicated it is a 'long'.

Am a little bit curious why you would like it in bitops.h, but won't 
complain if you do (think you have noticed my view of it ;))

Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
