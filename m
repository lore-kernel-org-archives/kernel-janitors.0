Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F55E175A6D;
	Sat, 18 Apr 2026 09:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776505846; cv=none; b=rSn9nI4QrMFbzE9R0SPT5mcvpy9d+vE29+jMCt3lgm5J5Z+xnHHqyKAlPEXMcmyb/YQkcy2CXr4uZ7zHSxM5pra3pU4oOsA2xOhnNW9hZjbyLeUF/r4rPKUSExTgdORdKQUrmijDtsGu4icz6zoSj1MoZrK/yukFR433t5EbDAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776505846; c=relaxed/simple;
	bh=E914gY/lsGUt2Yd17F5pS9o9CW3nXFjH3/m7cg1OVuE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aDSNjgY+1amx3t8oBDJ2VXlqyL0TSnNTbJemQdoyoWGoF4x2k2A8DHODqMtRMBQgUVdiSllpSqHZoFqB0S8Vve5I1jiUwrJxtO+IbQP61XVVeSlrYjgHG06UNEAjvpyzMo2WxurjO2hi1ZaJvu+ST56OIHWpZKTsX/DRZUHqaeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=px3Cg21X; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Yx9P/f/c; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="px3Cg21X";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Yx9P/f/c"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fyRnt6qHpz9v0F;
	Sat, 18 Apr 2026 11:50:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776505843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DWBZaAc+4VTRwYv+GjHbkwgVP0bhQqmHL24PT1/7NTA=;
	b=px3Cg21XGzjWvgvITXx2WXybkoqzXrd4aCfLdUlddrNIMQNfYJ5jyJrd2dvDb9Wv2HH9DB
	NW+c0dd4aw/4mjNUHkaItsHQ1hBeom1OEWUJI2S5HFmXbc6UQ6PF90oAKJduoB48M5Auzy
	OAe7fyqHJSp2dOCgwG83hhT1RWcyALFeh3cpiG2xjNNFObRBs2uNOAMZTnnePG1z/icBWK
	y87yT9bgn9tUFc5y+5KAo1Lm8tYip1t5fSd70vWKb2StoJjXCD1rApEPf1W+UaEUdJ3d75
	SZBHtB5+7BTvipU6qsY0fOSFkAt4v7oXIGyRq3oHVHz0/s5q0O/vLgZ8ZdfPmw==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776505841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DWBZaAc+4VTRwYv+GjHbkwgVP0bhQqmHL24PT1/7NTA=;
	b=Yx9P/f/ccsEJDOlsl0bZdwkbbJX1Nw5R0SWF7XU4dj6UrmqZaLUBKcKACKGQb7v620Pzi8
	8GWmh1Toz38hHHSexOVjc9C+b/KVefC/D1FMgtvYlWnDwviBzrXysTa61JrHMTPufdQRx+
	4pvN4L4Get4LEnYXOFCQ6TdAgEoEh4TVJZLr6lUBu6tfH53C17vemJpooCgVQ5MAnWuoJW
	M1/IHu8DukiQvjaRvku85y3AnwrsuyseqxLzpSgl3PPy11esqkdW1Q4Y5Di7E/Azj54p+4
	WciruB6Tq3tfvR/k0D/Pxj0z9VDvWnrgyNqYkqLzXdpnmGQuAowzcJlCTjAm4w==
To: kernel-janitors@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-newbie@vger.kernel.org
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH] Documentation: adopt new coding style of type-aware kmalloc-family
Date: Sat, 18 Apr 2026 11:30:48 +0200
Message-ID: <20260418093101.130335-6-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 31sgmc7qtm94baubtgrfsi146pc876sw
X-MBO-RS-ID: ab88c90ff7b13a2eea9

Would a patch like this one make sense?
I think i need help with the change log. Is there something to much or missing?

ptr = kmalloc(sizeof(*ptr), gfp);
 -> ptr = kmalloc_obj(*ptr, gfp);

 This one is done. The ones below are not done yet.

ptr = kmalloc(sizeof(struct some_obj_name), gfp);
 -> ptr = kmalloc_obj(*ptr, gfp);
ptr = kzalloc(sizeof(*ptr), gfp);
 > ptr = kzalloc_obj(*ptr, gfp);
ptr = kmalloc_array(count, sizeof(*ptr), gfp);
 -> ptr = kmalloc_objs(*ptr, count, gfp);
ptr = kcalloc(count, sizeof(*ptr), gfp);
 -> ptr = kzalloc_objs(*ptr, count, gfp);

change log:
[PATCH] Documentation: adopt new coding style of type-aware kmalloc-family

Update the documentation to reflect new type-aware kmalloc-family as
suggested in commit 2932ba8d9c99 ("slab: Introduce kmalloc_obj() and family")

ptr = kmalloc(sizeof(*ptr), gfp);
 -> ptr = kmalloc_obj(*ptr, gfp);

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/RCU/Design/Requirements/Requirements.rst      | 6 +++---
 Documentation/RCU/listRCU.rst                               | 2 +-
 Documentation/RCU/whatisRCU.rst                             | 4 ++--
 Documentation/core-api/kref.rst                             | 4 ++--
 Documentation/core-api/list.rst                             | 4 ++--
 Documentation/kernel-hacking/locking.rst                    | 4 ++--
 Documentation/locking/locktypes.rst                         | 4 ++--
 Documentation/process/coding-style.rst                      | 2 +-
 Documentation/sound/kernel-api/writing-an-alsa-driver.rst   | 4 ++--
 Documentation/translations/it_IT/kernel-hacking/locking.rst | 4 ++--
 Documentation/translations/it_IT/locking/locktypes.rst      | 4 ++--
 Documentation/translations/it_IT/process/coding-style.rst   | 2 +-
 Documentation/translations/sp_SP/process/coding-style.rst   | 2 +-
 Documentation/translations/zh_CN/core-api/kref.rst          | 4 ++--
 Documentation/translations/zh_CN/process/coding-style.rst   | 2 +-
 Documentation/translations/zh_TW/process/coding-style.rst   | 2 +-
 16 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/Documentation/RCU/Design/Requirements/Requirements.rst b/Documentation/RCU/Design/Requirements/Requirements.rst
index b5cdbba3ec2e..faca5a9c8c12 100644
--- a/Documentation/RCU/Design/Requirements/Requirements.rst
+++ b/Documentation/RCU/Design/Requirements/Requirements.rst
@@ -206,7 +206,7 @@ non-\ ``NULL``, locklessly accessing the ``->a`` and ``->b`` fields.
 
        1 bool add_gp_buggy(int a, int b)
        2 {
-       3   p = kmalloc(sizeof(*p), GFP_KERNEL);
+       3   p = kmalloc_obj(*p, GFP_KERNEL);
        4   if (!p)
        5     return -ENOMEM;
        6   spin_lock(&gp_lock);
@@ -228,7 +228,7 @@ their rights to reorder this code as follows:
 
        1 bool add_gp_buggy_optimized(int a, int b)
        2 {
-       3   p = kmalloc(sizeof(*p), GFP_KERNEL);
+       3   p = kmalloc_obj(*p, GFP_KERNEL);
        4   if (!p)
        5     return -ENOMEM;
        6   spin_lock(&gp_lock);
@@ -264,7 +264,7 @@ shows an example of insertion:
 
        1 bool add_gp(int a, int b)
        2 {
-       3   p = kmalloc(sizeof(*p), GFP_KERNEL);
+       3   p = kmalloc_obj(*p, GFP_KERNEL);
        4   if (!p)
        5     return -ENOMEM;
        6   spin_lock(&gp_lock);
diff --git a/Documentation/RCU/listRCU.rst b/Documentation/RCU/listRCU.rst
index d8bb98623c12..48c7272a4ccc 100644
--- a/Documentation/RCU/listRCU.rst
+++ b/Documentation/RCU/listRCU.rst
@@ -276,7 +276,7 @@ The RCU version of audit_upd_rule() is as follows::
 
 		list_for_each_entry(e, list, list) {
 			if (!audit_compare_rule(rule, &e->rule)) {
-				ne = kmalloc(sizeof(*entry), GFP_ATOMIC);
+				ne = kmalloc_obj(*entry, GFP_ATOMIC);
 				if (ne == NULL)
 					return -ENOMEM;
 				audit_copy_rule(&ne->rule, &e->rule);
diff --git a/Documentation/RCU/whatisRCU.rst b/Documentation/RCU/whatisRCU.rst
index a1582bd653d1..770aab8ea36a 100644
--- a/Documentation/RCU/whatisRCU.rst
+++ b/Documentation/RCU/whatisRCU.rst
@@ -468,7 +468,7 @@ uses of RCU may be found in listRCU.rst and NMI-RCU.rst.
 		struct foo *new_fp;
 		struct foo *old_fp;
 
-		new_fp = kmalloc(sizeof(*new_fp), GFP_KERNEL);
+		new_fp = kmalloc_obj(*new_fp, GFP_KERNEL);
 		spin_lock(&foo_mutex);
 		old_fp = rcu_dereference_protected(gbl_foo, lockdep_is_held(&foo_mutex));
 		*new_fp = *old_fp;
@@ -570,7 +570,7 @@ The foo_update_a() function might then be written as follows::
 		struct foo *new_fp;
 		struct foo *old_fp;
 
-		new_fp = kmalloc(sizeof(*new_fp), GFP_KERNEL);
+		new_fp = kmalloc_obj(*new_fp, GFP_KERNEL);
 		spin_lock(&foo_mutex);
 		old_fp = rcu_dereference_protected(gbl_foo, lockdep_is_held(&foo_mutex));
 		*new_fp = *old_fp;
diff --git a/Documentation/core-api/kref.rst b/Documentation/core-api/kref.rst
index 8db9ff03d952..1c14c036699d 100644
--- a/Documentation/core-api/kref.rst
+++ b/Documentation/core-api/kref.rst
@@ -40,7 +40,7 @@ kref_init as so::
 
      struct my_data *data;
 
-     data = kmalloc(sizeof(*data), GFP_KERNEL);
+     data = kmalloc_obj(*data, GFP_KERNEL);
      if (!data)
             return -ENOMEM;
      kref_init(&data->refcount);
@@ -100,7 +100,7 @@ thread to process::
 	int rv = 0;
 	struct my_data *data;
 	struct task_struct *task;
-	data = kmalloc(sizeof(*data), GFP_KERNEL);
+	data = kmalloc_obj(*data, GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 	kref_init(&data->refcount);
diff --git a/Documentation/core-api/list.rst b/Documentation/core-api/list.rst
index 241464ca0549..86cd0a1b77ea 100644
--- a/Documentation/core-api/list.rst
+++ b/Documentation/core-api/list.rst
@@ -112,7 +112,7 @@ list:
 
           /* State 1 */
 
-          grock = kzalloc(sizeof(*grock), GFP_KERNEL);
+          grock = kzalloc_obj(*grock, GFP_KERNEL);
           if (!grock)
                   return -ENOMEM;
           grock->name = "Grock";
@@ -123,7 +123,7 @@ list:
 
           /* State 2 */
 
-          dimitri = kzalloc(sizeof(*dimitri), GFP_KERNEL);
+          dimitri = kzalloc_obj(*dimitri, GFP_KERNEL);
           if (!dimitri)
                   return -ENOMEM;
           dimitri->name = "Dimitri";
diff --git a/Documentation/kernel-hacking/locking.rst b/Documentation/kernel-hacking/locking.rst
index dff0646a717b..d02e62367c4f 100644
--- a/Documentation/kernel-hacking/locking.rst
+++ b/Documentation/kernel-hacking/locking.rst
@@ -442,7 +442,7 @@ to protect the cache and all the objects within it. Here's the code::
     {
             struct object *obj;
 
-            if ((obj = kmalloc(sizeof(*obj), GFP_KERNEL)) == NULL)
+            if ((obj = kmalloc_obj(*obj, GFP_KERNEL)) == NULL)
                     return -ENOMEM;
 
             strscpy(obj->name, name, sizeof(obj->name));
@@ -517,7 +517,7 @@ which are taken away, and the ``+`` are lines which are added.
              struct object *obj;
     +        unsigned long flags;
 
-             if ((obj = kmalloc(sizeof(*obj), GFP_KERNEL)) == NULL)
+             if ((obj = kmalloc_obj(*obj, GFP_KERNEL)) == NULL)
                      return -ENOMEM;
     @@ -63,30 +64,33 @@
              obj->id = id;
diff --git a/Documentation/locking/locktypes.rst b/Documentation/locking/locktypes.rst
index 37b6a5670c2f..ac1ad722a9e7 100644
--- a/Documentation/locking/locktypes.rst
+++ b/Documentation/locking/locktypes.rst
@@ -498,7 +498,7 @@ allocating memory.  Thus, on a non-PREEMPT_RT kernel the following code
 works perfectly::
 
   raw_spin_lock(&lock);
-  p = kmalloc(sizeof(*p), GFP_ATOMIC);
+  p = kmalloc_obj(*p, GFP_ATOMIC);
 
 But this code fails on PREEMPT_RT kernels because the memory allocator is
 fully preemptible and therefore cannot be invoked from truly atomic
@@ -507,7 +507,7 @@ while holding normal non-raw spinlocks because they do not disable
 preemption on PREEMPT_RT kernels::
 
   spin_lock(&lock);
-  p = kmalloc(sizeof(*p), GFP_ATOMIC);
+  p = kmalloc_obj(*p, GFP_ATOMIC);
 
 
 bit spinlocks
diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index 35b381230f6e..6bf71ea67744 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -945,7 +945,7 @@ The preferred form for passing a size of a struct is the following:
 
 .. code-block:: c
 
-	p = kmalloc(sizeof(*p), ...);
+	p = kmalloc_obj(*p, ...);
 
 The alternative form where struct name is spelled out hurts readability and
 introduces an opportunity for a bug when the pointer variable type is changed
diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index 895752cbcedd..b79e3ed16dc5 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -1737,7 +1737,7 @@ callback::
   {
           struct my_pcm_data *data;
           ....
-          data = kmalloc(sizeof(*data), GFP_KERNEL);
+          data = kmalloc_obj(*data, GFP_KERNEL);
           substream->runtime->private_data = data;
           ....
   }
@@ -3301,7 +3301,7 @@ You can then pass any pointer value to the ``private_data``. If you
 assign private data, you should define a destructor, too. The
 destructor function is set in the ``private_free`` field::
 
-  struct mydata *p = kmalloc(sizeof(*p), GFP_KERNEL);
+  struct mydata *p = kmalloc_obj(*p, GFP_KERNEL);
   hw->private_data = p;
   hw->private_free = mydata_free;
 
diff --git a/Documentation/translations/it_IT/kernel-hacking/locking.rst b/Documentation/translations/it_IT/kernel-hacking/locking.rst
index 4c21cf60f775..acca89a3743a 100644
--- a/Documentation/translations/it_IT/kernel-hacking/locking.rst
+++ b/Documentation/translations/it_IT/kernel-hacking/locking.rst
@@ -462,7 +462,7 @@ e tutti gli oggetti che contiene. Ecco il codice::
     {
             struct object *obj;
 
-            if ((obj = kmalloc(sizeof(*obj), GFP_KERNEL)) == NULL)
+            if ((obj = kmalloc_obj(*obj, GFP_KERNEL)) == NULL)
                     return -ENOMEM;
 
             strscpy(obj->name, name, sizeof(obj->name));
@@ -537,7 +537,7 @@ sono quelle rimosse, mentre quelle ``+`` sono quelle aggiunte.
              struct object *obj;
     +        unsigned long flags;
 
-             if ((obj = kmalloc(sizeof(*obj), GFP_KERNEL)) == NULL)
+             if ((obj = kmalloc_obj(*obj, GFP_KERNEL)) == NULL)
                      return -ENOMEM;
     @@ -63,30 +64,33 @@
              obj->id = id;
diff --git a/Documentation/translations/it_IT/locking/locktypes.rst b/Documentation/translations/it_IT/locking/locktypes.rst
index 1c7056283b9d..d5fa36aa05cc 100644
--- a/Documentation/translations/it_IT/locking/locktypes.rst
+++ b/Documentation/translations/it_IT/locking/locktypes.rst
@@ -488,7 +488,7 @@ o rwlock_t. Per esempio, la sezione critica non deve fare allocazioni di
 memoria. Su un kernel non-PREEMPT_RT il seguente codice funziona perfettamente::
 
   raw_spin_lock(&lock);
-  p = kmalloc(sizeof(*p), GFP_ATOMIC);
+  p = kmalloc_obj(*p, GFP_ATOMIC);
 
 Ma lo stesso codice non funziona su un kernel PREEMPT_RT perché l'allocatore di
 memoria può essere oggetto di prelazione e quindi non può essere chiamato in un
@@ -497,7 +497,7 @@ trattiene un blocco *non-raw* perché non disabilitano la prelazione sui kernel
 PREEMPT_RT::
 
   spin_lock(&lock);
-  p = kmalloc(sizeof(*p), GFP_ATOMIC);
+  p = kmalloc_obj(*p, GFP_ATOMIC);
 
 
 bit spinlocks
diff --git a/Documentation/translations/it_IT/process/coding-style.rst b/Documentation/translations/it_IT/process/coding-style.rst
index c0dc786b8474..2a499412a2e3 100644
--- a/Documentation/translations/it_IT/process/coding-style.rst
+++ b/Documentation/translations/it_IT/process/coding-style.rst
@@ -943,7 +943,7 @@ Il modo preferito per passare la dimensione di una struttura è il seguente:
 
 .. code-block:: c
 
-	p = kmalloc(sizeof(*p), ...);
+	p = kmalloc_obj(*p, ...);
 
 La forma alternativa, dove il nome della struttura viene scritto interamente,
 peggiora la leggibilità e introduce possibili bachi quando il tipo di
diff --git a/Documentation/translations/sp_SP/process/coding-style.rst b/Documentation/translations/sp_SP/process/coding-style.rst
index 7d63aa8426e6..44c93d5f6beb 100644
--- a/Documentation/translations/sp_SP/process/coding-style.rst
+++ b/Documentation/translations/sp_SP/process/coding-style.rst
@@ -955,7 +955,7 @@ La forma preferida para pasar el tamaño de una estructura es la siguiente:
 
 .. code-block:: c
 
-	p = kmalloc(sizeof(*p), ...);
+	p = kmalloc_obj(*p, ...);
 
 La forma alternativa donde se deletrea el nombre de la estructura perjudica
 la legibilidad, y presenta una oportunidad para un error cuando se cambia
diff --git a/Documentation/translations/zh_CN/core-api/kref.rst b/Documentation/translations/zh_CN/core-api/kref.rst
index b9902af310c5..fcff01e99852 100644
--- a/Documentation/translations/zh_CN/core-api/kref.rst
+++ b/Documentation/translations/zh_CN/core-api/kref.rst
@@ -52,7 +52,7 @@ kref可以出现在数据结构体中的任何地方。
 
      struct my_data *data;
 
-     data = kmalloc(sizeof(*data), GFP_KERNEL);
+     data = kmalloc_obj(*data, GFP_KERNEL);
      if (!data)
             return -ENOMEM;
      kref_init(&data->refcount);
@@ -106,7 +106,7 @@ Kref规则
 	int rv = 0;
 	struct my_data *data;
 	struct task_struct *task;
-	data = kmalloc(sizeof(*data), GFP_KERNEL);
+	data = kmalloc_obj(*data, GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 	kref_init(&data->refcount);
diff --git a/Documentation/translations/zh_CN/process/coding-style.rst b/Documentation/translations/zh_CN/process/coding-style.rst
index 5a342a024c01..55d5da974d89 100644
--- a/Documentation/translations/zh_CN/process/coding-style.rst
+++ b/Documentation/translations/zh_CN/process/coding-style.rst
@@ -813,7 +813,7 @@ Documentation/translations/zh_CN/core-api/memory-allocation.rst 。
 
 .. code-block:: c
 
-	p = kmalloc(sizeof(*p), ...);
+	p = kmalloc_obj(*p, ...);
 
 另外一种传递方式中，sizeof 的操作数是结构体的名字，这样会降低可读性，并且可能
 会引入 bug。有可能指针变量类型被改变时，而对应的传递给内存分配函数的 sizeof
diff --git a/Documentation/translations/zh_TW/process/coding-style.rst b/Documentation/translations/zh_TW/process/coding-style.rst
index e2ba97b3d8bb..63c78982a1af 100644
--- a/Documentation/translations/zh_TW/process/coding-style.rst
+++ b/Documentation/translations/zh_TW/process/coding-style.rst
@@ -827,7 +827,7 @@ Documentation/translations/zh_CN/core-api/memory-allocation.rst 。
 
 .. code-block:: c
 
-	p = kmalloc(sizeof(*p), ...);
+	p = kmalloc_obj(*p, ...);
 
 另外一種傳遞方式中，sizeof 的操作數是結構體的名字，這樣會降低可讀性，並且可能
 會引入 bug。有可能指針變量類型被改變時，而對應的傳遞給內存分配函數的 sizeof
-- 
2.53.0

