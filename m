From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Sun, 05 Mar 2006 15:02:16 +0000
Subject: [KJ] [Patch] kzalloc() conversion in drivers/misc/
Message-Id: <1141570936.13183.13.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============69862048839680768=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140815848.26064.4.camel@alice>
In-Reply-To: <1140815848.26064.4.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============69862048839680768==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch converts drivers/misc/ to kzalloc usage.
Compile tested with allyesconfig.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/drivers/misc/ibmasm/command.c.orig	2006-03-05 11:26:22.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/misc/ibmasm/command.c	2006-03-05 11:26:40.000000000 +0100
@@ -41,18 +41,15 @@ struct command *ibmasm_new_command(struc
 	if (buffer_size > IBMASM_CMD_MAX_BUFFER_SIZE)
 		return NULL;
 
-	cmd = kmalloc(sizeof(struct command), GFP_KERNEL);
+	cmd = kzalloc(sizeof(struct command), GFP_KERNEL);
 	if (cmd == NULL)
 		return NULL;
 
-	memset(cmd, 0, sizeof(*cmd));
-
-	cmd->buffer = kmalloc(buffer_size, GFP_KERNEL);
+	cmd->buffer = kzalloc(buffer_size, GFP_KERNEL);
 	if (cmd->buffer == NULL) {
 		kfree(cmd);
 		return NULL;
 	}
-	memset(cmd->buffer, 0, buffer_size);
 	cmd->buffer_size = buffer_size;
 
 	kobject_init(&cmd->kobj);
--- linux-2.6.16-rc5-mm1/drivers/misc/ibmasm/ibmasmfs.c.orig	2006-03-05 11:26:51.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/misc/ibmasm/ibmasmfs.c	2006-03-05 11:26:59.000000000 +0100
@@ -563,12 +563,10 @@ static ssize_t remote_settings_file_writ
 	if (*offset != 0)
 		return 0;
 
-	buff = kmalloc (count + 1, GFP_KERNEL);
+	buff = kzalloc (count + 1, GFP_KERNEL);
 	if (!buff)
 		return -ENOMEM;
 
-	memset(buff, 0x0, count + 1);
-
 	if (copy_from_user(buff, ubuff, count)) {
 		kfree(buff);
 		return -EFAULT;
--- linux-2.6.16-rc5-mm1/drivers/misc/ibmasm/module.c.orig	2006-03-05 11:27:07.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/misc/ibmasm/module.c	2006-03-05 11:27:15.000000000 +0100
@@ -77,13 +77,12 @@ static int __devinit ibmasm_init_one(str
 	/* vnc client won't work without bus-mastering */
 	pci_set_master(pdev);
 
-	sp = kmalloc(sizeof(struct service_processor), GFP_KERNEL);
+	sp = kzalloc(sizeof(struct service_processor), GFP_KERNEL);
 	if (sp == NULL) {
 		dev_err(&pdev->dev, "Failed to allocate memory\n");
 		result = -ENOMEM;
 		goto error_kmalloc;
 	}
-	memset(sp, 0, sizeof(struct service_processor));
 
 	sp->lock = SPIN_LOCK_UNLOCKED;
 	INIT_LIST_HEAD(&sp->command_queue);



--===============69862048839680768==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============69862048839680768==--
