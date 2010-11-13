From: Dan Carpenter <error27@gmail.com>
Date: Sat, 13 Nov 2010 08:24:22 +0000
Subject: [patch] Staging: bcm: signedness bug in
Message-Id: <20101113082422.GK3533@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

status is used to store negative error codes throughout.  The only place
where this is a runtime bug is if create_worker_threads() fails. 

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/bcm/Misc.c b/drivers/staging/bcm/Misc.c
index 1bb6a1d..440b9cd 100644
--- a/drivers/staging/bcm/Misc.c
+++ b/drivers/staging/bcm/Misc.c
@@ -1079,7 +1079,7 @@ int run_card_proc(PMINI_ADAPTER ps_adapter )
 int InitCardAndDownloadFirmware(PMINI_ADAPTER ps_adapter)
 {
 
-	UINT status = STATUS_SUCCESS;
+	int status;
 	UINT value = 0;
 	/*
  	 * Create the threads first and then download the
