From: Julia Lawall <julia@diku.dk>
Date: Tue, 09 Aug 2011 15:10:56 +0000
Subject: [PATCH] drivers/hwmon/ibmaem.c: add missing kfree
Message-Id: <1312902656-21520-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean Delvare <khali@linux-fr.org>
Cc: kernel-janitors@vger.kernel.org, Guenter Roeck <guenter.roeck@ericsson.com>, lm-sensors@lm-sensors.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

rs_resp is dynamically allocated in this function, so it should be freed
before exiting in every case.  This collects the kfree and the return at
the end of the function.

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/hwmon/ibmaem.c |   15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/ibmaem.c b/drivers/hwmon/ibmaem.c
index 058e0ae..783d0c1 100644
--- a/drivers/hwmon/ibmaem.c
+++ b/drivers/hwmon/ibmaem.c
@@ -399,13 +399,15 @@ static int aem_read_sensor(struct aem_data *data, u8 elt, u8 reg,
 	aem_send_message(ipmi);
 
 	res = wait_for_completion_timeout(&ipmi->read_complete, IPMI_TIMEOUT);
-	if (!res)
-		return -ETIMEDOUT;
+	if (!res) {
+		res = -ETIMEDOUT;
+		goto out;
+	}
 
 	if (ipmi->rx_result || ipmi->rx_msg_len != rs_size ||
 	    memcmp(&rs_resp->id, &system_x_id, sizeof(system_x_id))) {
-		kfree(rs_resp);
-		return -ENOENT;
+		res = -ENOENT;
+		goto out;
 	}
 
 	switch (size) {
@@ -430,8 +432,11 @@ static int aem_read_sensor(struct aem_data *data, u8 elt, u8 reg,
 		break;
 	}
 	}
+	res = 0;
 
-	return 0;
+out:
+	kfree(rs_resp);
+	return res;
 }
 
 /* Update AEM energy registers */

