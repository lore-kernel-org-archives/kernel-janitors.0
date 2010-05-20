From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 20 May 2010 08:32:54 +0000
Subject: [PATCH 02/11] xtensa: Storage class should be before const qualifier
Message-Id: <1274344374-8804-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The C99 specification states in section 6.11.5:

The placement of a storage-class specifier other than at the beginning
of the declaration specifiers in a declaration is an obsolescent
feature.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 arch/xtensa/variants/s6000/include/variant/dmac.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/xtensa/variants/s6000/include/variant/dmac.h b/arch/xtensa/variants/s6000/include/variant/dmac.h
index 89ab948..e81735b 100644
--- a/arch/xtensa/variants/s6000/include/variant/dmac.h
+++ b/arch/xtensa/variants/s6000/include/variant/dmac.h
@@ -357,7 +357,7 @@ static inline u32 s6dmac_channel_enabled(u32 dmac, int chan)
 static inline void s6dmac_dp_setup_group(u32 dmac, int port,
 			int nrch, int frrep)
 {
-	const static u8 mask[4] = {0, 3, 1, 2};
+	static const u8 mask[4] = {0, 3, 1, 2};
 	BUG_ON(dmac != S6_REG_DPDMA);
 	if ((port < 0) || (port > 3) || (nrch < 1) || (nrch > 4))
 		return;
-- 
1.6.3.3

