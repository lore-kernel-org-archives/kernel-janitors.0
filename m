From: Colin King <colin.king@canonical.com>
Date: Sun, 05 Apr 2020 13:06:19 +0000
Subject: [PATCH] staging: gdm724x: remove redundant assignment to pointer 'w'
Message-Id: <20200405130619.377043-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lourdes Pedrajas <lu@pplo.net>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer 'w' is being initialized with a value that is never read
and it is being updated later with a new value. The initialization
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/gdm724x/gdm_lte.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gdm724x/gdm_lte.c b/drivers/staging/gdm724x/gdm_lte.c
index 354727f0a1fc..eb309190f5be 100644
--- a/drivers/staging/gdm724x/gdm_lte.c
+++ b/drivers/staging/gdm724x/gdm_lte.c
@@ -172,7 +172,7 @@ static int gdm_lte_emulate_arp(struct sk_buff *skb_in, u32 nic_type)
 
 static __sum16 icmp6_checksum(struct ipv6hdr *ipv6, u16 *ptr, int len)
 {
-	unsigned short *w = ptr;
+	unsigned short *w;
 	__wsum sum = 0;
 	int i;
 	u16 pa;
-- 
2.25.1
