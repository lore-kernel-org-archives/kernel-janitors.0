From: Colin King <colin.king@canonical.com>
Date: Sat, 06 Jan 2018 15:50:27 +0000
Subject: [PATCH][next] HID: asus: make array 'buf' static const, shrinks object size
Message-Id: <20180106155027.17561-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the const read-only array 'buf' on the stack but instead
make it stati. Makes the object code smaller by 26 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  14378	   2384	     64	  16826	   41ba	linux/drivers/hid/hid-asus.o

After:
   text	   data	    bss	    dec	    hex	filename
  14296	   2440	     64	  16800	   41a0	linux/drivers/hid/hid-asus.o

(gcc version 7.2.0 x86_64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hid/hid-asus.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 6d2894b7d8e7..89d29f323366 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -561,7 +561,9 @@ static int asus_input_mapping(struct hid_device *hdev,
 static int asus_start_multitouch(struct hid_device *hdev)
 {
 	int ret;
-	const unsigned char buf[] = { FEATURE_REPORT_ID, 0x00, 0x03, 0x01, 0x00 };
+	static const unsigned char buf[] = {
+		FEATURE_REPORT_ID, 0x00, 0x03, 0x01, 0x00
+	};
 	unsigned char *dmabuf = kmemdup(buf, sizeof(buf), GFP_KERNEL);
 
 	if (!dmabuf) {
-- 
2.15.1

