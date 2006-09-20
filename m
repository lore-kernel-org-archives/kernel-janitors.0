From: Steven Fernandez <lonetwin.kj@gmail.com>
Date: Wed, 20 Sep 2006 13:02:29 +0000
Subject: Re: [KJ] [PATCH] add KERN_* constants to printk()'s in
Message-Id: <45113915.1080807@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200609191426.k8JEQonV000566@smtp.osdl.org>
In-Reply-To: <200609191426.k8JEQonV000566@smtp.osdl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello,

Reiner Herrmann wrote:
> > Hi Steve,
> > 
> > you should configure your mail client that it doesn't
> > add linebreaks if a line is longer than X characters.
> > The rest seems to be ok.
Thanks Reiner and Jesper. I'm resending the patch. Hope it is ok this time

- steve

---

Signed-off-by: Steven Fernandez <steve@lonetwin.net>

---
 diffstat -p1 -w70 ~/diff 
 drivers/char/pty.c     |    2 +-
 drivers/char/toshiba.c |    6 +++---
 drivers/char/vt.c      |   10 +++++-----
 fs/devpts/inode.c      |    2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/char/pty.c b/drivers/char/pty.c
index 34dd4c3..4f22bca 100644
--- a/drivers/char/pty.c
+++ b/drivers/char/pty.c
@@ -42,7 +42,7 @@ static void pty_close(struct tty_struct 
 		return;
 	if (tty->driver->subtype = PTY_TYPE_MASTER) {
 		if (tty->count > 1)
-			printk("master pty_close: count = %d!!\n", tty->count);
+			printk(KERN_WARNING "master pty_close: count = %d!!\n", tty->count);
 	} else {
 		if (tty->count > 2)
 			return;
diff --git a/drivers/char/toshiba.c b/drivers/char/toshiba.c
index dd36fd0..34394da 100644
--- a/drivers/char/toshiba.c
+++ b/drivers/char/toshiba.c
@@ -382,7 +382,7 @@ static int tosh_get_machine_id(void __io
 		   value. This has been verified on a Satellite Pro 430CDT,
 		   Tecra 750CDT, Tecra 780DVD and Satellite 310CDT. */
 #if TOSH_DEBUG
-		printk("toshiba: debugging ID ebx=0x%04x\n", regs.ebx);
+		printk(KERN_DEBUG "toshiba: debugging ID ebx=0x%04x\n", regs.ebx);
 #endif
 		bx = 0xe6f5;
 
@@ -426,7 +426,7 @@ static int tosh_probe(void)
 
 	for (i=0;i<7;i++) {
 		if (readb(bios+0xe010+i)!=signature[i]) {
-			printk("toshiba: not a supported Toshiba laptop\n");
+			printk(KERN_ERR "toshiba: not a supported Toshiba laptop\n");
 			iounmap(bios);
 			return -ENODEV;
 		}
@@ -442,7 +442,7 @@ static int tosh_probe(void)
 	/* if this is not a Toshiba laptop carry flag is set and ah=0x86 */
 
 	if ((flag=1) || ((regs.eax & 0xff00)=0x8600)) {
-		printk("toshiba: not a supported Toshiba laptop\n");
+		printk(KERN_ERR "toshiba: not a supported Toshiba laptop\n");
 		iounmap(bios);
 		return -ENODEV;
 	}
diff --git a/drivers/char/vt.c b/drivers/char/vt.c
index da7e66a..0938e05 100644
--- a/drivers/char/vt.c
+++ b/drivers/char/vt.c
@@ -1962,7 +1962,7 @@ #endif
 	    static int error = 0;
 	    if (!error) {
 		error = 1;
-		printk("con_write: tty %d not allocated\n", currcons+1);
+		printk(KERN_ERR "con_write: tty %d not allocated\n", currcons+1);
 	    }
 	    release_console_sem();
 	    return 0;
@@ -2624,7 +2624,7 @@ static int __init con_init(void)
 	gotoxy(vc, vc->vc_x, vc->vc_y);
 	csi_J(vc, 0);
 	update_screen(vc);
-	printk("Console: %s %s %dx%d",
+	printk(KERN_NOTICE "Console: %s %s %dx%d",
 		vc->vc_can_do_color ? "colour" : "mono",
 		display_desc, vc->vc_cols, vc->vc_rows);
 	printable = 1;
@@ -2766,9 +2766,9 @@ static int bind_con_driver(const struct 
 			clear_buffer_attributes(vc);
 	}
 
-	printk("Console: switching ");
+	printk(KERN_DEBUG "Console: switching ");
 	if (!deflt)
-		printk("consoles %d-%d ", first+1, last+1);
+		printk(KERN_DEBUG "consoles %d-%d ", first+1, last+1);
 	if (j >= 0) {
 		struct vc_data *vc = vc_cons[j].d;
 
@@ -3354,7 +3354,7 @@ void do_unblank_screen(int leaving_gfx)
 		return;
 	if (!vc_cons_allocated(fg_console)) {
 		/* impossible */
-		printk("unblank_screen: tty %d not allocated ??\n", fg_console+1);
+		printk(KERN_ERR "unblank_screen: tty %d not allocated ??\n", fg_console+1);
 		return;
 	}
 	vc = vc_cons[fg_console].d;
diff --git a/fs/devpts/inode.c b/fs/devpts/inode.c
index f7aef5b..3f6c806 100644
--- a/fs/devpts/inode.c
+++ b/fs/devpts/inode.c
@@ -124,7 +124,7 @@ devpts_fill_super(struct super_block *s,
 	if (s->s_root)
 		return 0;
 	
-	printk("devpts: get root dentry failed\n");
+	printk(KERN_ERR "devpts: get root dentry failed\n");
 	iput(inode);
 fail:
 	return -ENOMEM;

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
