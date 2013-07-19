From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 Jul 2013 05:53:13 +0000
Subject: [patch] TTY: snyclinkmp: calculating wrong addresses
Message-Id: <20130719055313.GF9729@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.cz>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This is a static checker fix and I don't have a way to test it.  But
from the context it looks like this is a typo where SCABUFSIZE was
intended instead of sizeof(SCABUFSIZE).  SCABUFSIZE is 1024 and
sizeof(int) is 4.  I would suspect this is a bad bug.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/tty/synclinkmp.c b/drivers/tty/synclinkmp.c
index ff17138..dc6e969 100644
--- a/drivers/tty/synclinkmp.c
+++ b/drivers/tty/synclinkmp.c
@@ -3478,7 +3478,7 @@ static int alloc_buf_list(SLMP_INFO *info)
 	for ( i = 0; i < info->rx_buf_count; i++ ) {
 		/* calculate and store physical address of this buffer entry */
 		info->rx_buf_list_ex[i].phys_entry -			info->buffer_list_phys + (i * sizeof(SCABUFSIZE));
+			info->buffer_list_phys + (i * SCABUFSIZE);
 
 		/* calculate and store physical address of */
 		/* next entry in cirular list of entries */
