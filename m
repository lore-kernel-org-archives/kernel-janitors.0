From: Walter Harms <wharms@bfs.de>
Date: Thu, 02 Apr 2020 13:40:49 +0000
Subject: AW: [PATCH][next] rtc: ds1307: check for failed memory allocation on wdt
Message-Id: <54a09b5502ee45e9a926a025ae576498@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200402131441.539088-1-colin.king@canonical.com>
In-Reply-To: <20200402131441.539088-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Guenter Roeck <linux@roeck-us.net>, Chris Packham <chris.packham@alliedtelesis.co.nz>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>


________________________________________
Von: kernel-janitors-owner@vger.kernel.org <kernel-janitors-owner@vger.kernel.org> im Auftrag von Colin King <colin.king@canonical.com>
Gesendet: Donnerstag, 2. April 2020 15:14
An: Alessandro Zummo; Alexandre Belloni; Guenter Roeck; Chris Packham; linux-rtc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
Betreff: [PATCH][next] rtc: ds1307: check for failed memory allocation on wdt

From: Colin Ian King <colin.king@canonical.com>

Currently a failed memory allocation will lead to a null pointer
dereference on point wdt.  Fix this by checking for a failed allocation
and adding error return handling to function ds1307_wdt_register.

Addresses-Coverity: ("Dereference null return")
Fixes: fd90d48db037 ("rtc: ds1307: add support for watchdog timer on ds1388")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/rtc/rtc-ds1307.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index fad042118862..95c5b6facc59 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -1665,14 +1665,16 @@ static const struct watchdog_ops ds1388_wdt_ops = {

 };

-static void ds1307_wdt_register(struct ds1307 *ds1307)
+static int ds1307_wdt_register(struct ds1307 *ds1307)
 {
        struct watchdog_device  *wdt;

        if (ds1307->type != ds_1388)
-               return;
+               return 0;

        wdt = devm_kzalloc(ds1307->dev, sizeof(*wdt), GFP_KERNEL);
+       if (!wdt)
+               return -ENOMEM;

        wdt->info = &ds1388_wdt_info;
        wdt->ops = &ds1388_wdt_ops;
@@ -1683,10 +1685,13 @@ static void ds1307_wdt_register(struct ds1307 *ds1307)
        watchdog_init_timeout(wdt, 0, ds1307->dev);
        watchdog_set_drvdata(wdt, ds1307);
        devm_watchdog_register_device(ds1307->dev, wdt);
+
+       return 0;
 }
 #else
-static void ds1307_wdt_register(struct ds1307 *ds1307)
+static int ds1307_wdt_register(struct ds1307 *ds1307)
 {
+       return 0;
 }
 #endif /* CONFIG_WATCHDOG_CORE */

@@ -1979,9 +1984,9 @@ static int ds1307_probe(struct i2c_client *client,

        ds1307_hwmon_register(ds1307);
        ds1307_clks_register(ds1307);
-       ds1307_wdt_register(ds1307);
+       err = ds1307_wdt_register(ds1307);

-       return 0;
+       return err;

 exit:
        return err;
--
2.25.1

IMHO, one "return err;" is sufficient.

re,
 wh
