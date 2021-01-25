From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 25 Jan 2021 08:17:48 +0000
Subject: [PATCH] printk: rectify kernel-doc for prb_rec_init_wr()
Message-Id: <20210125081748.19903-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, John Ogness <john.ogness@linutronix.de>, linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

The command 'find ./kernel/printk/ | xargs ./scripts/kernel-doc -none'
reported a mismatch with the kernel-doc of prb_rec_init_wr().

Rectify the kernel-doc, such that no issues remain for ./kernel/printk/.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on v5.11-rc5 and next-20210122

John, please ack.
Petr, please pick this minor typo fixup.

 kernel/printk/printk_ringbuffer.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/printk/printk_ringbuffer.h b/kernel/printk/printk_ringbuffer.h
index 5dc9d022db07..73cc80e01cef 100644
--- a/kernel/printk/printk_ringbuffer.h
+++ b/kernel/printk/printk_ringbuffer.h
@@ -287,7 +287,7 @@ _DEFINE_PRINTKRB(name, descbits, avgtextbits, &_##name##_text[0])
 /* Writer Interface */
 
 /**
- * prb_rec_init_wd() - Initialize a buffer for writing records.
+ * prb_rec_init_wr() - Initialize a buffer for writing records.
  *
  * @r:             The record to initialize.
  * @text_buf_size: The needed text buffer size.
-- 
2.17.1
