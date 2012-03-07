From: santosh nayak <santoshprasadnayak@gmail.com>
Date: Wed, 07 Mar 2012 03:53:03 +0000
Subject: [PATCH] [media] dvb: negative value assigned to unsigned int in CDRXD().
Message-Id: <1331091663-4790-1-git-send-email-santoshprasadnayak@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mchehab@infradead.org
Cc: dheitmueller@kernellabs.com, hans.verkuil@cisco.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Santosh Nayak <santoshprasadnayak@gmail.com>

From: Santosh Nayak <santoshprasadnayak@gmail.com>

In CDRXD(), Negative number is assigned to unsigned variable
'state->noise_cal.tdCal2.

Members of 'SNoiseCal' should be 'signed short'.

Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>
---
 drivers/media/dvb/frontends/drxd_hard.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb/frontends/drxd_hard.c b/drivers/media/dvb/frontends/drxd_hard.c
index 7bf39cd..f380eb4 100644
--- a/drivers/media/dvb/frontends/drxd_hard.c
+++ b/drivers/media/dvb/frontends/drxd_hard.c
@@ -101,9 +101,9 @@ struct SCfgAgc {
 
 struct SNoiseCal {
 	int cpOpt;
-	u16 cpNexpOfs;
-	u16 tdCal2k;
-	u16 tdCal8k;
+	short cpNexpOfs;
+	short tdCal2k;
+	short tdCal8k;
 };
 
 enum app_env {
-- 
1.7.4.4

