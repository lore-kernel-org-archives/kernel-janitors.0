From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 06 Apr 2018 08:37:17 +0000
Subject: [PATCH v2] rsi: remove unecessary PTR_ALIGN()s
Message-Id: <20180406083717.GA21857@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <87woxletat.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Amitkumar Karwar <amit.karwar@redpinesignals.com>, Prameela Rani Garnepudi <prameela.j04cs@gmail.com>, Karun Eagalapati <karun256@gmail.com>, Siva Rebbagondla <siva.rebbagondla@redpinesignals.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

The issue here is that we allocate "data" and then set
"data = PTR_ALIGN(data, 8);" and then we free the aligned pointer
instead of the original pointer.

kmalloc() pointers are already ARCH_SLAB_MINALIGN aligned which is 8 or
more on everything except certain Xtensa variants.  We decided that if
the Xtensa people ever notice a bug here then we'll tell them the bug is
on their side.  ;)

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Instead of saving the original pointer, just remove the ALIGN()s

diff --git a/drivers/net/wireless/rsi/rsi_91x_sdio.c b/drivers/net/wireless/rsi/rsi_91x_sdio.c
index d76e69c0beaa..8ef00582c6ea 100644
--- a/drivers/net/wireless/rsi/rsi_91x_sdio.c
+++ b/drivers/net/wireless/rsi/rsi_91x_sdio.c
@@ -660,8 +660,6 @@ static int rsi_sdio_master_reg_read(struct rsi_hw *adapter, u32 addr,
 	if (!data)
 		return -ENOMEM;
 
-	data = PTR_ALIGN(data, 8);
-
 	ms_addr = (addr >> 16);
 	status = rsi_sdio_master_access_msword(adapter, ms_addr);
 	if (status < 0) {
@@ -724,8 +722,6 @@ static int rsi_sdio_master_reg_write(struct rsi_hw *adapter,
 	if (!data_aligned)
 		return -ENOMEM;
 
-	data_aligned = PTR_ALIGN(data_aligned, 8);
-
 	if (size = 2) {
 		*data_aligned = ((data << 16) | (data & 0xFFFF));
 	} else if (size = 1) {
