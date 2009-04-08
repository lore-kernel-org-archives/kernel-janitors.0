From: Jack Stone <jwjstone@fastmail.fm>
Date: Wed, 08 Apr 2009 11:21:48 +0000
Subject: [PATCH 16/56] idle: Remove void casts
Message-Id: <1239189748-11703-17-git-send-email-jwjstone@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <>
 <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-2-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-3-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-4-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-5-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-6-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-7-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-8-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-9-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-10-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-11-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-12-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-13-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-14-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-15-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-16-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-16-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: jeff@garzik.org, kernel-janitors@vger.kernel.org, Jack Stone <jwjstone@fastmail.fm>

Remove uneeded void casts

Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
---
 drivers/idle/i7300_idle.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/idle/i7300_idle.c b/drivers/idle/i7300_idle.c
index bf74039..112a4d1 100644
--- a/drivers/idle/i7300_idle.c
+++ b/drivers/idle/i7300_idle.c
@@ -227,7 +227,7 @@ static int __init i7300_idle_ioat_init(void)
 	writew(IOAT_CHANCTRL_CHANNEL_IN_USE,
 		ioat_chanbase + IOAT_CHANCTRL_OFFSET);
 
-	ioat_desc = (struct ioat_dma_descriptor *)dma_alloc_coherent(
+	ioat_desc = dma_alloc_coherent(
 			&dummy_dma_dev, 4096,
 			(dma_addr_t *)&ioat_desc_phys, GFP_KERNEL);
 	if (!ioat_desc) {
-- 
1.5.4.3

