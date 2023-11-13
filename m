Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995FA3D72
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Nov 2023 04:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 5A10CFA;
	Sun, 12 Nov 2023 20:41:47 -0800 (PST)
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 4C935604A87FE;
	Mon, 13 Nov 2023 12:41:31 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: kvalo@kernel.org
Cc: Su Hui <suhui@nfschina.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH wireless-next] wlcore: debugfs: add an error code check in beacon_filtering_write
Date: Mon, 13 Nov 2023 12:41:14 +0800
Message-Id: <20231113044113.74732-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wl1271_acx_beacon_filter_opt() return error code if failed, add a check
for this is better and safer.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/net/wireless/ti/wlcore/debugfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ti/wlcore/debugfs.c b/drivers/net/wireless/ti/wlcore/debugfs.c
index eb3d3f0e0b4d..d4071291a8cd 100644
--- a/drivers/net/wireless/ti/wlcore/debugfs.c
+++ b/drivers/net/wireless/ti/wlcore/debugfs.c
@@ -932,13 +932,15 @@ static ssize_t beacon_filtering_write(struct file *file,
 
 	wl12xx_for_each_wlvif(wl, wlvif) {
 		ret = wl1271_acx_beacon_filter_opt(wl, wlvif, !!value);
+		if (ret < 0)
+			break;
 	}
 
 	pm_runtime_mark_last_busy(wl->dev);
 	pm_runtime_put_autosuspend(wl->dev);
 out:
 	mutex_unlock(&wl->mutex);
-	return count;
+	return ret < 0 ? ret : count;
 }
 
 static const struct file_operations beacon_filtering_ops = {
-- 
2.30.2

