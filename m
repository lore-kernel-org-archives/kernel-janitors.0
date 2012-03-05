From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 05 Mar 2012 18:07:11 +0000
Subject: [patch v2] tty: cyclades: TIOCSERGETLSR should should store to a uint
Message-Id: <20120305180711.GB26880@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <4F511DAD.1060108@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Slaby <jslaby@suse.cz>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

TIOCSERGETLSR should be saved in a uint so the cast here to unsigned
long is a bug.

Reported-by: Jiri Slaby <jslaby@suse.cz>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: completely different from v1.

diff --git a/drivers/tty/cyclades.c b/drivers/tty/cyclades.c
index c9bf779..5575fee 100644
--- a/drivers/tty/cyclades.c
+++ b/drivers/tty/cyclades.c
@@ -2413,7 +2413,7 @@ static int get_lsr_info(struct cyclades_port *info, unsigned int __user *value)
 		/* Not supported yet */
 		return -EINVAL;
 	}
-	return put_user(result, (unsigned long __user *)value);
+	return put_user(result, value);
 }
 
 static int cy_tiocmget(struct tty_struct *tty)
