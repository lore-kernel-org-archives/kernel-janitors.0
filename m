From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Sep 2012 11:04:14 +0000
Subject: [patch] HID: picoLCD: off by one in dump_buff_as_hex()
Message-Id: <20120914110414.GA1152@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>
Cc: Jiri Kosina <jkosina@suse.cz>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

We're placing the NUL terminator one character beyond the end of the
buffer here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This change obviously don't make the code worse, but I'm not positive
it's the right fix.  I'm not sure the lines before are doing the right
thing either, if we had two chars of remaining space then wouldn't it be
better to put the new line and NUL in the unused space?

If you decide to do it differently, then please feel to sent a patch for
that and give me a Reported-by cookie.

diff --git a/drivers/hid/hid-picolcd_debugfs.c b/drivers/hid/hid-picolcd_debugfs.c
index eec85b5..ff271ff0 100644
--- a/drivers/hid/hid-picolcd_debugfs.c
+++ b/drivers/hid/hid-picolcd_debugfs.c
@@ -390,7 +390,7 @@ static void dump_buff_as_hex(char *dst, size_t dst_sz, const u8 *data,
 		dst[j--] = '\0';
 		dst[j] = '\n';
 	} else
-		dst[j] = '\0';
+		dst[dst_sz - 1] = '\0';
 }
 
 void picolcd_debug_out_report(struct picolcd_data *data,
