From: Dan Carpenter <error27@gmail.com>
Date: Fri, 18 Mar 2011 07:12:38 +0000
Subject: [patch 2/2] efivars: handle errors from register_efivars()
Message-Id: <20110318071238.GW2008@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Mike Waychison <mikew@google.com>, Chris Wright <chrisw@sous-sol.org>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We should unwind and return an error if register_efivars() fails.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/firmware/efivars.c b/drivers/firmware/efivars.c
index ff2fe40..5d1ec68 100644
--- a/drivers/firmware/efivars.c
+++ b/drivers/firmware/efivars.c
@@ -803,6 +803,8 @@ efivars_init(void)
 	ops.set_variable = efi.set_variable;
 	ops.get_next_variable = efi.get_next_variable;
 	error = register_efivars(&__efivars, &ops, efi_kobj);
+	if (error)
+		goto err_put;
 
 	/* Don't forget the systab entry */
 	error = sysfs_create_group(efi_kobj, &efi_subsys_attr_group);
@@ -810,10 +812,15 @@ efivars_init(void)
 		printk(KERN_ERR
 		       "efivars: Sysfs attribute export failed with error %d.\n",
 		       error);
-		unregister_efivars(&__efivars);
-		kobject_put(efi_kobj);
+		goto err_unregister;
 	}
 
+	return 0;
+
+err_unregister:
+	unregister_efivars(&__efivars);
+err_put:
+	kobject_put(efi_kobj);
 	return error;
 }
 
