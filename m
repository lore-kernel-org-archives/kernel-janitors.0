From: Julia Lawall <julia@diku.dk>
Date: Thu, 12 Nov 2009 07:49:04 +0000
Subject: [PATCH 2/4] drivers/thermal: decrement sizeof size in strncmp
Message-Id: <Pine.LNX.4.64.0911120848390.16627@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

As observed by Joe Perches, sizeof of a constant string includes the
trailing 0.  If what is wanted is to check the initial characters of
another string, this trailing 0 should not be taken into account.  If an
exact match is wanted, strcmp should be used instead.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression foo;
constant char *abc;
@@

strncmp(foo, abc, 
- sizeof(abc)
+ sizeof(abc)-1
 )
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/thermal/thermal_sys.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -u -p a/drivers/thermal/thermal_sys.c b/drivers/thermal/thermal_sys.c
--- a/drivers/thermal/thermal_sys.c
+++ b/drivers/thermal/thermal_sys.c
@@ -147,9 +147,9 @@ mode_store(struct device *dev, struct de
 	if (!tz->ops->set_mode)
 		return -EPERM;
 
-	if (!strncmp(buf, "enabled", sizeof("enabled")))
+	if (!strncmp(buf, "enabled", sizeof("enabled") - 1))
 		result = tz->ops->set_mode(tz, THERMAL_DEVICE_ENABLED);
-	else if (!strncmp(buf, "disabled", sizeof("disabled")))
+	else if (!strncmp(buf, "disabled", sizeof("disabled") - 1))
 		result = tz->ops->set_mode(tz, THERMAL_DEVICE_DISABLED);
 	else
 		result = -EINVAL;
