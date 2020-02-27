From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 27 Feb 2020 16:19:54 +0000
Subject: [PATCH] tee: amdtee: out of bounds read in find_session()
Message-Id: <20200227161954.fo7pbbgomdjkraxq@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Wiklander <jens.wiklander@linaro.org>, Rijo Thomas <Rijo-john.Thomas@amd.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Devaraj Rangasamy <Devaraj.Rangasamy@amd.com>, tee-dev@lists.linaro.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The "index" is a user provided value from 0-USHRT_MAX.  If it's over
TEE_NUM_SESSIONS (31) then it results in an out of bounds read when we
call test_bit(index, sess->sess_mask).

Fixes: 757cc3e9ff1d ("tee: add AMD-TEE driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/tee/amdtee/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/tee/amdtee/core.c b/drivers/tee/amdtee/core.c
index 6370bb55f512..dbc238c7c263 100644
--- a/drivers/tee/amdtee/core.c
+++ b/drivers/tee/amdtee/core.c
@@ -139,6 +139,9 @@ static struct amdtee_session *find_session(struct amdtee_context_data *ctxdata,
 	u32 index = get_session_index(session);
 	struct amdtee_session *sess;
 
+	if (index >= TEE_NUM_SESSIONS)
+		return NULL;
+
 	list_for_each_entry(sess, &ctxdata->sess_list, list_node)
 		if (ta_handle = sess->ta_handle &&
 		    test_bit(index, sess->sess_mask))
-- 
2.11.0
