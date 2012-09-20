From: Adam Buchbinder <adam.buchbinder@gmail.com>
Date: Thu, 20 Sep 2012 01:48:01 +0000
Subject: [PATCH] eisa: Fix spelling of "asynchronous".
Message-Id: <1348105682-25196-4-git-send-email-adam.buchbinder@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Some device IDs misspell "asynchronous". String change only.

Signed-off-by: Adam Buchbinder <adam.buchbinder@gmail.com>
---
 drivers/eisa/eisa.ids |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/eisa/eisa.ids b/drivers/eisa/eisa.ids
index 6cbb7a5..2d864b4 100644
--- a/drivers/eisa/eisa.ids
+++ b/drivers/eisa/eisa.ids
@@ -985,8 +985,8 @@ ISABD00 "Racal-Interlan NP600A Ethernet 16bit"
 ISABD02 "Racal-Interlan NI5210/8 Ethernet"
 ISABD03 "Racal-Interlan NI5210/16 Ethernet"
 ISABE00 "Qua Tech PXB-1608 Parallel Expansion Board"
-ISABE01 "Qua Tech ES-100 8 Channel Asyncronous"
-ISABE02 "Qua Tech QS-100M 4 Channel Asyncronous"
+ISABE01 "Qua Tech ES-100 8 Channel Asynchronous"
+ISABE02 "Qua Tech QS-100M 4 Channel Asynchronous"
 ISABE03 "Qua Tech MXI-100 IEEE 488 GPIB"
 ISABE04 "Qua Tech DS-201 Dual Channel RS-422"
 ISABE05 "Qua Tech PXB-721 Parallel Expansion"
-- 
1.7.7.3

