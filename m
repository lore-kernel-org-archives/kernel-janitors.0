From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 15 Jan 2019 03:17:19 +0000
Subject: [PATCH -next] [SCSI] bfa: Remove set but not used variable 'adisc'
Message-Id: <1547522239-54986-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/scsi/bfa/bfa_fcs_rport.c: In function 'bfa_fcs_rport_process_adisc':
drivers/scsi/bfa/bfa_fcs_rport.c:2251:21: warning:
 variable 'adisc' set but not used [-Wunused-but-set-variable]
  struct fc_adisc_s *adisc;
                     ^

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/bfa/bfa_fcs_rport.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/scsi/bfa/bfa_fcs_rport.c b/drivers/scsi/bfa/bfa_fcs_rport.c
index 1e400f2..d6de10a 100644
--- a/drivers/scsi/bfa/bfa_fcs_rport.c
+++ b/drivers/scsi/bfa/bfa_fcs_rport.c
@@ -2248,15 +2248,12 @@ static void	bfa_fcs_rport_sm_delete_pending(struct bfa_fcs_rport_s *rport,
 	struct bfa_fcxp_s *fcxp;
 	struct fchs_s	fchs;
 	struct bfa_fcs_lport_s *port = rport->port;
-	struct fc_adisc_s	*adisc;
 
 	bfa_trc(port->fcs, rx_fchs->s_id);
 	bfa_trc(port->fcs, rx_fchs->d_id);
 
 	rport->stats.adisc_rcvd++;
 
-	adisc = (struct fc_adisc_s *) (rx_fchs + 1);
-
 	/*
 	 * Accept if the itnim for this rport is online.
 	 * Else reject the ADISC.
