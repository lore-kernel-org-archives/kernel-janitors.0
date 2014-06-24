From: Emil Goode <emilgoode@gmail.com>
Date: Tue, 24 Jun 2014 21:42:28 +0000
Subject: [PATCH 2/2] [media] Cleanup line > 80 character violations
Message-Id: <1403646148-25385-2-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1403646148-25385-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1403646148-25385-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <m.chehab@samsung.com>, Jiri Kosina <jkosina@suse.cz>, Hans Verkuil <hans.verkuil@cisco.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

This cleans up some line over 80 character violations.

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/media/dvb-frontends/stb6100_cfg.h |   12 ++++++++----
 drivers/media/dvb-frontends/tda8261_cfg.h |    9 ++++++---
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/media/dvb-frontends/stb6100_cfg.h b/drivers/media/dvb-frontends/stb6100_cfg.h
index 0e10ad89..6edc153 100644
--- a/drivers/media/dvb-frontends/stb6100_cfg.h
+++ b/drivers/media/dvb-frontends/stb6100_cfg.h
@@ -27,7 +27,8 @@ static int stb6100_get_frequency(struct dvb_frontend *fe, u32 *frequency)
 	int err = 0;
 
 	if (tuner_ops->get_state) {
-		if ((err = tuner_ops->get_state(fe, DVBFE_TUNER_FREQUENCY, &t_state)) < 0) {
+		err = tuner_ops->get_state(fe, DVBFE_TUNER_FREQUENCY, &t_state);
+		if (err < 0) {
 			printk("%s: Invalid parameter\n", __func__);
 			return err;
 		}
@@ -46,7 +47,8 @@ static int stb6100_set_frequency(struct dvb_frontend *fe, u32 frequency)
 	t_state.frequency = frequency;
 
 	if (tuner_ops->set_state) {
-		if ((err = tuner_ops->set_state(fe, DVBFE_TUNER_FREQUENCY, &t_state)) < 0) {
+		err = tuner_ops->set_state(fe, DVBFE_TUNER_FREQUENCY, &t_state);
+		if (err < 0) {
 			printk("%s: Invalid parameter\n", __func__);
 			return err;
 		}
@@ -62,7 +64,8 @@ static int stb6100_get_bandwidth(struct dvb_frontend *fe, u32 *bandwidth)
 	int err = 0;
 
 	if (tuner_ops->get_state) {
-		if ((err = tuner_ops->get_state(fe, DVBFE_TUNER_BANDWIDTH, &t_state)) < 0) {
+		err = tuner_ops->get_state(fe, DVBFE_TUNER_BANDWIDTH, &t_state);
+		if (err < 0) {
 			printk("%s: Invalid parameter\n", __func__);
 			return err;
 		}
@@ -81,7 +84,8 @@ static int stb6100_set_bandwidth(struct dvb_frontend *fe, u32 bandwidth)
 	t_state.bandwidth = bandwidth;
 
 	if (tuner_ops->set_state) {
-		if ((err = tuner_ops->set_state(fe, DVBFE_TUNER_BANDWIDTH, &t_state)) < 0) {
+		err = tuner_ops->set_state(fe, DVBFE_TUNER_BANDWIDTH, &t_state);
+		if (err < 0) {
 			printk("%s: Invalid parameter\n", __func__);
 			return err;
 		}
diff --git a/drivers/media/dvb-frontends/tda8261_cfg.h b/drivers/media/dvb-frontends/tda8261_cfg.h
index 7de65c3..04a19e1 100644
--- a/drivers/media/dvb-frontends/tda8261_cfg.h
+++ b/drivers/media/dvb-frontends/tda8261_cfg.h
@@ -25,7 +25,8 @@ static int tda8261_get_frequency(struct dvb_frontend *fe, u32 *frequency)
 	int err = 0;
 
 	if (tuner_ops->get_state) {
-		if ((err = tuner_ops->get_state(fe, DVBFE_TUNER_FREQUENCY, &t_state)) < 0) {
+		err = tuner_ops->get_state(fe, DVBFE_TUNER_FREQUENCY, &t_state);
+		if (err < 0) {
 			printk("%s: Invalid parameter\n", __func__);
 			return err;
 		}
@@ -45,7 +46,8 @@ static int tda8261_set_frequency(struct dvb_frontend *fe, u32 frequency)
 	t_state.frequency = frequency;
 
 	if (tuner_ops->set_state) {
-		if ((err = tuner_ops->set_state(fe, DVBFE_TUNER_FREQUENCY, &t_state)) < 0) {
+		err = tuner_ops->set_state(fe, DVBFE_TUNER_FREQUENCY, &t_state);
+		if (err < 0) {
 			printk("%s: Invalid parameter\n", __func__);
 			return err;
 		}
@@ -62,7 +64,8 @@ static int tda8261_get_bandwidth(struct dvb_frontend *fe, u32 *bandwidth)
 	int err = 0;
 
 	if (tuner_ops->get_state) {
-		if ((err = tuner_ops->get_state(fe, DVBFE_TUNER_BANDWIDTH, &t_state)) < 0) {
+		err = tuner_ops->get_state(fe, DVBFE_TUNER_BANDWIDTH, &t_state);
+		if (err < 0) {
 			printk("%s: Invalid parameter\n", __func__);
 			return err;
 		}
-- 
1.7.10.4

