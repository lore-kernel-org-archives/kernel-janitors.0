From: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Tue, 23 Oct 2012 19:57:13 +0000
Subject: [PATCH 10/23] dvb-usb/friio-fe: Replace memcpy with struct assignment
Message-Id: <1351022246-8201-10-git-send-email-elezegarcia@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351022246-8201-1-git-send-email-elezegarcia@gmail.com>
In-Reply-To: <1351022246-8201-1-git-send-email-elezegarcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: Julia.Lawall@lip6.fr, kernel-janitors@vger.kernel.org, Ezequiel Garcia <elezegarcia@gmail.com>, Peter Senna Tschudin <peter.senna@gmail.com>

This kind of memcpy() is error-prone. Its replacement with a struct
assignment is prefered because it's type-safe and much easier to read.

Found by coccinelle. Hand patched and reviewed.
Tested by compilation only.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier struct_name;
struct struct_name to;
struct struct_name from;
expression E;
@@
-memcpy(&(to), &(from), E);
+to = from;
// </smpl>

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
---
 drivers/media/usb/dvb-usb/friio-fe.c |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/friio-fe.c b/drivers/media/usb/dvb-usb/friio-fe.c
index 90a70c6..d56f927 100644
--- a/drivers/media/usb/dvb-usb/friio-fe.c
+++ b/drivers/media/usb/dvb-usb/friio-fe.c
@@ -421,11 +421,10 @@ struct dvb_frontend *jdvbt90502_attach(struct dvb_usb_device *d)
 
 	/* setup the state */
 	state->i2c = &d->i2c_adap;
-	memcpy(&state->config, &friio_fe_config, sizeof(friio_fe_config));
+	state->config = friio_fe_config;
 
 	/* create dvb_frontend */
-	memcpy(&state->frontend.ops, &jdvbt90502_ops,
-	       sizeof(jdvbt90502_ops));
+	state->frontend.ops = jdvbt90502_ops;
 	state->frontend.demodulator_priv = state;
 
 	if (jdvbt90502_init(&state->frontend) < 0)
-- 
1.7.4.4

