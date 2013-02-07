From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Feb 2013 08:24:49 +0000
Subject: [patch v2] dvb-usb: check for invalid length in ttusb_process_muxpack()
Message-Id: <20130207082449.GA18610@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20130205201001.60fe547e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

This patch is driven by a static checker warning.

The ttusb_process_muxpack() function is only called from
ttusb_process_frame().  Before calling, it verifies that len >= 2.  The
problem is that len = 2 is not valid and would lead to an array
underflow.

Odd number values for len are also invalid and would lead to reading
past the end of the array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Moved the check from the caller into the function.  Added a check
for odd values.  Added an error message.  Increment the numinvalid
counter.

diff --git a/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c b/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c
index 5b682cc..e407185 100644
--- a/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c
+++ b/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c
@@ -561,6 +561,13 @@ static void ttusb_process_muxpack(struct ttusb *ttusb, const u8 * muxpack,
 {
 	u16 csum = 0, cc;
 	int i;
+
+	if (len < 4 || len & 0x1) {
+		pr_warn("%s: muxpack has invalid len %d\n", __func__, len);
+		numinvalid++;
+		return;
+	}
+
 	for (i = 0; i < len; i += 2)
 		csum ^= le16_to_cpup((__le16 *) (muxpack + i));
 	if (csum) {
