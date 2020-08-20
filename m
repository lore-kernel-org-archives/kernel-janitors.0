From: Suraj Upadhyay <usuraj35@gmail.com>
Date: Thu, 20 Aug 2020 08:52:19 +0000
Subject: [PATCH 6/6] staging: wfx/hif_tx.c: Fix spelling mistake "carefull" => "careful"
Message-Id: <45b7f521c7d4c9ba09786930909414942fcedca8.1597913333.git.usuraj35@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <834139101223e627665c939388cd7c542920c531.1597913333.git.usuraj35@gmail.com>
In-Reply-To: <834139101223e627665c939388cd7c542920c531.1597913333.git.usuraj35@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jerome.pouiller@silabs.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
---
 drivers/staging/wfx/hif_tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wfx/hif_tx.c b/drivers/staging/wfx/hif_tx.c
index 5110f9b93762..fc12f9dcefce 100644
--- a/drivers/staging/wfx/hif_tx.c
+++ b/drivers/staging/wfx/hif_tx.c
@@ -125,7 +125,7 @@ int wfx_cmd_send(struct wfx_dev *wdev, struct hif_msg *request,
 
 // This function is special. After HIF_REQ_ID_SHUT_DOWN, chip won't reply to any
 // request anymore. We need to slightly hack struct wfx_hif_cmd for that job. Be
-// carefull to only call this funcion during device unregister.
+// careful to only call this function during device unregister.
 int hif_shutdown(struct wfx_dev *wdev)
 {
 	int ret;
-- 
2.17.1
