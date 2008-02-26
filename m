From: Julia Lawall <julia@diku.dk>
Date: Tue, 26 Feb 2008 20:42:37 +0000
Subject: [PATCH 2/9] drivers/acpi/asus_acpi.c: Correct use of.and &
Message-Id: <Pine.LNX.4.64.0802262142120.18200@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: corentincj@iksaif.net, sziwan@users.sourceforge.net, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In commit e6bafba5b4765a5a252f1b8d31cbf6d2459da337, a bug was fixed that
involved converting !x & y to !(x & y).  The code below shows the same
pattern, and thus should perhaps be fixed in the same way.

This is not tested and clearly changes the semantics, so it is only
something to consider.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@ expression E1,E2; @@
(
  !E1 & !E2
|
- !E1 & E2
+ !(E1 & E2)
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---

diff -u -p a/drivers/acpi/asus_acpi.c b/drivers/acpi/asus_acpi.c
--- a/drivers/acpi/asus_acpi.c 2008-02-10 22:34:05.000000000 +0100
+++ b/drivers/acpi/asus_acpi.c 2008-02-26 08:00:42.000000000 +0100
@@ -610,7 +610,7 @@ write_led(const char __user * buffer, un
 	    (led_out) ? (hotk->status | ledmask) : (hotk->status & ~ledmask);
 
 	if (invert)		/* invert target value */
-		led_out = !led_out & 0x1;
+		led_out = !(led_out & 0x1);
 
 	if (!write_acpi_int(hotk->handle, ledname, led_out, NULL))
 		printk(KERN_WARNING "Asus ACPI: LED (%s) write failed\n",
