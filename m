From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 Jan 2016 09:54:51 +0000
Subject: [patch] amd64_edac: shift wrapping issue in f1x_get_norm_dct_addr()
Message-Id: <20160120095451.GB19898@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Thompson <dougthompson@xmission.com>, Borislav Petkov <bp@alien8.de>
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

dct_sel_base_off is declared as a u64 but we're only using the lower 32
bits because of a shift wrapping bug.

Fixes: c8e518d5673d ('amd64_edac: Sanitize f10_get_base_addr_offset')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker stuff.  Not tested.

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index 9eee13e..d87a475 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -1452,7 +1452,7 @@ static u64 f1x_get_norm_dct_addr(struct amd64_pvt *pvt, u8 range,
 	u64 chan_off;
 	u64 dram_base		= get_dram_base(pvt, range);
 	u64 hole_off		= f10_dhar_offset(pvt);
-	u64 dct_sel_base_off	= (pvt->dct_sel_hi & 0xFFFFFC00) << 16;
+	u64 dct_sel_base_off	= (u64)(pvt->dct_sel_hi & 0xFFFFFC00) << 16;
 
 	if (hi_rng) {
 		/*
