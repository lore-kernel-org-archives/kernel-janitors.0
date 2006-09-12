From: Hil <ubuntu@comcast.net>
Date: Tue, 12 Sep 2006 07:22:13 +0000
Subject: sbpcd.c: fix check_region to request_region
Message-Id: <1158045733.23931.16.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Andrew J. Kroll" <ag784@freenet.sis.buffalo.edu>, kernel-janitor-discuss@lists.sourceforge.net, linux-kernel@vger.kernel.org
Cc: Eberhard Moenkeberg <emoenke@gwdg.de>

I looked at Linux Kernel Janitor project. There is a request of fixing
the old check_region function to request_region function. I did a grep
on the source tree and found several check_region. I will continue
fixing them after this patch is accepted. Please tell me if I'm doing
the submission correctly.

ChangeLog

- The file needs to be patched because it used deprecated check_region
function

- The check_region in the file simply checks if the region of memory is
available. I replaced that line with request_region followed by
release_region to make the check

- I do not have testing result available. I am sending this email to the
maintainer for testing. The maintainer probably has the specific CD-ROMs
to test my patch.

The kernel version for the patch is 2.6.18-rc6


--- linux-2.6.17/drivers/cdrom/sbpcd.c~	2006-09-11 14:19:53.000000000
-0700
+++ linux-2.6.17/drivers/cdrom/sbpcd.c	2006-09-11 23:47:48.000000000
-0700
@@ -5671,11 +5671,12 @@ int __init sbpcd_init(void)
 	{
 		addr[1]=sbpcd[port_index];
 		if (addr[1]=0) break;
-		if (check_region(addr[1],4))
+		if (!request_region(addr[1],4,major_name))
 		{
 			msg(DBG_INF,"check_region: %03X is not free.\n",addr[1]);
 			continue;
 		}
+		release_region(addr[1],4);
 		if (sbpcd[port_index+1]=2) type=str_sp;
 		else if (sbpcd[port_index+1]=1) type=str_sb;
 		else if (sbpcd[port_index+1]=3) type=str_t16;

Signed-off-by: Hil Liao <ubuntu@comcast.net>


-------------------------------------------------------------------------
Using Tomcat but need to do more? Need to support web services, security?
Get stuff done quickly with pre-integrated technology to make your job easier
Download IBM WebSphere Application Server v.1.0.1 based on Apache Geronimo
http://sel.as-us.falkag.net/sel?cmd=lnk&kid0709&bid&3057&dat1642
_______________________________________________
Kernel-janitor-discuss mailing list
Kernel-janitor-discuss@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kernel-janitor-discuss
