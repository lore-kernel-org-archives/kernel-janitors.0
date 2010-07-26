From: Dan Carpenter <error27@gmail.com>
Date: Mon, 26 Jul 2010 07:23:59 +0000
Subject: [patch] caif: handle snprintf() return
Message-Id: <20100726072358.GK26313@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sjur Braendeland <sjur.brandeland@stericsson.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

snprintf() returns the number of bytes that would have been written.  It
can be larger than the size of the buffer.  The current code won't
overflow, but people cut and paste this stuff so lets do it right and
also make the static checkers happy.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/caif/caif_spi.c b/drivers/net/caif/caif_spi.c
index 6c94803..f5058ff 100644
--- a/drivers/net/caif/caif_spi.c
+++ b/drivers/net/caif/caif_spi.c
@@ -165,6 +165,9 @@ static ssize_t dbgfs_state(struct file *file, char __user *user_buf,
 	len += snprintf((buf + len), (DEBUGFS_BUF_SIZE - len),
 			"Next RX len: %d\n", cfspi->rx_npck_len);
 
+	if (len > DEBUGFS_BUF_SIZE)
+		len = DEBUGFS_BUF_SIZE;
+
 	size = simple_read_from_buffer(user_buf, count, ppos, buf, len);
 	kfree(buf);
 
