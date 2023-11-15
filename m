Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE869465
	for <kernel-janitors@vger.kernel.org>; Wed, 15 Nov 2023 09:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id CABAF106;
	Wed, 15 Nov 2023 01:54:45 -0800 (PST)
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 35B63602806DA;
	Wed, 15 Nov 2023 17:54:40 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	sanyog.r.kale@intel.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	trix@redhat.com
Cc: Su Hui <suhui@nfschina.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] soundwire: amd: add an error code check in amd_sdw_clock_stop_exit
Date: Wed, 15 Nov 2023 17:54:08 +0800
Message-Id: <20231115095407.1059704-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang static analyzer complains that value stored to 'ret' is never read.
Add an error code check and print an error message if 'readl_poll_timeout'
failed.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/soundwire/amd_manager.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 3a99f6dcdfaf..f391b541f4b7 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1029,6 +1029,10 @@ static int amd_sdw_clock_stop_exit(struct amd_sdw_manager *amd_manager)
 		ret = readl_poll_timeout(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL, val,
 					 (val & AMD_SDW_CLK_RESUME_DONE), ACP_DELAY_US,
 					 AMD_SDW_TIMEOUT);
+		if (ret)
+			dev_err(amd_manager->dev, "%s: timed out: %pe\n", __func__,
+				ERR_PTR(ret));
+
 		if (val & AMD_SDW_CLK_RESUME_DONE) {
 			writel(0, amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
 			ret = sdw_bus_exit_clk_stop(&amd_manager->bus);
-- 
2.30.2

