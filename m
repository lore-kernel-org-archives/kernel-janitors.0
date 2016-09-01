From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 01 Sep 2016 17:35:24 +0000
Subject: [PATCH 0/2] constify watchdog_ops structures
Message-Id: <1472751326-22897-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-tegra@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Wim Van Sebroeck <wim@iguana.be>, Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org

Constify watchdog_ops structures.

---

 drivers/watchdog/bcm7038_wdt.c  |    2 +-
 drivers/watchdog/cadence_wdt.c  |    2 +-
 drivers/watchdog/kempld_wdt.c   |    2 +-
 drivers/watchdog/rn5t618_wdt.c  |    2 +-
 drivers/watchdog/softdog.c      |    2 +-
 drivers/watchdog/tegra_wdt.c    |    2 +-
 drivers/watchdog/w83627hf_wdt.c |    2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)
