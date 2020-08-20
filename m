From: Suraj Upadhyay <usuraj35@gmail.com>
Date: Thu, 20 Aug 2020 08:50:30 +0000
Subject: [PATCH 2/6] staging: wfx/main.c: Fix a spelling mistake "negociate" => "negotiate"
Message-Id: <99deaab6dbe1d1a8325ec7f340109d9f9b5026fb.1597913333.git.usuraj35@gmail.com>
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
 drivers/staging/wfx/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wfx/main.c b/drivers/staging/wfx/main.c
index 11dfa088fc86..4263f912760b 100644
--- a/drivers/staging/wfx/main.c
+++ b/drivers/staging/wfx/main.c
@@ -384,7 +384,7 @@ int wfx_probe(struct wfx_dev *wdev)
 	err = wfx_sl_init(wdev);
 	if (err && wdev->hw_caps.capabilities.link_mode = SEC_LINK_ENFORCED) {
 		dev_err(wdev->dev,
-			"chip require secure_link, but can't negociate it\n");
+			"chip require secure_link, but can't negotiate it\n");
 		goto err0;
 	}
 
-- 
2.17.1
