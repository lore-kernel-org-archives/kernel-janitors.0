From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 13 Oct 2015 12:52:06 +0000
Subject: [patch] misc: mic/scif: re-take a lock on error path
Message-Id: <20151013125206.GA2524@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikhil Rao <nikhil.rao@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sudeep Dutt <sudeep.dutt@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The caller expects that we take this lock again before returning
otherwise it you get double unlocks and races.

Fixes: ba612aa8b487 ('misc: mic: SCIF memory registration and unregistration')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/misc/mic/scif/scif_rma.c b/drivers/misc/mic/scif/scif_rma.c
index e288996..980ef13 100644
--- a/drivers/misc/mic/scif/scif_rma.c
+++ b/drivers/misc/mic/scif/scif_rma.c
@@ -680,6 +680,7 @@ int scif_unregister_window(struct scif_window *window)
 			}
 		} else {
 			/* Return ENXIO since unregistration is in progress */
+			mutex_lock(&ep->rma_info.rma_lock);
 			return -ENXIO;
 		}
 retry:
