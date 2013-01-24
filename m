From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Jan 2013 07:06:37 +0000
Subject: [patch] iscsi-target: make some temporary buffers larger
Message-Id: <20130124070637.GE5611@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

My static checker complains because we use sprintf() to print some
unsigned ints into 10 byte buffers.  In theory unsigned ints can take 10
characters and we need another for the terminator.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/target/iscsi/iscsi_target_parameters.c b/drivers/target/iscsi/iscsi_target_parameters.c
index d891642..ca2be40 100644
--- a/drivers/target/iscsi/iscsi_target_parameters.c
+++ b/drivers/target/iscsi/iscsi_target_parameters.c
@@ -1095,11 +1095,11 @@ static int iscsi_check_acceptor_state(struct iscsi_param *param, char *value,
 				SET_PSTATE_REPLY_OPTIONAL(param);
 		}
 	} else if (IS_TYPE_NUMBER(param)) {
-		char *tmpptr, buf[10];
+		char *tmpptr, buf[11];
 		u32 acceptor_value = simple_strtoul(param->value, &tmpptr, 0);
 		u32 proposer_value = simple_strtoul(value, &tmpptr, 0);
 
-		memset(buf, 0, 10);
+		memset(buf, 0, sizeof(buf));
 
 		if (!strcmp(param->name, MAXCONNECTIONS) ||
 		    !strcmp(param->name, MAXBURSTLENGTH) ||
@@ -1503,8 +1503,8 @@ static int iscsi_enforce_integrity_rules(
 			FirstBurstLength = simple_strtoul(param->value,
 					&tmpptr, 0);
 			if (FirstBurstLength > MaxBurstLength) {
-				char tmpbuf[10];
-				memset(tmpbuf, 0, 10);
+				char tmpbuf[11];
+				memset(tmpbuf, 0, sizeof(tmpbuf));
 				sprintf(tmpbuf, "%u", MaxBurstLength);
 				if (iscsi_update_param_value(param, tmpbuf))
 					return -1;
