From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 31 Aug 2020 11:39:58 +0000
Subject: [PATCH] hwmon: replace impossible fallthroughs with breaks
Message-Id: <20200831113958.GB514373@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org

It's impossible to reach these fall through statements because all
the possible values are handled.  In that situation it's cleaner to
use a break statement instead of a fall through statement.

Fixes: c947e51cf803 ("hwmon: (adt7462) Mark expected switch fall-throughs")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/hwmon/adt7462.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/adt7462.c b/drivers/hwmon/adt7462.c
index e75bbd87ad09..634a44591c7f 100644
--- a/drivers/hwmon/adt7462.c
+++ b/drivers/hwmon/adt7462.c
@@ -435,7 +435,7 @@ static const char *voltage_label(struct adt7462_data *data, int which)
 		case 3:
 			return "+1.5V";
 		}
-		fallthrough;
+		break;
 	case 2:
 		if (!(data->pin_cfg[1] & ADT7462_PIN22_INPUT))
 			return "+12V3";
@@ -493,7 +493,7 @@ static const char *voltage_label(struct adt7462_data *data, int which)
 		case 3:
 			return "+1.5";
 		}
-		fallthrough;
+		break;
 	case 11:
 		if (data->pin_cfg[3] >> ADT7462_PIN28_SHIFT =
 					ADT7462_PIN28_VOLT &&
@@ -531,7 +531,7 @@ static int voltage_multiplier(struct adt7462_data *data, int which)
 		case 3:
 			return 7800;
 		}
-		fallthrough;
+		break;
 	case 2:
 		if (!(data->pin_cfg[1] & ADT7462_PIN22_INPUT))
 			return 62500;
@@ -589,7 +589,7 @@ static int voltage_multiplier(struct adt7462_data *data, int which)
 		case 3:
 			return 7800;
 		}
-		fallthrough;
+		break;
 	case 11:
 	case 12:
 		if (data->pin_cfg[3] >> ADT7462_PIN28_SHIFT =
-- 
2.28.0
