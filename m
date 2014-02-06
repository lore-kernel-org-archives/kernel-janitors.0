From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 06 Feb 2014 07:49:47 +0000
Subject: [patch] [media] dvb-frontends: decimal vs hex typo in ChannelConfiguration()
Message-Id: <20140206074947.GA26661@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <m.chehab@samsung.com>
Cc: Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

From the context this should be hex 0x80 instead of decimal 80.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Untested.

diff --git a/drivers/media/dvb-frontends/tda18271c2dd.c b/drivers/media/dvb-frontends/tda18271c2dd.c
index 2c54586ac07f..de0a1c110972 100644
--- a/drivers/media/dvb-frontends/tda18271c2dd.c
+++ b/drivers/media/dvb-frontends/tda18271c2dd.c
@@ -1030,7 +1030,7 @@ static int ChannelConfiguration(struct tda_state *state,
 			state->m_Regs[EP4] = state->m_EP4 | state->m_IFLevelDigital;
 
 		if ((Standard = HF_FM_Radio) && state->m_bFMInput)
-			state->m_Regs[EP4] |= 80;
+			state->m_Regs[EP4] |= 0x80;
 
 		state->m_Regs[MPD] &= ~0x80;
 		if (Standard > HF_AnalogMax)
