From: Poyo VL <poyo_vl@yahoo.com>
Date: Mon, 20 Sep 2010 17:48:08 +0000
Subject: [PATCH] drivers/block/cciss.c (2.6.35.7): Fixed useless compile warning
Message-Id: <115163.69814.qm@web45812.mail.sp1.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

I am sorry if I sent this wrong, but someone told me to send this to this e-mail 
adress.
There isn't practically any problem, but the compiler can't know that, because 
sn is initialized in a conditional expression (else return snprintf(...)...), 
and it throws those ugly warnings:
drivers/block/cciss.c: In function ‘dev_show_unique_id’:
drivers/block/cciss.c:564:7: warning: ‘sn[0]’ may be used uninitialized in this 
function
drivers/block/cciss.c:564:7: warning: ‘sn[1]’ may be used uninitialized in this 
function
drivers/block/cciss.c:564:7: warning: ‘sn[2]’ may be used uninitialized in this 
function
drivers/block/cciss.c:564:7: warning: ‘sn[3]’ may be used uninitialized in this 
function
drivers/block/cciss.c:564:7: warning: ‘sn[4]’ may be used uninitialized in this 
function
drivers/block/cciss.c:564:7: warning: ‘sn[5]’ may be used uninitialized in this 
function
drivers/block/cciss.c:564:7: warning: ‘sn[6]’ may be used uninitialized in this 
function
drivers/block/cciss.c:564:7: warning: ‘sn[7]’ may be used uninitialized in this 
function
drivers/block/cciss.c:564:7: warning: ‘sn[8]’ may be used uninitialized in this 
function
drivers/block/cciss.c:564:7: warning: ‘sn[9]’ may be used uninitialized in this 
function
drivers/block/cciss.c:564:7: warning: ‘sn[10]’ may be used uninitialized in this 

function
drivers/block/cciss.c:564:7: warning: ‘sn[11]’ may be used uninitialized in this 

function
drivers/block/cciss.c:564:7: warning: ‘sn[12]’ may be used uninitialized in this 

function
drivers/block/cciss.c:564:7: warning: ‘sn[13]’ may be used uninitialized in this 

function
drivers/block/cciss.c:564:7: warning: ‘sn[14]’ may be used uninitialized in this 

function
drivers/block/cciss.c:564:7: warning: ‘sn[15]’ may be used uninitialized in this 

function
Just have to initialize sn[] with 0. It is practically useless, but the compiler 

wan't throw that warnings anymore.
Patch downer. Thanks.

Signed-off-by: Ionut Gabriel Popescu <poyo_vl@yahoo.com>
---

--- a/drivers/block/cciss.c    2010-09-17 20:17:49.844010958 +0300
+++ b/drivers/block/cciss.c    2010-09-13 19:54:58.000000000 +0300
@@ -561,7 +561,7 @@ static ssize_t dev_show_unique_id(struct
{
     drive_info_struct *drv = to_drv(dev);
     struct ctlr_info *h = to_hba(drv->dev.parent);
-    __u8 sn[16] = {0};
+    __u8 sn[16];
     unsigned long flags;
     int ret = 0;


      
