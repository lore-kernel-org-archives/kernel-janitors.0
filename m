From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 10 Nov 2015 22:18:16 +0000
Subject: [patch] asus-wmi: fix error handling in store_sys_wmi()
Message-Id: <20151110221816.GC30281@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Corentin Chary <corentin.chary@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

The asus_wmi_get_devstate_simple() returns 0-1 on success.  In theory
according to static checkers, it can return either -EIO or -ENODEV on
failure.  Currently the error handling code only handles -ENODEV and
-EIO is treated as success.  Let's make it handle the -EIO error as
well.

It's possible that it can't actually return -EIO and this patch is not
needed but in that case this patch is harmless and silences a static
checker warning so it's still worth it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index e3a7502..f96f7b8 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1682,7 +1682,7 @@ static ssize_t store_sys_wmi(struct asus_wmi *asus, int devid,
 	int rv, err, value;
 
 	value = asus_wmi_get_devstate_simple(asus, devid);
-	if (value = -ENODEV)	/* Check device presence */
+	if (value < 0)
 		return value;
 
 	rv = parse_arg(buf, count, &value);
