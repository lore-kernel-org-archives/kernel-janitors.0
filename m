From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Jul 2015 10:16:06 +0000
Subject: [patch] HID: uclogic: fix limit in uclogic_tablet_enable()
Message-Id: <20150729101606.GA12100@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jkosina@suse.com>, Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Cc: linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

The limit should be ARRAY_SIZE(params) (5 elements) here instead of
sizeof(params) (20 bytes).

Fixes: 08177f40bd00 ('HID: uclogic: merge hid-huion driver in hid-uclogic')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/hid/hid-uclogic.c b/drivers/hid/hid-uclogic.c
index 9416731..b905d50 100644
--- a/drivers/hid/hid-uclogic.c
+++ b/drivers/hid/hid-uclogic.c
@@ -858,7 +858,7 @@ static int uclogic_tablet_enable(struct hid_device *hdev)
 	for (p = drvdata->rdesc;
 	     p <= drvdata->rdesc + drvdata->rsize - 4;) {
 		if (p[0] = 0xFE && p[1] = 0xED && p[2] = 0x1D &&
-		    p[3] < sizeof(params)) {
+		    p[3] < ARRAY_SIZE(params)) {
 			v = params[p[3]];
 			put_unaligned(cpu_to_le32(v), (s32 *)p);
 			p += 4;
