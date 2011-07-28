From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Thu, 28 Jul 2011 10:27:39 +0000
Subject: staging: Add Cypress TTSP G3 support
Message-Id: <1311848862-24236-1-git-send-email-martinez.javier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Cc: Kevin McNeely <kev@cypress.com>, devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-input@vger.kernel.org, Steve Kolokowsky <syk@cypress.com>, rydberg@euromail.se, Oleg Drokin <green@linuxhacker.ru>, William Marone <wmarone@gmail.com>

This patchset adds support to Cypress (TTSP) touchscreen hardware.

The original author of this code is Kevin McNeely <kev@cypress.com>.

The patchset is divided in three patchs:

[PATCH 1/3] staging: cyttsp: Add Cypress TTSP G3 Core Driver
[PATCH 2/3] staging: cyttsp: Add Cypress TTSP G3 I2C Device Driver
[PATCH 3/3] staging: cyttsp: Add Cypress TTSP G3 SPI Device Driver

The fist one adds the core support for the TTSP touchscreen and the
other two adds communications modules for I2C and SPI buses respectively.
