From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 20 Apr 2020 09:39:10 +0000
Subject: MAINTAINERS: Wrong ordering in CCTRNG ARM TRUSTZONE CRYPTOCELL TRUE RANDOM NUMBER GENERATOR (TRNG) D
Message-Id: <alpine.DEB.2.21.2004201122490.9739@felia>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hadar Gat <hadar.gat@arm.com>
Cc: Joe Perches <joe@perches.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Hadar,


with your commit 3c8e0bd10503 ("MAINTAINERS: add HG as cctrng 
maintainer"), now visible on next-20200420, ./scripts/checkpatch.pl -f 
MAINTAINERS complains:

#3908: FILE: MAINTAINERS:3908:
+F:	drivers/char/hw_random/cctrng.h
+F:	Documentation/devicetree/bindings/rng/arm-cctrng.txt

WARNING: Misordered MAINTAINERS entry - list 'W:' before 'F:'
#3909: FILE: MAINTAINERS:3909:
+F:	Documentation/devicetree/bindings/rng/arm-cctrng.txt
+W:	
https://developer.arm.com/products/system-ip/trustzone-cryptocell/cryptocell-700-family


This is due to wrong ordering of the entries in your submission. If you 
would like me to send you a patch fixing that, please just let me know.


Best regards,

Lukas
