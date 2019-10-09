From: Sasha Levin <sashal@kernel.org>
Date: Wed, 09 Oct 2019 17:05:52 +0000
Subject: [PATCH AUTOSEL 4.19 20/26] mips: Loongson: Fix the link time qualifier of 'serial_exit()'
Message-Id: <20191009170558.32517-20-sashal@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191009170558.32517-1-sashal@kernel.org>
In-Reply-To: <20191009170558.32517-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Paul Burton <paul.burton@mips.com>, chenhc@lemote.com, ralf@linux-mips.org, jhogan@kernel.org, linux-mips@vger.kernel.org, kernel-janitors@vger.kernel.org, Sasha Levin <sashal@kernel.org>

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

[ Upstream commit 25b69a889b638b0b7e51e2c4fe717a66bec0e566 ]

'exit' functions should be marked as __exit, not __init.

Fixes: 85cc028817ef ("mips: make loongsoon serial driver explicitly modular")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Paul Burton <paul.burton@mips.com>
Cc: chenhc@lemote.com
Cc: ralf@linux-mips.org
Cc: jhogan@kernel.org
Cc: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/loongson64/common/serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/loongson64/common/serial.c b/arch/mips/loongson64/common/serial.c
index ffefc1cb26121..98c3a7feb10f8 100644
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
