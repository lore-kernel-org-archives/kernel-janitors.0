From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 25 Jul 2020 12:02:55 +0000
Subject: Re: [PATCH v2] ARM: milbeaut: Add missing of_node_put() call in m10v_smp_init()
Message-Id: <e0092582-6fb6-e374-e130-232002c908e7@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Yi Wang <wang.yi59@zte.com.cn>, Liao Pingfang <liao.pingfang@zte.com.cn>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Wang Liang <wang.liang82@zte.com.cn>, Xue Zhihong <xue.zhihong@zte.com.cn>

> The variable np in function m10v_smp_init takes the return value
> of of_find_compatible_node, which gets a node but does not put it.

Such information is useful.


> If this node is not put it may cause a memory leak.

Is the reference management generally improvable for this function implementation?


Will the tag “Fixes” become helpful for the commit message?

Regards,
Markus
