From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 29 Aug 2015 17:30:12 +0000
Subject: [PATCH 8/8] staging: lustre: put constant on the right of binary operator
Message-Id: <1440869412-4899-9-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1440869412-4899-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1440869412-4899-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: joe@perches.com, kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Move constants to the right of binary operators.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
constant c;
expression e;
binary operator b = {=,!=,&,|};
@@

(
- c
+ e
b
- e
+ c
|
- c < e
+ e > c
)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/ptlrpc/client.c       |    2 +-
 drivers/staging/lustre/lustre/ptlrpc/import.c       |   10 +++++-----
 drivers/staging/lustre/lustre/ptlrpc/pack_generic.c |    2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/lustre/lustre/ptlrpc/pack_generic.c b/drivers/staging/lustre/lustre/ptlrpc/pack_generic.c
index 84937ad..e9f8aa0 100644
--- a/drivers/staging/lustre/lustre/ptlrpc/pack_generic.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/pack_generic.c
@@ -883,7 +883,7 @@ void lustre_msg_clear_flags(struct lustre_msg *msg, int flags)
 	case LUSTRE_MSG_MAGIC_V2: {
 		struct ptlrpc_body *pb = lustre_msg_ptlrpc_body(msg);
 		LASSERTF(pb, "invalid msg %p: no ptlrpc body!\n", msg);
-		pb->pb_flags &= ~(MSG_GEN_FLAG_MASK & flags);
+		pb->pb_flags &= ~(flags & MSG_GEN_FLAG_MASK);
 		return;
 	}
 	default:
diff --git a/drivers/staging/lustre/lustre/ptlrpc/import.c b/drivers/staging/lustre/lustre/ptlrpc/import.c
index 1eae389..6c00748 100644
--- a/drivers/staging/lustre/lustre/ptlrpc/import.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/import.c
@@ -906,7 +906,7 @@ static int ptlrpc_connect_interpret(const struct lu_env *env,
 	}
 
 	/* Determine what recovery state to move the import to. */
-	if (MSG_CONNECT_RECONNECT & msg_flags) {
+	if (msg_flags & MSG_CONNECT_RECONNECT) {
 		memset(&old_hdl, 0, sizeof(old_hdl));
 		if (!memcmp(&old_hdl, lustre_msg_get_handle(request->rq_repmsg),
 			    sizeof(old_hdl))) {
@@ -931,7 +931,7 @@ static int ptlrpc_connect_interpret(const struct lu_env *env,
 			 * eviction. If it is in recovery - we are safe to
 			 * participate since we can reestablish all of our state
 			 * with server again */
-			if ((MSG_CONNECT_RECOVERING & msg_flags)) {
+			if ((msg_flags & MSG_CONNECT_RECOVERING)) {
 				CDEBUG(level, "%s@%s changed server handle from %#llx to %#llx but is still in recovery\n",
 				       obd2cli_tgt(imp->imp_obd),
 				       imp->imp_connection->c_remote_uuid.uuid,
@@ -952,7 +952,7 @@ static int ptlrpc_connect_interpret(const struct lu_env *env,
 			imp->imp_remote_handle  				     *lustre_msg_get_handle(request->rq_repmsg);
 
-			if (!(MSG_CONNECT_RECOVERING & msg_flags)) {
+			if (!(msg_flags & MSG_CONNECT_RECOVERING)) {
 				IMPORT_SET_STATE(imp, LUSTRE_IMP_EVICTED);
 				rc = 0;
 				goto finish;
@@ -968,7 +968,7 @@ static int ptlrpc_connect_interpret(const struct lu_env *env,
 			CDEBUG(D_HA, "%s: reconnected but import is invalid; marking evicted\n",
 			       imp->imp_obd->obd_name);
 			IMPORT_SET_STATE(imp, LUSTRE_IMP_EVICTED);
-		} else if (MSG_CONNECT_RECOVERING & msg_flags) {
+		} else if (msg_flags & MSG_CONNECT_RECOVERING) {
 			CDEBUG(D_HA, "%s: reconnected to %s during replay\n",
 			       imp->imp_obd->obd_name,
 			       obd2cli_tgt(imp->imp_obd));
@@ -981,7 +981,7 @@ static int ptlrpc_connect_interpret(const struct lu_env *env,
 		} else {
 			IMPORT_SET_STATE(imp, LUSTRE_IMP_RECOVER);
 		}
-	} else if ((MSG_CONNECT_RECOVERING & msg_flags) && !imp->imp_invalid) {
+	} else if ((msg_flags & MSG_CONNECT_RECOVERING) && !imp->imp_invalid) {
 		LASSERT(imp->imp_replayable);
 		imp->imp_remote_handle  				*lustre_msg_get_handle(request->rq_repmsg);
diff --git a/drivers/staging/lustre/lustre/ptlrpc/client.c b/drivers/staging/lustre/lustre/ptlrpc/client.c
index c83a34a..865c8a2 100644
--- a/drivers/staging/lustre/lustre/ptlrpc/client.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/client.c
@@ -2954,7 +2954,7 @@ void ptlrpc_init_xid(void)
 	}
 
 	/* Always need to be aligned to a power-of-two for multi-bulk BRW */
-	CLASSERT((PTLRPC_BULK_OPS_COUNT & (PTLRPC_BULK_OPS_COUNT - 1)) = 0);
+	CLASSERT(((PTLRPC_BULK_OPS_COUNT - 1) & PTLRPC_BULK_OPS_COUNT) = 0);
 	ptlrpc_last_xid &= PTLRPC_BULK_OPS_MASK;
 }
 

