From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 16 Jul 2019 12:05:41 +0000
Subject: Re: [v3] coccinelle: semantic code search for missing of_node_put
Message-Id: <ba3266e0-3ba1-f53a-9342-6619fe8724d8@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1563246347-7803-1-git-send-email-wen.yang99@zte.com.cn>
 <663d8141-5740-a452-1f4a-8335203e65ba@web.de>
 <alpine.DEB.2.21.1907161307550.2885@hadrien>
In-Reply-To: <alpine.DEB.2.21.1907161307550.2885@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>, cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org
Cc: Yi Wang <wang.yi59@zte.com.cn>, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Xue Zhihong <xue.zhihong@zte.com.cn>, Cheng Shengyu <cheng.shengyu@zte.com.cn>, Wen Yang <wen.yang99@zte.com.cn>

>> Why would you like to keep this SmPL code in the commit description?
>
> I don't know indetail what you are proposing,

I imagine that you can get more interesting software development ideas
from links to previous messages.
I hope that the desired clarification can become more constructive.

How are the chances to move such code into SmPL script files?


> but I would prefer not to put semantic patches that involve iteration
> into the kernel, for simplicity.

This view is also interesting.

But I hope that this functionality will become more helpful
if we can agree on value combinations which should be iterated
for powerful source code analysis.


>> I would prefer software evolution in an other direction.
>> https://lore.kernel.org/lkml/44be5924-26ca-5106-aa25-3cbc3343aa2c@web.de/
>> https://lkml.org/lkml/2019/7/4/21

Would you like to add any more advices for affected software components?

Regards,
Markus
