From: "Manish Katiyar" <mkatiyar@gmail.com>
Date: Thu, 15 Jan 2009 16:57:44 +0000
Subject: [PATCH] : Fix compilation errors in drivers/media/video/cx88/cx88-i2c.c
Message-Id: <ea11fea30901150845o415c7b0dt21c325d0220e12@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Below patch fixes the following build errors.

  CC [M]  drivers/media/video/cx88/cx88-i2c.o
drivers/media/video/cx88/cx88-i2c.c: In function 'cx88_call_i2c_clients':
drivers/media/video/cx88/cx88-i2c.c:122: error: 'struct cx88_core' has
no member named 'gate_ctrl'
drivers/media/video/cx88/cx88-i2c.c:123: error: 'struct cx88_core' has
no member named 'gate_ctrl'
drivers/media/video/cx88/cx88-i2c.c:127: error: 'struct cx88_core' has
no member named 'gate_ctrl'
drivers/media/video/cx88/cx88-i2c.c:128: error: 'struct cx88_core' has
no member named 'gate_ctrl'
make[4]: *** [drivers/media/video/cx88/cx88-i2c.o] Error 1
make[3]: *** [drivers/media/video/cx88] Error 2



Signed-off-by: Manish Katiyar <mkatiyar@gmail.com>
---
 drivers/media/video/cx88/cx88-i2c.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/drivers/media/video/cx88/cx88-i2c.c
b/drivers/media/video/cx88/cx88-i2c.c
index c0ff230..6d04b6a 100644
--- a/drivers/media/video/cx88/cx88-i2c.c
+++ b/drivers/media/video/cx88/cx88-i2c.c
@@ -119,13 +119,17 @@ void cx88_call_i2c_clients(struct cx88_core
*core, unsigned int cmd, void *arg)
 	if (0 != core->i2c_rc)
 		return;

+#if defined(CONFIG_VIDEO_CX88_DVB) || defined(CONFIG_VIDEO_CX88_DVB_MODULE)
 	if (core->gate_ctrl)
 		core->gate_ctrl(core, 1);
+#endif

-	i2c_clients_command(&core->i2c_adap, cmd, arg);

+	i2c_clients_command(&core->i2c_adap, cmd, arg);
+#if defined(CONFIG_VIDEO_CX88_DVB) || defined(CONFIG_VIDEO_CX88_DVB_MODULE)
 	if (core->gate_ctrl)
 		core->gate_ctrl(core, 0);
+#endif
 }

 static const struct i2c_algo_bit_data cx8800_i2c_algo_template = {
-- 
1.5.4.3


Thanks -
Manish
