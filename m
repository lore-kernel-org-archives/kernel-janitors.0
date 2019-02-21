From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 21 Feb 2019 18:38:26 +0000
Subject: [PATCH 2/2] test_firmware: silence underflow warning in test_dev_config_update_u8()
Message-Id: <20190221183826.GA30993@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20190221183700.GA1737@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, "Luis R. Rodriguez" <mcgrof@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

We put an upper bound on "new" but we don't check for negatives. In
this case the underflow doesn't matter very much, but we may as well
make the static checker happy.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 lib/test_firmware.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/lib/test_firmware.c b/lib/test_firmware.c
index 7222093ee00b..5911b0f1a715 100644
--- a/lib/test_firmware.c
+++ b/lib/test_firmware.c
@@ -326,15 +326,12 @@ static ssize_t test_dev_config_show_int(char *buf, int cfg)
 static int test_dev_config_update_u8(const char *buf, size_t size, u8 *cfg)
 {
 	int ret;
-	long new;
+	u8 new;
 
-	ret = kstrtol(buf, 10, &new);
+	ret = kstrtou8(buf, 10, &new);
 	if (ret)
 		return ret;
 
-	if (new > U8_MAX)
-		return -EINVAL;
-
 	mutex_lock(&test_fw_mutex);
 	*(u8 *)cfg = new;
 	mutex_unlock(&test_fw_mutex);
-- 
2.17.1
