From: Dan Carpenter <error27@gmail.com>
Date: Wed, 06 Oct 2010 05:17:35 +0000
Subject: [patch] isdn: strcpy() => strlcpy()
Message-Id: <20101006051735.GD5409@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101005163448.GH5692@bicker> <20101005164306.GP19804@ZenIV.linux.org.uk>
In-Reply-To: <20101005164306.GP19804@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Karsten Keil <isdn@linux-pingi.de>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

setup.phone and setup.eazmsn are 32 character buffers.
rcvmsg.msg_data.byte_array is a 48 character buffer.
sc_adapter[card]->channel[rcvmsg.phy_link_no - 1].dn is 50 chars.

The rcvmsg struct comes from the memcpy_fromio() in receivemessage().
I guess that means it's data off the wire.  I'm not very familiar with
this code but I don't see any reason to assume these strings are NULL
terminated.

Also it's weird that "dn" in a 50 character buffer but we only seem to
use 32 characters.  In drivers/isdn/sc/scioc.h, "dn" is only a 49
character buffer.  So potentially there is still an issue there.

The important thing for now is to prevent the memory corruption.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
I don't have this hardware, but this patch should not introduce any bugs
that weren't there in the original.

v2:  If the strlcpy() strings aren't NULL terminated then bail out
     earlier.  Add a better commit message.  The first commit message
     sucked.  Sorry for that.

diff --git a/drivers/isdn/sc/interrupt.c b/drivers/isdn/sc/interrupt.c
index 485be8b..f0225bc 100644
--- a/drivers/isdn/sc/interrupt.c
+++ b/drivers/isdn/sc/interrupt.c
@@ -112,11 +112,19 @@ irqreturn_t interrupt_handler(int dummy, void *card_inst)
 			}
 			else if(callid>=0x0000 && callid<=0x7FFF)
 			{
+				int len;
+
 				pr_debug("%s: Got Incoming Call\n",
 						sc_adapter[card]->devicename);
-				strcpy(setup.phone,&(rcvmsg.msg_data.byte_array[4]));
-				strcpy(setup.eazmsn,
-					sc_adapter[card]->channel[rcvmsg.phy_link_no-1].dn);
+				len = strlcpy(setup.phone, &(rcvmsg.msg_data.byte_array[4]),
+						sizeof(setup.phone));
+				if (len >= sizeof(setup.phone))
+					continue;
+				len = strlcpy(setup.eazmsn,
+						sc_adapter[card]->channel[rcvmsg.phy_link_no - 1].dn,
+						sizeof(setup.eazmsn));
+				if (len >= sizeof(setup.eazmsn))
+					continue;
 				setup.si1 = 7;
 				setup.si2 = 0;
 				setup.plan = 0;
@@ -176,7 +184,9 @@ irqreturn_t interrupt_handler(int dummy, void *card_inst)
 		 * Handle a GetMyNumber Rsp
 		 */
 		if (IS_CE_MESSAGE(rcvmsg,Call,0,GetMyNumber)){
-			strcpy(sc_adapter[card]->channel[rcvmsg.phy_link_no-1].dn,rcvmsg.msg_data.byte_array);
+			strlcpy(sc_adapter[card]->channel[rcvmsg.phy_link_no - 1].dn,
+				rcvmsg.msg_data.byte_array,
+				sizeof(rcvmsg.msg_data.byte_array));
 			continue;
 		}
 			
