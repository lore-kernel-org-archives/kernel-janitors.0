From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Mar 2020 10:11:40 +0000
Subject: [PATCH] HID: clean up wiimote_cmd_map_mp() return type
Message-Id: <20200303101140.gmx5u4limxsfvard@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Herrmann <dh.herrmann@googlemail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

No one checks the error code, but the static checkers complain:

    drivers/hid/hid-wiimote-core.c:506 wiimote_cmd_map_mp()
    warn: signedness bug returning '(-512)'

We're returning negative error codes or zero on success so the type
should be int.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/hid/hid-wiimote-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-wiimote-core.c b/drivers/hid/hid-wiimote-core.c
index 92874dbe4d4a..eaa2fa565047 100644
--- a/drivers/hid/hid-wiimote-core.c
+++ b/drivers/hid/hid-wiimote-core.c
@@ -484,7 +484,7 @@ static int wiimote_cmd_init_mp(struct wiimote_data *wdata)
 }
 
 /* requires the cmd-mutex to be held */
-static bool wiimote_cmd_map_mp(struct wiimote_data *wdata, __u8 exttype)
+static int wiimote_cmd_map_mp(struct wiimote_data *wdata, __u8 exttype)
 {
 	__u8 wmem;
 
-- 
2.11.0
