From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 15 Feb 2019 08:19:54 +0000
Subject: Re: [v4] coccinelle: semantic patch for missing put_device()
Message-Id: <8041ca90-5328-19ea-633e-e0b591c5723f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201902151452197117145@zte.com.cn>
 <alpine.DEB.2.21.1902150754380.2896@hadrien>
 <f4bc7f71-efee-5e0f-3209-82681ddc85be@web.de>
 <alpine.DEB.2.21.1902150900270.2896@hadrien>
In-Reply-To: <alpine.DEB.2.21.1902150900270.2896@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Yi Wang <wang.yi59@zte.com.cn>, kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr, Cheng Shengyu <cheng.shengyu@zte.com.cn>, Wen Yang <wen.yang99@zte.com.cn>

> The whole goal of the semantic patch is to ensure that put_device is
> called when needed.

Thanks for this clarification.

The software development goal seems to be clear to some degree.


> If the value is stored in a structure,

Will any further means become relevant for the discussed data processing?


> then someone else will likely take care of calling put_device later
> when the structure is destroyed.

Such a view is reasonable.

Are there any additional source code analysis and software development challenges
to consider for safer resource management?

Regards,
Markus
