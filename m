From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Oct 2012 08:22:48 +0000
Subject: [patch] target/iscsi: precedence bug in iscsit_set_dataout_sequence_values()
Message-Id: <20121002082248.GB12398@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: Andy Grover <agrover@redhat.com>, Christoph Hellwig <hch@lst.de>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

Clang warns about this bug:
drivers/target/iscsi/iscsi_target_erl0.c:52:45: warning: operator '?:'
	has lower precedence than '+'; '+' will be evaluated first
	[-Wparentheses]

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Please review this very carefully because I haven't tested it.  It could
be that the check should be:
(data_done + data_length > FirstBurstLength) ? FirstBurstLength : data_length);
Instead of what I have which is:
data_done + (data_length > FirstBurstLength ? FirstBurstLength : data_length);

diff --git a/drivers/target/iscsi/iscsi_target_erl0.c b/drivers/target/iscsi/iscsi_target_erl0.c
index 1a02016..2067efd 100644
--- a/drivers/target/iscsi/iscsi_target_erl0.c
+++ b/drivers/target/iscsi/iscsi_target_erl0.c
@@ -48,9 +48,9 @@ void iscsit_set_dataout_sequence_values(
 	if (cmd->unsolicited_data) {
 		cmd->seq_start_offset = cmd->write_data_done;
 		cmd->seq_end_offset = (cmd->write_data_done +
-			(cmd->se_cmd.data_length >
-			 conn->sess->sess_ops->FirstBurstLength) ?
-			conn->sess->sess_ops->FirstBurstLength : cmd->se_cmd.data_length);
+			((cmd->se_cmd.data_length >
+			  conn->sess->sess_ops->FirstBurstLength) ?
+			 conn->sess->sess_ops->FirstBurstLength : cmd->se_cmd.data_length));
 		return;
 	}
 
