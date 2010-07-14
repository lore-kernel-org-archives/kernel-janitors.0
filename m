From: Kulikov Vasiliy <segooon@gmail.com>
Date: Wed, 14 Jul 2010 18:01:42 +0000
Subject: [PATCH 03/11] arch/mips/kernel/smtc.c: formatting of pointers in printk()
Message-Id: <1279130502-10777-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Ralf Baechle <ralf@linux-mips.org>, Chris Dearman <chris@mips.com>, "Robert P. J. Day" <rpjday@crashcourse.ca>, Rusty Russell <rusty@rustcorp.com.au>, =?UTF-8?q?Andr=C3=A9=20Goddard=20Rosa?= <andre.goddard@gmail.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org

Use %p instead of %08x in printk().

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 arch/mips/kernel/smtc.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/smtc.c b/arch/mips/kernel/smtc.c
index a95dea5..cfeb2c1 100644
--- a/arch/mips/kernel/smtc.c
+++ b/arch/mips/kernel/smtc.c
@@ -975,8 +975,7 @@ void ipi_decode(struct smtc_ipi *pipi)
 			ipi_call_interrupt();
 			break;
 		default:
-			printk("Impossible SMTC IPI Argument 0x%x\n",
-				(int)arg_copy);
+			printk("Impossible SMTC IPI Argument %p\n", arg_copy);
 			break;
 		}
 		break;
-- 
1.7.0.4

