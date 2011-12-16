From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 16 Dec 2011 20:25:29 +0000
Subject: [patch 1/2] NFC: double unlock in nfc_llcp_recv_connect()
Message-Id: <20111216202529.GA18570@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lauro Ramos Venancio <lauro.venancio@openbossa.org>
Cc: Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, Samuel Ortiz <sameo@linux.intel.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

We unlock inside the if block on the other side of this if else
statement.  It could result in calling mutex_unlock() twice.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/nfc/llcp/llcp.c b/net/nfc/llcp/llcp.c
index 67756b2..f99d6b4 100644
--- a/net/nfc/llcp/llcp.c
+++ b/net/nfc/llcp/llcp.c
@@ -554,11 +554,9 @@ static void nfc_llcp_recv_connect(struct nfc_llcp_local *local,
 				goto enqueue;
 			}
 		}
-
+		mutex_unlock(&local->socket_lock);
 	}
 
-	mutex_unlock(&local->socket_lock);
-
 	reason = LLCP_DM_NOBOUND;
 	goto fail;
 
