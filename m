From: Domen Puncer <domen@coderock.org>
Date: Sat, 26 Jun 2004 15:44:48 +0000
Subject: [Kernel-janitors] Lets update our TODO
Message-Id: <20040626154447.GB1706@masina>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============27089847691585645=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============27089847691585645==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

It's terrible, please help updating it.
(It can be a real PITA, when someone new comes, and can't pick any real
 work from TODO)


Changes:
register_reboot_notifier() always returns 0
skb_alloc doesn't exist
there is no get_free_pages() (replace it with __get_free_page[s]?())
init_etherdev() doesn't exist
ips, ip2main look bogus, ips_detect does not kmalloc anything;

There's a comment in isapnp/core.c that release_region's were added
(dated 2001-06-03!).
proc_register() is now static, used by internal procfs routines.

loops_per_sec is no more.


	Domen

--- kj-todo	2004-06-26 17:37:16.000000000 +0200
+++ kj-todo-new	2004-06-26 17:36:56.000000000 +0200
@@ -15,26 +15,17 @@
 --------------------------------------------------------------------------
 Audit return codes (and handle failure correctly) for..
 - request_region()
-- register_reboot_notifier()
 - request_irq()
-- kmalloc(), vmalloc(), skb_alloc(), etc
+- kmalloc(), vmalloc(), etc.
 - register_netdev() has to be checked as well
 - misc_register() (yes, it can fail, murphy's law applies here as well)
 - scsi_register()
-- proc_*_create()
+- create_proc_*()
 - pci_map_* might return 0 for a valid mapping.
   Some code tests mapping for a non-zero value, which is incorrect.
-- get_free_pages()
-- init_etherdev()
-  drivers allocating net_device with init_etherdev doesn't need zeroing it
-  (init_etherdev does this for us)
+- __get_free_pages() and __get_free_page()
 - ioremap() -- Some are using this as a pointer, which is wrong.
 
-SUSPECTS:
-- drivers/scsi/ips.c for resource leaks (ips_release doesn't seems
-  to release all the kmalloc memory it got in ips_detect. (quick look)
-- drivers/char/ip2main.c (init_etherdev)
-
 -----------------------------------------------------------------------------
 Balancing functions.
 Make sure calls to certain functions are matched by the relevant function at
@@ -48,14 +39,10 @@
 - check that net_device interrupt functions use dev_kfree_skb_irq and not
   just dev_kfree_skb
 
-SUSPECTS:
-- check isapnp.c: doesn't release regions on failure
-
 -----------------------------------------------------------------------------
 Remove unneeded historic code / New API conversions.
 - checking for NULL on probe routines for net drivers
 - convert drivers to new PCI API
-- proc_register() is dead. Use create_proc_read_entry() instead. (from Al Viro on lkml)
 - Replace uses of suser() and fsuser() with capability checks.
 - get rid of save_flags_cli, use local_irq_save instead
 - get rid of check_region, use just request_region checking its return (2.2
@@ -154,9 +141,6 @@
 
 -----------------------------------------------------------------------------
 - prumpf suggested:
-- make sure drivers never read loops_per_sec - it might change under
-  them (prumpf did this in 2.2.18pre series, need forward port to 2.4)
-
 - fix watchdog drivers to use link order rather than explicit
   initialization calls (i810 is particularly broken)
 
@@ -209,6 +193,8 @@
 	}
 	remove_wait_queue(&waitqueue, &wait); 
 
+(see replyes, this is still buggy)
+
 When you want to handle signals you can check for them before or after the
 condition check. Also use TASK_INTERRUPTIBLE in this case.
 

--===============27089847691585645==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============27089847691585645==--
