From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Tue, 07 Mar 2006 08:53:23 +0000
Subject: [KJ] [Patch] kzalloc() conversion in Documentation/
Message-Id: <1141721603.15005.7.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============95483458043550662=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============95483458043550662==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch converts Documentation/ to kzalloc usage.
Not tested.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/Documentation/filesystems/configfs/configfs_example.c.orig	2006-03-07 09:35:13.000000000 +0100
+++ linux-2.6.16-rc5-mm1/Documentation/filesystems/configfs/configfs_example.c	2006-03-07 09:35:31.000000000 +0100
@@ -268,12 +268,10 @@ static struct config_item *simple_childr
 {
 	struct simple_child *simple_child;
 
-	simple_child = kmalloc(sizeof(struct simple_child), GFP_KERNEL);
+	simple_child = kzalloc(sizeof(struct simple_child), GFP_KERNEL);
 	if (!simple_child)
 		return NULL;
 
-	memset(simple_child, 0, sizeof(struct simple_child));
-
 	config_item_init_type_name(&simple_child->item, name,
 				   &simple_child_type);
 
@@ -353,13 +351,11 @@ static struct config_group *group_childr
 {
 	struct simple_children *simple_children;
 
-	simple_children = kmalloc(sizeof(struct simple_children),
+	simple_children = kzalloc(sizeof(struct simple_children),
 				  GFP_KERNEL);
 	if (!simple_children)
 		return NULL;
 
-	memset(simple_children, 0, sizeof(struct simple_children));
-
 	config_group_init_type_name(&simple_children->group, name,
 				    &simple_children_type);
 
--- linux-2.6.16-rc5-mm1/Documentation/connector/cn_test.c.orig	2006-03-07 09:35:49.000000000 +0100
+++ linux-2.6.16-rc5-mm1/Documentation/connector/cn_test.c	2006-03-07 09:36:05.000000000 +0100
@@ -124,10 +124,8 @@ static void cn_test_timer_func(unsigned 
 	struct cn_msg *m;
 	char data[32];
 
-	m = kmalloc(sizeof(*m) + sizeof(data), GFP_ATOMIC);
+	m = kzalloc(sizeof(*m) + sizeof(data), GFP_ATOMIC);
 	if (m) {
-		memset(m, 0, sizeof(*m) + sizeof(data));
-
 		memcpy(&m->id, &cn_test_id, sizeof(m->id));
 		m->seq = cn_test_timer_counter;
 		m->len = sizeof(data);



--===============95483458043550662==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============95483458043550662==--
