From: Dan Carpenter <error27@gmail.com>
Date: Fri, 18 Mar 2011 07:12:14 +0000
Subject: [patch 1/2] efivars: memory leak on error in
Message-Id: <20110318071214.GV2008@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Mike Waychison <mikew@google.com>, Chris Wright <chrisw@sous-sol.org>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This is a cut and paste bug.  We intended to free ->del_var and
->new_var but we only free ->new_var.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/firmware/efivars.c b/drivers/firmware/efivars.c
index ff0c373..ff2fe40 100644
--- a/drivers/firmware/efivars.c
+++ b/drivers/firmware/efivars.c
@@ -677,8 +677,8 @@ create_efivars_bin_attributes(struct efivars *efivars)
 
 	return 0;
 out_free:
-	kfree(efivars->new_var);
-	efivars->new_var = NULL;
+	kfree(efivars->del_var);
+	efivars->del_var = NULL;
 	kfree(efivars->new_var);
 	efivars->new_var = NULL;
 	return error;
