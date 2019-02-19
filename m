From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 19 Feb 2019 08:12:11 +0000
Subject: Re: [v6] coccinelle: semantic code search for missing put_device()
Message-Id: <fc48cfe9-3d01-8ab6-7bf0-a481b72f4a1a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201902191014156680299@zte.com.cn>
 <alpine.DEB.2.21.1902190804150.2570@hadrien>
In-Reply-To: <alpine.DEB.2.21.1902190804150.2570@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>, Wen Yang <wen.yang99@zte.com.cn>
Cc: kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Cheng Shengyu <cheng.shengyu@zte.com.cn>, cocci@systeme.lip6.fr

>> Although we have tested these two methods in the existing kernel code,
>> considering the evolution of the kernel code, these special cases may occur, so we are willing to take them into account.
>> We plan to modify the code like this:
>>
>>  id = of_find_device_by_node@p1(x)
>> -... when != e = id
>> +... when != e = (T)id
>> +    when != id = (T)e
>
> This change is fine with me.

Thanks for another positive feedback on such software implementation details.

Regards,
Markus
