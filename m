From: Julia Lawall <julia.lawall@lip6.fr>
Date: Wed, 15 Aug 2012 14:53:09 +0000
Subject: Re: [PATCH 2/5] drivers/scsi/bnx2fc/bnx2fc_io.c: Remove potential NULL dereference
Message-Id: <alpine.DEB.2.02.1208151652300.2113@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344959388-19719-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1344959388-19719-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

If the NULL test is necessary, the initialization involving a dereference of
the tested value should be moved after the NULL test.

Moved the initialization of rport as well, to improve readability.

The sematic patch that fixes the first problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
type T;
expression E;
identifier i,fld;
statement S;
@@

- T i = E->fld;
+ T i;
   ... when != E
       when != i
   if (E = NULL) S
+ i = E->fld;
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
v2: moved the initialization of rport.

  drivers/scsi/bnx2fc/bnx2fc_io.c |    6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/bnx2fc/bnx2fc_io.c b/drivers/scsi/bnx2fc/bnx2fc_io.c
index 73f231c..2e8cf79 100644
--- a/drivers/scsi/bnx2fc/bnx2fc_io.c
+++ b/drivers/scsi/bnx2fc/bnx2fc_io.c
@@ -685,8 +685,8 @@ int bnx2fc_init_mp_req(struct bnx2fc_cmd *io_req)
  static int bnx2fc_initiate_tmf(struct scsi_cmnd *sc_cmd, u8 tm_flags)
  {
  	struct fc_lport *lport;
-	struct fc_rport *rport = starget_to_rport(scsi_target(sc_cmd->device));
-	struct fc_rport_libfc_priv *rp = rport->dd_data;
+	struct fc_rport *rport;
+	struct fc_rport_libfc_priv *rp;
  	struct fcoe_port *port;
  	struct bnx2fc_interface *interface;
  	struct bnx2fc_rport *tgt;
@@ -704,6 +704,7 @@ static int bnx2fc_initiate_tmf(struct scsi_cmnd *sc_cmd, u8 tm_flags)
  	unsigned long start = jiffies;

  	lport = shost_priv(host);
+	rport = starget_to_rport(scsi_target(sc_cmd->device));
  	port = lport_priv(lport);
  	interface = port->priv;

@@ -712,6 +713,7 @@ static int bnx2fc_initiate_tmf(struct scsi_cmnd *sc_cmd, u8 tm_flags)
  		rc = FAILED;
  		goto tmf_err;
  	}
+	rp = rport->dd_data;

  	rc = fc_block_scsi_eh(sc_cmd);
  	if (rc)
