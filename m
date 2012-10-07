From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 07 Oct 2012 15:38:31 +0000
Subject: [PATCH 1/13] include/linux/i2c.h: introduce macros for i2c_msg initialization
Message-Id: <1349624323-15584-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1349624323-15584-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1349624323-15584-1-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, shubhrajyoti-l0cyMroinI0@public.gmane.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

This patch introduces some macros for describing how an i2c_msg is being
initialized.  There are three macros: I2C_MSG_READ, for a read message,
I2C_MSG_WRITE, for a write message, and I2C_MSG_OP, for some other kind of
message, which is expected to be very rarely used.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 include/linux/i2c.h |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 94aed0c..885ebea 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -556,6 +556,12 @@ struct i2c_msg {
 	__u8 *buf;		/* pointer to msg data			*/
 };
 
+#define I2C_MSG_OP(_addr, _buf, _len, _flags) \
+	{ .addr = _addr, .buf = _buf, .len = _len, .flags = _flags }
+
+#define I2C_MSG_WRITE(addr, buf, len) I2C_MSG_OP(addr, buf, len, 0)
+#define I2C_MSG_READ(addr, buf, len)  I2C_MSG_OP(addr, buf, len, I2C_M_RD)
+
 /* To determine what functionality is present */
 
 #define I2C_FUNC_I2C			0x00000001
