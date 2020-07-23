From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 23 Jul 2020 07:00:11 +0000
Subject: Re: [PATCH] ARM: milbeaut: Add missing of_node_put()
Message-Id: <d6df080c-f2cc-0e9a-7a7d-fb977323f92b@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Yi Wang <wang.yi59@zte.com.cn>, Liao Pingfang <liao.pingfang@zte.com.cn>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Wang Liang <wang.liang82@zte.com.cn>, Xue Zhihong <xue.zhihong@zte.com.cn>

> After finishing using device node got from of_find_compatible_node(),
> of_node_put() needs to be called.

* An imperative wording can be preferred for the change description,
  can't it?

* Will the tag “Fixes” become helpful for the commit message?

Regards,
Markus
