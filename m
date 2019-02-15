From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 15 Feb 2019 07:50:27 +0000
Subject: Re: [v4] coccinelle: semantic patch for missing put_device()
Message-Id: <f4bc7f71-efee-5e0f-3209-82681ddc85be@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201902151452197117145@zte.com.cn>
 <alpine.DEB.2.21.1902150754380.2896@hadrien>
In-Reply-To: <alpine.DEB.2.21.1902150754380.2896@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Yi Wang <wang.yi59@zte.com.cn>, kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr, Cheng Shengyu <cheng.shengyu@zte.com.cn>, Wen Yang <wen.yang99@zte.com.cn>

>> So I plan to modify the following to capture both cases:
>> -local idexpression id;
>> +expression id;
>
> I'm not sure that this is a good idea.

Why have you got doubts here?


> There is likely no need for a put in the latter case.

I have got understanding difficulties for such information.
What did you try to express with this sentence finally?

Regards,
Markus
