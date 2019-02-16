From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 16 Feb 2019 08:09:55 +0000
Subject: Re: [v5] coccinelle: semantic code search for missingput_device()
Message-Id: <10281c5d-8b32-0a02-17ae-20bf86f8dc65@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201902161504357846572@zte.com.cn>
In-Reply-To: <201902161504357846572@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wen Yang <wen.yang99@zte.com.cn>
Cc: Yi Wang <wang.yi59@zte.com.cn>, kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Cheng Shengyu <cheng.shengyu@zte.com.cn>, cocci@systeme.lip6.fr

> Thanks, We will change it to something like this:
> In a function, for a local variable obtained by of_find_device_by_node()

How do you think about another wording approach?

1. Precondition:
   It will be checked where the return value is stored from
   a call of the function “of_find_device_by_node”.

2. The source code search will be continued with …


> Thank you, but a local variable is necessary.

Would you like to take additional storage possibilities for a safer
analysis approach into account?

Is the restriction “local” really sufficient when such a pointer
could be copied to other variables?


>> Can it happen that on other function will perform the desired reference release?
>
> Thanks.
> Because the information of this local variable is not passed to the external function,
> this situation does not exist.

Will copied pointers matter here?


> But it's over 80 characters.

Long string literals can be accepted because of error message search concerns
around a tool like “grep”.


>> Will any more advanced error diagnostics be eventually developed?
>
> Hello, we are just doing the practical work in this field.

Are you aware of additional software design options from computer science
and existing analysis tools?


> We also hope that it can support cross-function/cross-file/data stream analysis
> and other functions.

This functionality will need further clarification.


> We are also analyzing the principle and code implementation of coccinelle,
> hoping to contribute a little.

I am curious on how this situation will evolve further.

Regards,
Markus
