From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Tue, 18 Sep 2012 17:10:44 +0000
Subject: [PATCH 2/3] net/openvswitch/vport.c: Remove unecessary semicolon
Message-Id: <1347988245-31413-2-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1347988245-31413-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1347988245-31413-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jesse@nicira.com
Cc: davem@davemloft.net, dev@openvswitch.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, trivial@kernel.org, Peter Senna Tschudin <peter.senna@gmail.com>

Found by http://coccinelle.lip6.fr/

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
---
 net/openvswitch/vport.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/openvswitch/vport.c b/net/openvswitch/vport.c
index 9055dd6..03779e8 100644
--- a/net/openvswitch/vport.c
+++ b/net/openvswitch/vport.c
@@ -398,7 +398,7 @@ void ovs_vport_record_error(struct vport *vport, enum vport_err_type err_type)
 	case VPORT_E_TX_ERROR:
 		vport->err_stats.tx_errors++;
 		break;
-	};
+	}
 
 	spin_unlock(&vport->stats_lock);
 }
-- 
1.7.11.4

