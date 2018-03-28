From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 28 Mar 2018 13:22:14 +0000
Subject: [PATCH -next] Bluetooth: btrsi: remove unused including <linux/version.h>
Message-Id: <1522243334-94150-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Prameela Rani Garnepudi <prameela.j04cs@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove including <linux/version.h> that don't need it.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/bluetooth/btrsi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/bluetooth/btrsi.c b/drivers/bluetooth/btrsi.c
index 5034325..60d1419 100644
--- a/drivers/bluetooth/btrsi.c
+++ b/drivers/bluetooth/btrsi.c
@@ -13,7 +13,6 @@
  * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
  * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  */
-#include <linux/version.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <net/bluetooth/bluetooth.h>

