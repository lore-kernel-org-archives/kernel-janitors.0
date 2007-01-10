From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Wed, 10 Jan 2007 11:37:17 +0000
Subject: Re: [KJ] what's the deal with using real "boolean" variables?
Message-Id: <45A4CFED.8060200@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701100337460.11933@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701100337460.11933@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

walter harms wrote:
> hi,
> i took a dive into the 'c reference manual' and found that the header stdbool.h
> defines (#define) bool/true/false. It is permited to undefine and redefine these
> defines. It defines also the macro "__bool_true_false_are_defined".
> The best ways seems to emulate this way and provide a kernelbased stdbool.h if
> "__bool_true_false_are_defined" does not exist.
>   
Why "__bool_true_false_are_defined" when we _know_ it is defined? Since 
2.6.15 (I believe), only gcc >= 3.2 is supported, and from version 3, 
gcc supports _Boole.
I first thought to implement it as stdbool.h, but the consensus seems to 
be: types in linux/types.h and false/true found a home in linux/stddef.h.

/Richard Knutsson

PS
Please don't top-post. :)
DS
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
