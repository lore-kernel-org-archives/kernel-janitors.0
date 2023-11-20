Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 4118A8F;
	Mon, 20 Nov 2023 01:56:08 -0800 (PST)
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id B718C633E6ED1;
	Mon, 20 Nov 2023 17:56:00 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: tomas.winkler@intel.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: Su Hui <suhui@nfschina.com>,
	alexander.usyskin@intel.com,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2 1/2] misc: mei: client.c: return negative error code in mei_cl_write
Date: Mon, 20 Nov 2023 17:55:23 +0800
Message-Id: <20231120095523.178385-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mei_msg_hdr_init() return negative error code, rets should be
'PTR_ERR(mei_hdr)' rather than '-PTR_ERR(mei_hdr)'.

Fixes: 0cd7c01a60f8 ("mei: add support for mei extended header.")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
v2: split v1 patch to different patches
v1: https://lore.kernel.org/all/5c98fc07-36a9-92cc-f8d6-c4efdc0c34aa@nfschina.com/

 drivers/misc/mei/client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/mei/client.c b/drivers/misc/mei/client.c
index 9c8fc87938a7..7ea80779a0e2 100644
--- a/drivers/misc/mei/client.c
+++ b/drivers/misc/mei/client.c
@@ -2011,7 +2011,7 @@ ssize_t mei_cl_write(struct mei_cl *cl, struct mei_cl_cb *cb, unsigned long time
 
 	mei_hdr = mei_msg_hdr_init(cb);
 	if (IS_ERR(mei_hdr)) {
-		rets = -PTR_ERR(mei_hdr);
+		rets = PTR_ERR(mei_hdr);
 		mei_hdr = NULL;
 		goto err;
 	}
-- 
2.30.2

