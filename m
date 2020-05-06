From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 06 May 2020 05:51:36 +0000
Subject: MAINTAINERS: Wrong ordering in DYNAMIC INTERRUPT MODERATION
Message-Id: <alpine.DEB.2.21.2005060749590.7719@felia>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jakub Kicinski <kuba@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Joe Perches <joe@perches.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Jakub,

with your commit 9b038086f06b ("docs: networking: convert DIM to RST"), 
visible on next-20200505, ./scripts/checkpatch.pl -f MAINTAINERS 
complains:

WARNING: Misordered MAINTAINERS entry - list file patterns in alphabetic order
#5966: FILE: MAINTAINERS:5966:
+F:	lib/dim/
+F:	Documentation/networking/net_dim.rst

This is due to wrong ordering of the entries in your submission. If you 
would like me to send you a patch fixing that, please just let me know.

It is a recent addition to checkpatch.pl to report ordering problems in 
MAINTAINERS, so you might have not seen that at submission time.


Best regards,

Lukas
