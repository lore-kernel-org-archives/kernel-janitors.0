From: Dan Carpenter <error27@gmail.com>
Date: Tue, 05 Oct 2010 16:34:48 +0000
Subject: [patch] isdn: strcpy() => strlcpy()
Message-Id: <20101005163448.GH5692@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karsten Keil <isdn@linux-pingi.de>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

setup.phone and setup.eazmsn are 32 character buffers.
rcvmsg.msg_data.byte_array is a 48 character buffer.
sc_adapter[card]->channel[rcvmsg.phy_link_no - 1].dn is 50 chars.

I changed the strcpy() so strlcpy() because that's safest.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/isdn/sc/interrupt.c b/drivers/isdn/sc/interrupt.c
index 485be8b..288073e 100644
--- a/drivers/isdn/sc/interrupt.c
+++ b/drivers/isdn/sc/interrupt.c
@@ -114,9 +114,11 @@ irqreturn_t interrupt_handler(int dummy, void *card_inst)
 			{
 				pr_debug("%s: Got Incoming Call\n",
 						sc_adapter[card]->devicename);
-				strcpy(setup.phone,&(rcvmsg.msg_data.byte_array[4]));
-				strcpy(setup.eazmsn,
-					sc_adapter[card]->channel[rcvmsg.phy_link_no-1].dn);
+				strlcpy(setup.phone, &(rcvmsg.msg_data.byte_array[4]),
+					sizeof(setup.phone));
+				strlcpy(setup.eazmsn,
+					sc_adapter[card]->channel[rcvmsg.phy_link_no - 1].dn,
+					sizeof(setup.eazmsn));
 				setup.si1 = 7;
 				setup.si2 = 0;
 				setup.plan = 0;
@@ -176,7 +178,9 @@ irqreturn_t interrupt_handler(int dummy, void *card_inst)
 		 * Handle a GetMyNumber Rsp
 		 */
 		if (IS_CE_MESSAGE(rcvmsg,Call,0,GetMyNumber)){
-			strcpy(sc_adapter[card]->channel[rcvmsg.phy_link_no-1].dn,rcvmsg.msg_data.byte_array);
+			strlcpy(sc_adapter[card]->channel[rcvmsg.phy_link_no - 1].dn,
+				rcvmsg.msg_data.byte_array,
+				sizeof(rcvmsg.msg_data.byte_array));
 			continue;
 		}
 			
