From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Mon, 17 Dec 2007 02:36:00 +0000
Subject: [PATCH 2/3] msg.h: Convert m_ts from int to size_t.
Message-Id: <20071217023600.24944.84644.sendpatchset@thinktank.campus.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20071217023555.24944.62155.sendpatchset@thinktank.campus.ltu.se>
In-Reply-To: <20071217023555.24944.62155.sendpatchset@thinktank.campus.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Richard Knutsson <ricknu-0@student.ltu.se>

Convert m_ts ("message text size") from int to size_t.

Signed-off-by: Richard Knutsson <ricknu-0@student.ltu.se>
---
Remove some trailing spaces, since we are in the neighborhood.


diff --git a/include/linux/msg.h b/include/linux/msg.h
index 10a3d5a..7a61952 100644
--- a/include/linux/msg.h
+++ b/include/linux/msg.h
@@ -67,8 +67,8 @@ struct msginfo {
 /* one msg_msg structure for each message */
 struct msg_msg {
 	struct list_head m_list; 
-	long  m_type;          
-	int m_ts;           /* message text size */
+	long  m_type;
+	size_t m_ts;           /* message text size */
 	struct msg_msgseg* next;
 	void *security;
 	/* the actual message follows immediately */
