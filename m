From: Poyo VL <poyo_vl@yahoo.com>
Date: Tue, 21 Sep 2010 09:48:12 +0000
Subject: Fw: [PATCH] drivers/block/cciss.c (2.6.34.7): Fixed useless compile warning
Message-Id: <481583.87768.qm@web45807.mail.sp1.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

GCC version: gcc version 4.5.0 20100604 [gcc-4_5-branch revision 160292] (SUSE 
Linux) 

And I'm sorry, the kernel version is 2.6.34.7 not 2.6.35.7.
But I selected almost all options from "make menuconfig", I think this is 
important to mention.
All warnings are like this one
drivers/block/cciss.c: In function ‘dev_show_unique_id’:
drivers/block/cciss.c:564:7: warning: ‘sn[0]’ may be used uninitialized in this 
function
I tried to explain. The sn[] array is initialized here: else memcpy(sn, 
drv->serial_no, sizeof(sn)); so it is initialized in a conditional expression, 
and is is used downer. So, the compiler think that it can be used unititialized 
and it throws that warning.
I fixed the patch, I am sorry, I'm a newbie.

Signed-off-by: Ionut Gabriel Popescu <poyo_vl@yahoo.com>
---

--- a/drivers/block/cciss.c    2010-09-17 20:17:49.844010958 +0300
+++ b/drivers/block/cciss.c    2010-09-13 19:54:58.000000000 +0300
@@ -561,7 +561,7 @@ static ssize_t dev_show_unique_id(struct
 {
     drive_info_struct *drv = to_drv(dev);
     struct ctlr_info *h = to_hba(drv->dev.parent);
-    __u8 sn[16];
+    __u8 sn[16] = {0};
     unsigned long flags;
     int ret = 0;




----- Forwarded Message ----
From: Dan Carpenter <error27@gmail.com>
To: Poyo VL <poyo_vl@yahoo.com>
Cc: kernel-janitors@vger.kernel.org
Sent: Tue, September 21, 2010 10:05:59 AM
Subject: Re: [PATCH] drivers/block/cciss.c (2.6.35.7): Fixed useless compile 
warning


Which version of gcc are you using?  It doesn't print any error message
for me on version 4.3.2 (which is really old).

The idea is fine but the patch is all messed up.  First of all the it's
reversed.  It says '+' where it should say '-' and '-' where it should
say '+'.

Also your mail client has completely mangled it.  It has removed spaces
from the start of lines and changed the tabs to spaces.  Please read
Documentation/email-clients.txt and send an email to yourself.  Save the
email as raw text.  cat email.txt | patch -p1.

When that works resend it.  Add these people to the CC list:

Mike Miller <mike.miller@hp.com>
Jens Axboe <jaxboe@fusionio.com>
"Stephen M. Cameron" <scameron@beardog.cce.hp.com>
iss_storagedev@hp.com

Also you don't need to copy all 16 lines of error messages.  Just a
couple will do.  But do say which version of gcc you are using.

regards,
dan carpenter


      
