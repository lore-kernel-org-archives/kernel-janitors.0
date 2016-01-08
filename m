From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Jan 2016 10:48:51 +0000
Subject: [patch] spi: loopback: fix typo in MODULE_PARM_DESC
Message-Id: <20160108104851.GA32195@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Sperl <kernel@martin.sperl.org>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org

There should be an 's' on "dump_message" so it matches the module_param.

Fixes: 84e0c4e5e2c4 ('spi: add loopback test driver to allow for spi_master regression tests')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/spi/spi-loopback-test.c b/drivers/spi/spi-loopback-test.c
index 7f497ac..0a49b01 100644
--- a/drivers/spi/spi-loopback-test.c
+++ b/drivers/spi/spi-loopback-test.c
@@ -37,7 +37,7 @@ MODULE_PARM_DESC(simulate_only, "if not 0 do not execute the spi message");
 /* dump spi messages */
 int dump_messages;
 module_param(dump_messages, int, 0);
-MODULE_PARM_DESC(dump_message,
+MODULE_PARM_DESC(dump_messages,
 		 "=1 dump the basic spi_message_structure, " \
 		 "=2 dump the spi_message_structure including data, " \
 		 "=3 dump the spi_message structure before and after execution");
