From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Oct 2020 07:08:24 +0000
Subject: [PATCH] hwmon: (pmbus/max20730) use scnprintf() instead of snprintf()
Message-Id: <20201022070824.GC2817762@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guenter Roeck <linux@roeck-us.net>, Ugur Usug <Ugur.Usug@maximintegrated.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org

The snprintf() function returns the number of characters which would
have been printed if there were enough space, but the scnprintf()
returns the number of characters which were actually printed.  If the
buffer is not large enough, then using snprintf() would result in a
read overflow and an information leak.

Fixes: 8910c0bd533d ("hwmon: (pmbus/max20730) add device monitoring via debugfs")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/hwmon/pmbus/max20730.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/pmbus/max20730.c b/drivers/hwmon/pmbus/max20730.c
index 57923d72490c..be83b98411c7 100644
--- a/drivers/hwmon/pmbus/max20730.c
+++ b/drivers/hwmon/pmbus/max20730.c
@@ -122,8 +122,8 @@ static ssize_t max20730_debugfs_read(struct file *file, char __user *buf,
 	switch (idx) {
 	case MAX20730_DEBUGFS_VOUT_MIN:
 		ret = VOLT_FROM_REG(data->mfr_voutmin * 10000);
-		len = snprintf(tbuf, DEBUG_FS_DATA_MAX, "%d.%d\n",
-			       ret / 10000, ret % 10000);
+		len = scnprintf(tbuf, DEBUG_FS_DATA_MAX, "%d.%d\n",
+				ret / 10000, ret % 10000);
 		break;
 	case MAX20730_DEBUGFS_FREQUENCY:
 		val = (data->mfr_devset1 & MAX20730_MFR_DEVSET1_FSW_MASK)
@@ -141,7 +141,7 @@ static ssize_t max20730_debugfs_read(struct file *file, char __user *buf,
 			ret = 800;
 		else
 			ret = 900;
-		len = snprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
+		len = scnprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
 		break;
 	case MAX20730_DEBUGFS_PG_DELAY:
 		val = (data->mfr_devset1 & MAX20730_MFR_DEVSET1_TSTAT_MASK)
@@ -223,7 +223,7 @@ static ssize_t max20730_debugfs_read(struct file *file, char __user *buf,
 	case MAX20730_DEBUGFS_OC_PROTECT_MODE:
 		ret = (data->mfr_devset2 & MAX20730_MFR_DEVSET2_OCPM_MASK)
 			>> MAX20730_MFR_DEVSET2_OCPM_BIT_POS;
-		len = snprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
+		len = scnprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
 		break;
 	case MAX20730_DEBUGFS_SS_TIMING:
 		val = (data->mfr_devset2 & MAX20730_MFR_DEVSET2_SS_MASK)
@@ -241,32 +241,32 @@ static ssize_t max20730_debugfs_read(struct file *file, char __user *buf,
 	case MAX20730_DEBUGFS_IMAX:
 		ret = (data->mfr_devset2 & MAX20730_MFR_DEVSET2_IMAX_MASK)
 			>> MAX20730_MFR_DEVSET2_IMAX_BIT_POS;
-		len = snprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
+		len = scnprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
 		break;
 	case MAX20730_DEBUGFS_OPERATION:
 		ret = i2c_smbus_read_byte_data(psu->client, PMBUS_OPERATION);
 		if (ret < 0)
 			return ret;
-		len = snprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
+		len = scnprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
 		break;
 	case MAX20730_DEBUGFS_ON_OFF_CONFIG:
 		ret = i2c_smbus_read_byte_data(psu->client, PMBUS_ON_OFF_CONFIG);
 		if (ret < 0)
 			return ret;
-		len = snprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
+		len = scnprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
 		break;
 	case MAX20730_DEBUGFS_SMBALERT_MASK:
 		ret = i2c_smbus_read_word_data(psu->client,
 					       PMBUS_SMB_ALERT_MASK);
 		if (ret < 0)
 			return ret;
-		len = snprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
+		len = scnprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
 		break;
 	case MAX20730_DEBUGFS_VOUT_MODE:
 		ret = i2c_smbus_read_byte_data(psu->client, PMBUS_VOUT_MODE);
 		if (ret < 0)
 			return ret;
-		len = snprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
+		len = scnprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
 		break;
 	case MAX20730_DEBUGFS_VOUT_COMMAND:
 		ret = i2c_smbus_read_word_data(psu->client, PMBUS_VOUT_COMMAND);
@@ -274,8 +274,8 @@ static ssize_t max20730_debugfs_read(struct file *file, char __user *buf,
 			return ret;
 
 		ret = VOLT_FROM_REG(ret * 10000);
-		len = snprintf(tbuf, DEBUG_FS_DATA_MAX,
-			       "%d.%d\n", ret / 10000, ret % 10000);
+		len = scnprintf(tbuf, DEBUG_FS_DATA_MAX,
+				"%d.%d\n", ret / 10000, ret % 10000);
 		break;
 	case MAX20730_DEBUGFS_VOUT_MAX:
 		ret = i2c_smbus_read_word_data(psu->client, PMBUS_VOUT_MAX);
@@ -283,8 +283,8 @@ static ssize_t max20730_debugfs_read(struct file *file, char __user *buf,
 			return ret;
 
 		ret = VOLT_FROM_REG(ret * 10000);
-		len = snprintf(tbuf, DEBUG_FS_DATA_MAX,
-			       "%d.%d\n", ret / 10000, ret % 10000);
+		len = scnprintf(tbuf, DEBUG_FS_DATA_MAX,
+				"%d.%d\n", ret / 10000, ret % 10000);
 		break;
 	default:
 		len = strlcpy(tbuf, "Invalid\n", DEBUG_FS_DATA_MAX);
-- 
2.28.0
