From: Tobias Klauser <tklauser@distanz.ch>
Date: Mon, 09 Feb 2009 22:05:40 +0000
Subject: [PATCH] ath5k: Storage class should be before const qualifier
Message-Id: <20090209220540.GA7962@xenon.distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jirislaby@gmail.com, ath5k-devel@lists.ath5k.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, trivial@kernel.org

The C99 specification states in section 6.11.5:

The placement of a storage-class specifier other than at the beginning
of the declaration specifiers in a declaration is an obsolescent
feature.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/net/wireless/ath5k/eeprom.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath5k/eeprom.c b/drivers/net/wireless/ath5k/eeprom.c
index 1cb7edf..c5e03a6 100644
--- a/drivers/net/wireless/ath5k/eeprom.c
+++ b/drivers/net/wireless/ath5k/eeprom.c
@@ -491,9 +491,9 @@ ath5k_eeprom_init_modes(struct ath5k_hw *ah)
 static inline void
 ath5k_get_pcdac_intercepts(struct ath5k_hw *ah, u8 min, u8 max, u8 *vp)
 {
-	const static u16 intercepts3[] +	static const u16 intercepts3[]  		{ 0, 5, 10, 20, 30, 50, 70, 85, 90, 95, 100 };
-	const static u16 intercepts3_2[] +	static const u16 intercepts3_2[]  		{ 0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100 };
 	const u16 *ip;
 	int i;
-- 
1.5.6.5

