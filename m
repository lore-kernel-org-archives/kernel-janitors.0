From: "Christophe Jaillet" <christophe.jaillet@wanadoo.fr>
Date: Mon, 08 Mar 2010 21:21:20 +0000
Subject: [patch] /lib/kobject.c
Message-Id: <hn3pog$8co$1@dough.gmane.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Christophe Jaillet <christophe.jaillet@wanadoo.fr>

Hi, here is a patch against /lib/kobject.c.

No need to allocate more memory than usefull.
Here, we only need 12 (strlen("DEVPATH_OLD=")) + 1 (\0) extra bytes. This
saves 2 bytes !!! and improve readability IMO.


Signed-off-by: Christophe Jaillet <christophe.jaillet@wanadoo.fr>

---

diff --git a/lib/kobject.c b/lib/kobject.c
index 0487d1f..958cc76 100644
--- a/lib/kobject.c
+++ b/lib/kobject.c
@@ -412,7 +412,7 @@ int kobject_rename(struct kobject *kobj, const char
*new_name)
   error = -ENOMEM;
   goto out;
  }
- devpath_string = kmalloc(strlen(devpath) + 15, GFP_KERNEL);
+ devpath_string = kmalloc(12 + strlen(devpath) + 1, GFP_KERNEL);
  if (!devpath_string) {
   error = -ENOMEM;
   goto out;



