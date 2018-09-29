From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 29 Sep 2018 09:53:16 +0000
Subject: [PATCH v3 -next] usb: typec: remove set but not used variables 'snk_ma, min_mv'
Message-Id: <1538214796-182488-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/usb/typec/tcpm/tcpm.c: In function 'tcpm_pd_select_pps_apdo':
drivers/usb/typec/tcpm/tcpm.c:2212:39: warning:
 variable 'snk_ma' set but not used [-Wunused-but-set-variable]

drivers/usb/typec/tcpm/tcpm.c: In function 'tcpm_pd_build_pps_request':
drivers/usb/typec/tcpm/tcpm.c:2405:37: warning:
 variable 'min_mv' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
v3: fix patch subject 'flags' -> 'min_mv'
v2: remove the right value of 'snk_ma'
---
 drivers/usb/typec/tcpm/tcpm.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 4f1f421..00a7e67 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -2209,7 +2209,7 @@ static unsigned int tcpm_pd_select_pps_apdo(struct tcpm_port *port)
 {
 	unsigned int i, j, max_mw = 0, max_mv = 0;
 	unsigned int min_src_mv, max_src_mv, src_ma, src_mw;
-	unsigned int min_snk_mv, max_snk_mv, snk_ma;
+	unsigned int min_snk_mv, max_snk_mv;
 	u32 pdo;
 	unsigned int src_pdo = 0, snk_pdo = 0;
 
@@ -2253,8 +2253,6 @@ static unsigned int tcpm_pd_select_pps_apdo(struct tcpm_port *port)
 						pdo_pps_apdo_min_voltage(pdo);
 					max_snk_mv  						pdo_pps_apdo_max_voltage(pdo);
-					snk_ma -						pdo_pps_apdo_max_current(pdo);
 					break;
 				default:
 					tcpm_log(port,
@@ -2402,7 +2400,7 @@ static int tcpm_pd_send_request(struct tcpm_port *port)
 
 static int tcpm_pd_build_pps_request(struct tcpm_port *port, u32 *rdo)
 {
-	unsigned int out_mv, op_ma, op_mw, min_mv, max_mv, max_ma, flags;
+	unsigned int out_mv, op_ma, op_mw, max_mv, max_ma, flags;
 	enum pd_pdo_type type;
 	unsigned int src_pdo_index;
 	u32 pdo;
@@ -2420,7 +2418,6 @@ static int tcpm_pd_build_pps_request(struct tcpm_port *port, u32 *rdo)
 			tcpm_log(port, "Invalid APDO selected!");
 			return -EINVAL;
 		}
-		min_mv = port->pps_data.min_volt;
 		max_mv = port->pps_data.max_volt;
 		max_ma = port->pps_data.max_curr;
 		out_mv = port->pps_data.out_volt;
