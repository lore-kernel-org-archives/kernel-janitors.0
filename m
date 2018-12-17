From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 17 Dec 2018 07:08:54 +0000
Subject: [PATCH] staging: bcm2835-audio: double free in init error path
Message-Id: <20181217070854.GG12159@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We free instance here and in the caller.  It should be only the caller
which handles it.

Fixes: d7ca3a71545b ("staging: bcm2835-audio: Operate non-atomic PCM ops")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
index 0db412fd7c55..c0debdbce26c 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
@@ -138,7 +138,6 @@ vc_vchi_audio_init(VCHI_INSTANCE_T vchi_instance,
 		dev_err(instance->dev,
 			"failed to open VCHI service connection (status=%d)\n",
 			status);
-		kfree(instance);
 		return -EPERM;
 	}
 
-- 
2.17.1
