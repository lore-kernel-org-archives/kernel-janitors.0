From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 08 Apr 2020 16:52:31 +0000
Subject: Input: ep93xx_keypad: Checking for a failed platform_get_irq() call in ep93xx_keypad_probe()
Message-Id: <11aecb68-d243-2eeb-0cc8-50e1ec22bd71@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-input@vger.kernel.org, Allison Randal <allison@lohutok.net>, Arnd Bergmann <arnd@arndb.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, H Hartley Sweeten <hsweeten@visionengravers.com>, Olof Johansson <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Tang Bin <tangbin@cmss.chinamobile.com>

Hello,

I have taken another look at the implementation of the function “ep93xx_keypad_probe”.
A software analysis approach points the following source code out for
further development considerations.
https://elixir.bootlin.com/linux/v5.6.3/source/drivers/input/keyboard/ep93xx_keypad.c#L252
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/input/keyboard/ep93xx_keypad.c?id=f5e94d10e4c468357019e5c28d48499f677b284f#n252

 	keypad->irq = platform_get_irq(pdev, 0);
 	if (!keypad->irq) {
 		err = -ENXIO;
 		goto failed_free;
 	}


The software documentation is providing the following information
for the used programming interface.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/platform.c?id=f5e94d10e4c468357019e5c28d48499f677b284f#n221
https://elixir.bootlin.com/linux/v5.6.3/source/drivers/base/platform.c#L202

“…
 * Return: IRQ number on success, negative error number on failure.
…”

Would you like to reconsider the shown condition check?

Regards,
Markus
