From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 15 Apr 2013 07:44:04 +0000
Subject: [patch] mwave: info leak in mwave_ioctl()
Message-Id: <20130415074404.GA20993@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, akpm@linux-foundation.org

Smatch complains that on 64 bit systems, there is a hole in the
MW_ABILITIES struct between ->component_count and ->component_list[].
It leaks stack information from the mwave_ioctl() function.

I've added a memset() to initialize the struct to zero.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/char/mwave/tp3780i.c b/drivers/char/mwave/tp3780i.c
index c689697..04e6d6a 100644
--- a/drivers/char/mwave/tp3780i.c
+++ b/drivers/char/mwave/tp3780i.c
@@ -479,6 +479,7 @@ int tp3780I_QueryAbilities(THINKPAD_BD_DATA * pBDData, MW_ABILITIES * pAbilities
 	PRINTK_2(TRACE_TP3780I,
 		"tp3780i::tp3780I_QueryAbilities entry pBDData %p\n", pBDData);
 
+	memset(pAbilities, 0, sizeof(*pAbilities));
 	/* fill out standard constant fields */
 	pAbilities->instr_per_sec = pBDData->rDspSettings.uIps;
 	pAbilities->data_size = pBDData->rDspSettings.uDStoreSize;
