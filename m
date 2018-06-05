From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Jun 2018 11:31:39 +0000
Subject: [PATCH] rndis_wlan: potential buffer overflow in rndis_wlan_auth_indication()
Message-Id: <20180605113139.m65jc2hlisa62deu@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jussi Kivilinna <jussi.kivilinna@iki.fi>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

This is a static checker fix, not something I have tested.  The issue
is that on the second iteration through the loop, we jump forward by
le32_to_cpu(auth_req->length) bytes.  The problem is that if the length
is more than "buflen" then we end up with a negative "buflen".  A
negative buflen is type promoted to a high positive value and the loop
continues but it's accessing beyond the end of the buffer.

I believe the "auth_req->length" comes from the firmware and if the
firmware is malicious or buggy, you're already toasted so the impact of
this bug is probably not very severe.

Fixes: 030645aceb3d ("rndis_wlan: handle 802.11 indications from device")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/rndis_wlan.c b/drivers/net/wireless/rndis_wlan.c
index 9935bd09db1f..d4947e3a909e 100644
--- a/drivers/net/wireless/rndis_wlan.c
+++ b/drivers/net/wireless/rndis_wlan.c
@@ -2928,6 +2928,8 @@ static void rndis_wlan_auth_indication(struct usbnet *usbdev,
 
 	while (buflen >= sizeof(*auth_req)) {
 		auth_req = (void *)buf;
+		if (buflen < le32_to_cpu(auth_req->length))
+			return;
 		type = "unknown";
 		flags = le32_to_cpu(auth_req->flags);
 		pairwise_error = false;
