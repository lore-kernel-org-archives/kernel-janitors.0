From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Mon, 17 Dec 2007 02:36:05 +0000
Subject: [PATCH 3/3] ipc: Convert handmade 'min' to min().
Message-Id: <20071217023605.24944.67698.sendpatchset@thinktank.campus.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20071217023555.24944.62155.sendpatchset@thinktank.campus.ltu.se>
In-Reply-To: <20071217023555.24944.62155.sendpatchset@thinktank.campus.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Richard Knutsson <ricknu-0@student.ltu.se>

Convert handmade 'min' to min().

Signed-off-by: Richard Knutsson <ricknu-0@student.ltu.se>
---
Dependent on 'msg->m_ts' being changed from int to size_t.


diff --git a/ipc/msg.c b/ipc/msg.c
index fdf3db5..74d0709 100644
--- a/ipc/msg.c
+++ b/ipc/msg.c
@@ -920,7 +920,7 @@ out_unlock:
 	if (IS_ERR(msg))
 		return PTR_ERR(msg);
 
-	msgsz = (msgsz > msg->m_ts) ? msg->m_ts : msgsz;
+	msgsz = min(msgsz, msg->m_ts);
 	*pmtype = msg->m_type;
 	if (store_msg(mtext, msg, msgsz))
 		msgsz = -EFAULT;
