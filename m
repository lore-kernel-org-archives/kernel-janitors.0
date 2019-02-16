From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 16 Feb 2019 08:29:30 +0000
Subject: Re: [v5] Coccinelle: semantic code search for missing put_device()
Message-Id: <6a07c337-533c-61c2-d033-575539309738@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201902161529041506841@zte.com.cn>
 <alpine.DEB.2.21.1902160908150.3212@hadrien>
In-Reply-To: <alpine.DEB.2.21.1902160908150.3212@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia.lawall@lip6.fr>, Wen Yang <wen.yang99@zte.com.cn>
Cc: Yi Wang <wang.yi59@zte.com.cn>, kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Cheng Shengyu <cheng.shengyu@zte.com.cn>, cocci@systeme.lip6.fr

>> We will modify the the if in the when code like this:
>>
>> @@ -22,7 +22,7 @@ if (id =3D=3D NULL || ...) { ... return ...; }
>>  ... when !=3D put_device(&id->dev)
=E2=80=A6
>> -    when !=3D if (id) { ... put_device(&id->dev) ... }
>> +    when !=3D if (...) { ... put_device(&id->dev) ... }
>
> This looks ok.

I have got another different software development opinion also for
such SmPL code in the adjusted line.
I find this specific source code search variant irrelevant
because the shown reference release function should be found
by the first SmPL when specification already.
Would you like to determine generally if the desired function call
is present at all?

Thus I do not see a need (or requirement) for a duplicate search attempt.

Regards,
Markus
