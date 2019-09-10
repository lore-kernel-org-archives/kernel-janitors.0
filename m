From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 10 Sep 2019 03:59:07 +0000
Subject: [PATCH] mips: Loongson: Fix the link time qualifier of 'serial_exit()'
Message-Id: <20190910035907.6430-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: chenhc@lemote.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'exit' functions should be marked as __exit, not __init.

Fixes: 85cc028817ef ("mips: make loongsoon serial driver explicitly modular")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/mips/loongson64/common/serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/loongson64/common/serial.c b/arch/mips/loongson64/common/serial.c
index ffefc1cb2612..98c3a7feb10f 100644
--- a/arch/mips/loongson64/common/serial.c
+++ b/arch/mips/loongson64/common/serial.c
@@ -110,7 +110,7 @@ static int __init serial_init(void)
 }
 module_init(serial_init);
 
-static void __init serial_exit(void)
+static void __exit serial_exit(void)
 {
 	platform_device_unregister(&uart8250_device);
 }
-- 
2.20.1
