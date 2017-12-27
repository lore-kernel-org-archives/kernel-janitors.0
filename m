From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 27 Dec 2017 14:51:36 +0000
Subject: [PATCH 03/12] net: dccp: drop unneeded newline
Message-Id: <1514386305-7402-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1514386305-7402-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1514386305-7402-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gerrit Renker <gerrit@erg.abdn.ac.uk>
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, dccp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

DCCP_CRIT prints some other text and then a newline after the message
string, so the message string does not need to include a newline
explicitly.  Done using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 net/dccp/ackvec.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/dccp/ackvec.c b/net/dccp/ackvec.c
index 3de0d03..2a24f7d 100644
--- a/net/dccp/ackvec.c
+++ b/net/dccp/ackvec.c
@@ -228,7 +228,7 @@ static void dccp_ackvec_add_new(struct dccp_ackvec *av, u32 num_packets,
 	}
 
 	if (num_cells + dccp_ackvec_buflen(av) >= DCCPAV_MAX_ACKVEC_LEN) {
-		DCCP_CRIT("Ack Vector buffer overflow: dropping old entries\n");
+		DCCP_CRIT("Ack Vector buffer overflow: dropping old entries");
 		av->av_overflow = true;
 	}
 

