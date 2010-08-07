From: Dan Carpenter <error27@gmail.com>
Date: Sat, 07 Aug 2010 22:13:58 +0000
Subject: [patch] bfa: dereferencing before testing
Message-Id: <20100807221358.GB9031@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jing Huang <huangj@brocade.com>
Cc: "James E.J. Bottomley" <James.Bottomley@suse.de>, Krishna Gudipati <kgudipat@brocade.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

I moved the dereference of "port" after the check to verify it was
non-NULL.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/scsi/bfa/lport_api.c b/drivers/scsi/bfa/lport_api.c
index 72b3f50..5cd356a 100644
--- a/drivers/scsi/bfa/lport_api.c
+++ b/drivers/scsi/bfa/lport_api.c
@@ -149,11 +149,12 @@ bfa_fcs_port_get_rport_max_speed(struct bfa_fcs_port_s *port)
 	enum bfa_pport_speed max_speed = 0;
 	struct bfa_pport_attr_s pport_attr;
 	enum bfa_pport_speed pport_speed, rport_speed;
-	bfa_boolean_t     trl_enabled = bfa_fcport_is_ratelim(port->fcs->bfa);
+	bfa_boolean_t trl_enabled;
 
 	if (port = NULL)
 		return 0;
 
+	trl_enabled = bfa_fcport_is_ratelim(port->fcs->bfa);
 	fcs = port->fcs;
 
 	/*
