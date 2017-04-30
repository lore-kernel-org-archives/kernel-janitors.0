From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 30 Apr 2017 14:20:33 +0000
Subject: MIPS: Lantiq: Completion of error handling around clkdev_add_clkout()
Message-Id: <b27c5b95-747b-e83a-84e8-01fd7a1ae04e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-mips@linux-mips.org, Arnd Bergmann <arnd@arndb.de>, Felix Fietkau <nbd@nbd.name>, Hauke Mehrtens <hauke@hauke-m.de>, James Hogan <james.hogan@imgtec.com>, John Crispin <john@phrozen.org>, =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Pan Bian <bianpan2016@163.com>

Hello,

I have noticed by execution of another script for the semantic patch language
(Coccinelle software) that the function “clkdev_add_clkout” does not contain
null pointer checks after calls of the function “kzalloc”.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/mips/lantiq/xway/sysctrl.c?h=v4.10#n403

How do you think about to add corresponding checks and adjust the function
return type there?

Regards,
Markus
