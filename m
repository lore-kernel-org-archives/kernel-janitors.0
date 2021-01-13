From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 13 Jan 2021 07:00:23 +0000
Subject: [PATCH for doc-next] doc/zh_CN: adjust table markup in mips/ingenic-tcu.rst
Message-Id: <20210113070023.25064-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jonathan Corbet <corbet@lwn.net>, Yanteng Si <siyanteng@loongson.cn>, Harry Wei <harryxiyou@gmail.com>, Alex Shi <alex.shi@linux.alibaba.com>, linux-doc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 419b1d4ed1cb ("doc/zh_CN: add mips ingenic-tcu.rst translation")
introduces a warning with make htmldocs:

  ./Documentation/translations/zh_CN/mips/ingenic-tcu.rst:
    61: WARNING: Malformed table. Text in column margin in table line 6.

Adjust the table markup to address this warning.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20210113

Yanteng, please ack.

Jonathan, please pick this doc warning fixup on your -next tree. 

 Documentation/translations/zh_CN/mips/ingenic-tcu.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/translations/zh_CN/mips/ingenic-tcu.rst b/Documentation/translations/zh_CN/mips/ingenic-tcu.rst
index 72b5d409ed89..9324a0a26430 100644
--- a/Documentation/translations/zh_CN/mips/ingenic-tcu.rst
+++ b/Documentation/translations/zh_CN/mips/ingenic-tcu.rst
@@ -53,14 +53,14 @@
 
 TCU硬件的功能分布在多个驱动程序：
 
-======         ==+=======      ================= 时钟                drivers/clk/ingenic/tcu.c
 中断                drivers/irqchip/irq-ingenic-tcu.c
 定时器              drivers/clocksource/ingenic-timer.c
 OST                 drivers/clocksource/ingenic-ost.c
 脉冲宽度调制器      drivers/pwm/pwm-jz4740.c
 看门狗              drivers/watchdog/jz4740_wdt.c
-======         ==+=======      ================= 
 因为可以从相同的寄存器控制属于不同驱动程序和框架的TCU的各种功能，所以
 所有这些驱动程序都通过相同的控制总线通用接口访问它们的寄存器。
-- 
2.17.1
