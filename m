From: Clifton Barnes <clifton.a.barnes@gmail.com>
Date: Tue, 05 Apr 2016 21:37:38 +0000
Subject: [PATCH 2/2] staging: slicoss: fix missing blank line
Message-Id: <1459892258-18789-2-git-send-email-clifton.a.barnes@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1459892258-18789-1-git-send-email-clifton.a.barnes@gmail.com>
In-Reply-To: <1459892258-18789-1-git-send-email-clifton.a.barnes@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: liodot@gmail.com, charrer@alacritech.com
Cc: kernel-janitors@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, Clifton Barnes <clifton.a.barnes@gmail.com>

fix checkpatch.pl warning about 'Missing a blank line after
declarations'

Signed-off-by: Clifton Barnes <clifton.a.barnes@gmail.com>
---
 drivers/staging/slicoss/slicoss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/slicoss/slicoss.c b/drivers/staging/slicoss/slicoss.c
index cb1ad76..ac126d4 100644
--- a/drivers/staging/slicoss/slicoss.c
+++ b/drivers/staging/slicoss/slicoss.c
@@ -898,6 +898,7 @@ static void slic_upr_start(struct adapter *adapter)
 {
 	struct slic_upr *upr;
 	__iomem struct slic_regs *slic_regs = adapter->slic_regs;
+
 	upr = adapter->upr_list;
 	if (!upr)
 		return;
-- 
1.9.1

