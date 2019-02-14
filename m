From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 14 Feb 2019 08:13:50 +0000
Subject: Re: [v3] Coccinelle: semantic patch for missing put_device()
Message-Id: <75cad101-727d-2e6b-b6ef-a6a4d0ab4130@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1550039015-5587-1-git-send-email-wen.yang99@zte.com.cn>
 <c10e0bf1-4830-7ee4-5b21-70b521dd6c36@web.de>
 <alpine.DEB.2.21.1902132050200.2655@hadrien>
In-Reply-To: <alpine.DEB.2.21.1902132050200.2655@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>, Wen Yang <wen.yang99@zte.com.cn>
Cc: Yi Wang <wang.yi59@zte.com.cn>, kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Xue Zhihong <xue.zhihong@zte.com.cn>, Coccinelle <cocci@systeme.lip6.fr>

>> +    when != ex = \( (T)id \| &id->dev \| get_device(&id->dev) \| (T1)platform_get_drvdata(id) \)
>
> There is no need for the disjunction.  There is also no need for the
> different variables.

Really?

Would you like to distinguish the shown assignment expressions anyhow?


> Different variables are only needed when the when conditions are on
> different ...s

I find that this information will need further clarification.
Will any additional adjustments become relevant for such SmPL when specifications?

Regards,
Markus
