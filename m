From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 18 Jul 2019 12:54:32 +0000
Subject: =?UTF-8?Q?Re=3a_=5bv3=5d_Coccinelle=3a_semantic_code_search_for_?= =?UTF-8?B?4oCcdXNlIGFmdGVyIOKApuK
Message-Id: <dafd7602-09df-2697-508f-99a937280f9d@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1563246347-7803-1-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1563246347-7803-1-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wen Yang <wen.yang99@zte.com.cn>, cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org
Cc: Yi Wang <wang.yi59@zte.com.cn>, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Xue Zhihong <xue.zhihong@zte.com.cn>, Cheng Shengyu <cheng.shengyu@zte.com.cn>

> Finally, this patch finds use-after-free issues for a node.
> (implemented by the r_use_after_put rule)

I suggest to take another look also at information from a clarification attempt
on a topic like “Checking statement order for patch generation with SmPL support”.
https://systeme.lip6.fr/pipermail/cocci/2017-September/004483.html
https://lore.kernel.org/cocci/alpine.DEB.2.20.1709071519240.3168@hadrien/

Under which circumstances will it become safer to develop SmPL script variants
for such source code search patterns?

Regards,
Markus
