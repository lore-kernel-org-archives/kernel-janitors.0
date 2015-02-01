From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 01 Feb 2015 20:54:25 +0000
Subject: [patch] isdn: off by one in connect_res()
Message-Id: <20150201205425.GC29298@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Armin Schindler <mac@melware.de>
Cc: Karsten Keil <isdn@linux-pingi.de>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The bug here is that we use "Reject" as the index into the cau_t[] array
in the else path.  Since the cau_t[] has 9 elements if Reject = 9 then
we are reading beyond the end of the array.

My understanding of the code is that it's saying that if Reject is 1 or
too high then that's invalid and we should hang up.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Please review this one a bit carefully.  I think it's correct, but I'm
not terribly familiar with this code.

diff --git a/drivers/isdn/hardware/eicon/message.c b/drivers/isdn/hardware/eicon/message.c
index 0b38060..d7c2866 100644
--- a/drivers/isdn/hardware/eicon/message.c
+++ b/drivers/isdn/hardware/eicon/message.c
@@ -1474,7 +1474,7 @@ static byte connect_res(dword Id, word Number, DIVA_CAPI_ADAPTER *a,
 					add_ai(plci, &parms[5]);
 					sig_req(plci, REJECT, 0);
 				}
-				else if (Reject = 1 || Reject > 9)
+				else if (Reject = 1 || Reject >= 9)
 				{
 					add_ai(plci, &parms[5]);
 					sig_req(plci, HANGUP, 0);
