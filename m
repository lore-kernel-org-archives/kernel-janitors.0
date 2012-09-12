From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Wed, 12 Sep 2012 17:03:14 +0000
Subject: [PATCH 7/15] drivers/s390/net: removes unnecessary semicolon
Message-Id: <1347469402-27557-7-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ursula Braun <ursula.braun@de.ibm.com>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, Frank Blaschka <blaschka@linux.vnet.ibm.com>, linux390@de.ibm.com, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org

From: Peter Senna Tschudin <peter.senna@gmail.com>

removes unnecessary semicolon

Found by Coccinelle: http://coccinelle.lip6.fr/

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
 drivers/s390/net/ctcm_fsms.c      |    2 +-
 drivers/s390/net/qeth_core_main.c |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/s390/net/ctcm_fsms.c b/drivers/s390/net/ctcm_fsms.c
index d4ade9e..fb92524 100644
--- a/drivers/s390/net/ctcm_fsms.c
+++ b/drivers/s390/net/ctcm_fsms.c
@@ -1523,7 +1523,7 @@ static void ctcmpc_chx_firstio(fsm_instance *fi, int event, void *arg)
 				goto done;
 	default:
 		break;
-	};
+	}
 
 	fsm_newstate(fi, (CHANNEL_DIRECTION(ch->flags) = CTCM_READ)
 		     ? CTC_STATE_RXINIT : CTC_STATE_TXINIT);
diff --git a/drivers/s390/net/qeth_core_main.c b/drivers/s390/net/qeth_core_main.c
index cf6da7f..0bd86b8 100644
--- a/drivers/s390/net/qeth_core_main.c
+++ b/drivers/s390/net/qeth_core_main.c
@@ -489,7 +489,7 @@ static struct qeth_reply *qeth_alloc_reply(struct qeth_card *card)
 		atomic_set(&reply->refcnt, 1);
 		atomic_set(&reply->received, 0);
 		reply->card = card;
-	};
+	}
 	return reply;
 }
 
@@ -2029,7 +2029,7 @@ int qeth_send_control_data(struct qeth_card *card, int len,
 			if (time_after(jiffies, timeout))
 				goto time_err;
 			cpu_relax();
-		};
+		}
 	}
 
 	if (reply->rc = -EIO)

