From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 03 Sep 2016 12:14:59 +0000
Subject: [PATCH 03/17] s390/debug: Add some spaces for better code readability
Message-Id: <b272281b-84da-40f5-4233-5ae39d80dbd8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <e4359dc9-9e20-e33b-9743-9ebade853268@users.sourceforge.net>
In-Reply-To: <e4359dc9-9e20-e33b-9743-9ebade853268@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-s390@vger.kernel.org, David Hildenbrand <dahi@linux.vnet.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Joe Perches <joe@perches.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 1 Sep 2016 16:00:39 +0200

Use space characters at some source code places according to
the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/s390/kernel/debug.c | 177 +++++++++++++++++++++++++------------------=
----
 1 file changed, 93 insertions(+), 84 deletions(-)

diff --git a/arch/s390/kernel/debug.c b/arch/s390/kernel/debug.c
index ddfc5e4..5bb9108 100644
--- a/arch/s390/kernel/debug.c
+++ b/arch/s390/kernel/debug.c
@@ -205,9 +205,9 @@ debug_areas_alloc(int pages_per_area, int nr_areas)
 					 GFP_KERNEL);
 		if (!areas[i])
 			goto fail_malloc_areas2;
-		for(j =3D 0; j < pages_per_area; j++) {
+		for (j =3D 0; j < pages_per_area; j++) {
 			areas[i][j] =3D kzalloc(PAGE_SIZE, GFP_KERNEL);
-			if(!areas[i][j]) {
+			if (!areas[i][j]) {
 				for (j--; j >=3D 0; j--)
 					kfree(areas[i][j]);
 				kfree(areas[i]);
@@ -218,7 +218,7 @@ debug_areas_alloc(int pages_per_area, int nr_areas)
 	return areas;
=20
 fail_malloc_areas2:
-	for(i--; i >=3D 0; i--){
+	for (i--; i >=3D 0; i--) {
 		for (j =3D 0; j < pages_per_area; j++)
 			kfree(areas[i][j]);
 		kfree(areas[i]);
@@ -271,7 +271,7 @@ debug_info_alloc(const char *name, int pages_per_area, =
int nr_areas,
 	rc->entry_size     =3D sizeof(debug_entry_t) + buf_size;
 	strlcpy(rc->name, name, sizeof(rc->name));
 	memset(rc->views, 0, DEBUG_MAX_VIEWS * sizeof(struct debug_view *));
-	memset(rc->debugfs_entries, 0 ,DEBUG_MAX_VIEWS *
+	memset(rc->debugfs_entries, 0, DEBUG_MAX_VIEWS *
 		sizeof(struct dentry*));
 	atomic_set(&(rc->ref_count), 0);
=20
@@ -297,7 +297,7 @@ debug_areas_free(debug_info_t* db_info)
 {
 	int i,j;
=20
-	if(!db_info->areas)
+	if (!db_info->areas)
 		return;
 	for (i =3D 0; i < db_info->nr_areas; i++) {
 		for (j =3D 0; j < db_info->pages_per_area; j++)
@@ -334,7 +334,7 @@ debug_info_create(const char *name, int pages_per_area,=
 int nr_areas,
=20
         rc =3D debug_info_alloc(name, pages_per_area, nr_areas, buf_size,
 				DEBUG_DEFAULT_LEVEL, ALL_AREAS);
-        if(!rc)=20
+	if (!rc)
 		goto out;
=20
 	rc->mode =3D mode & ~S_IFMT;
@@ -378,10 +378,10 @@ debug_info_copy(debug_info_t* in, int mode)
 		rc =3D debug_info_alloc(in->name, in->pages_per_area,
 			in->nr_areas, in->buf_size, in->level, mode);
 		spin_lock_irqsave(&in->lock, flags);
-		if(!rc)
+		if (!rc)
 			goto out;
 		/* has something changed in the meantime ? */
-		if((rc->pages_per_area =3D in->pages_per_area) &&
+		if ((rc->pages_per_area =3D in->pages_per_area) &&
 		   (rc->nr_areas =3D in->nr_areas)) {
 			break;
 		}
@@ -394,7 +394,7 @@ debug_info_copy(debug_info_t* in, int mode)
=20
 	for (i =3D 0; i < in->nr_areas; i++)
 		for (j =3D 0; j < in->pages_per_area; j++)
-			memcpy(rc->areas[i][j], in->areas[i][j],PAGE_SIZE);
+			memcpy(rc->areas[i][j], in->areas[i][j], PAGE_SIZE);
 out:
         spin_unlock_irqrestore(&in->lock, flags);
         return rc;
@@ -431,12 +431,14 @@ debug_info_put(debug_info_t *db_info)
 			debugfs_remove(db_info->debugfs_entries[i]);
 		}
 		debugfs_remove(db_info->debugfs_root_entry);
-		if(db_info =3D debug_area_first)
+		if (db_info =3D debug_area_first)
 			debug_area_first =3D db_info->next;
-		if(db_info =3D debug_area_last)
+		if (db_info =3D debug_area_last)
 			debug_area_last =3D db_info->prev;
-		if(db_info->prev) db_info->prev->next =3D db_info->next;
-		if(db_info->next) db_info->next->prev =3D db_info->prev;
+		if (db_info->prev)
+			db_info->prev->next =3D db_info->next;
+		if (db_info->next)
+			db_info->next->prev =3D db_info->prev;
 		debug_info_free(db_info);
 	}
 }
@@ -453,10 +455,13 @@ debug_format_entry(file_private_info_t *p_info)
 	struct debug_view *view =3D p_info->view;
 	debug_entry_t *act_entry;
 	size_t len =3D 0;
-	if(p_info->act_entry =3D DEBUG_PROLOG_ENTRY){
+
+	if (p_info->act_entry =3D DEBUG_PROLOG_ENTRY) {
 		/* print prolog */
         	if (view->prolog_proc)
-                	len +=3D view->prolog_proc(id_snap,view,p_info->temp_buf);
+			len +=3D view->prolog_proc(id_snap,
+						 view,
+						 p_info->temp_buf);
 		goto out;
 	}
 	if (!id_snap->areas) /* this is true, if we have a prolog only view */
@@ -487,25 +492,25 @@ debug_next_entry(file_private_info_t *p_info)
 	debug_info_t *id;
=20
 	id =3D p_info->debug_info_snap;
-	if(p_info->act_entry =3D DEBUG_PROLOG_ENTRY){
+	if (p_info->act_entry =3D DEBUG_PROLOG_ENTRY) {
 		p_info->act_entry =3D 0;
 		p_info->act_page  =3D 0;
 		goto out;
 	}
-	if(!id->areas)
+	if (!id->areas)
 		return 1;
 	p_info->act_entry +=3D id->entry_size;
 	/* switch to next page, if we reached the end of the page  */
-	if (p_info->act_entry > (PAGE_SIZE - id->entry_size)){
+	if (p_info->act_entry > (PAGE_SIZE - id->entry_size)) {
 		/* next page */
 		p_info->act_entry =3D 0;
 		p_info->act_page +=3D 1;
-		if((p_info->act_page % id->pages_per_area) =3D 0) {
+		if ((p_info->act_page % id->pages_per_area) =3D 0) {
 			/* next area */
         		p_info->act_area++;
 			p_info->act_page=3D0;
 		}
-        	if(p_info->act_area >=3D id->nr_areas)
+		if (p_info->act_area >=3D id->nr_areas)
 			return 1;
 	}
 out:
@@ -531,10 +536,10 @@ debug_output(struct file *file,		/* file descriptor */
 	p_info =3D ((file_private_info_t *) file->private_data);
 	if (*offset !=3D p_info->offset)=20
 		return -EPIPE;
-	if(p_info->act_area >=3D p_info->debug_info_snap->nr_areas)
+	if (p_info->act_area >=3D p_info->debug_info_snap->nr_areas)
 		return 0;
 	entry_offset =3D p_info->act_entry_offset;
-	while(count < len){
+	while (count < len) {
 		int formatted_line_size;
 		int formatted_line_residue;
 		int user_buf_residue;
@@ -544,16 +549,16 @@ debug_output(struct file *file,		/* file descriptor */
 		formatted_line_residue =3D formatted_line_size - entry_offset;
 		user_buf_residue =3D len-count;
 		copy_size =3D min(user_buf_residue, formatted_line_residue);
-		if(copy_size){
+		if (copy_size) {
 			if (copy_to_user(user_buf + count, p_info->temp_buf
 					+ entry_offset, copy_size))
 				return -EFAULT;
 			count +=3D copy_size;
 			entry_offset +=3D copy_size;
 		}
-		if(copy_size =3D formatted_line_residue){
+		if (copy_size =3D formatted_line_residue) {
 			entry_offset =3D 0;
-			if(debug_next_entry(p_info))
+			if (debug_next_entry(p_info))
 				goto out;
 		}
 	}
@@ -624,20 +629,20 @@ found:
 	/* To copy all the areas is only needed, if we have a view which  */
 	/* formats the debug areas. */
=20
-	if(!debug_info->views[i]->format_proc &&
-		!debug_info->views[i]->header_proc){
+	if (!debug_info->views[i]->format_proc &&
+		!debug_info->views[i]->header_proc) {
 		debug_info_snapshot =3D debug_info_copy(debug_info, NO_AREAS);
 	} else {
 		debug_info_snapshot =3D debug_info_copy(debug_info, ALL_AREAS);
 	}
=20
-	if(!debug_info_snapshot){
+	if (!debug_info_snapshot) {
 		rc =3D -ENOMEM;
 		goto out;
 	}
 	p_info =3D kmalloc(sizeof(file_private_info_t),
 						GFP_KERNEL);
-	if(!p_info){
+	if (!p_info) {
 		debug_info_free(debug_info_snapshot);
 		rc =3D -ENOMEM;
 		goto out;
@@ -669,7 +674,7 @@ debug_close(struct inode *inode, struct file *file)
 {
 	file_private_info_t *p_info;
 	p_info =3D (file_private_info_t *) file->private_data;
-	if(p_info->debug_info_snap)
+	if (p_info->debug_info_snap)
 		debug_info_free(p_info->debug_info_snap);
 	debug_info_put(p_info->debug_info_org);
 	kfree(file->private_data);
@@ -699,7 +704,7 @@ debug_info_t *debug_register_mode(const char *name, int=
 pages_per_area,
         /* create new debug_info */
=20
 	rc =3D debug_info_create(name, pages_per_area, nr_areas, buf_size, mode);
-	if(!rc)=20
+	if (!rc)
 		goto out;
 	debug_register_view(rc, &debug_level_view);
         debug_register_view(rc, &debug_flush_view);
@@ -754,11 +759,11 @@ debug_set_size(debug_info_t* id, int nr_areas, int pa=
ges_per_area)
 {
 	unsigned long flags;
 	debug_entry_t *** new_areas;
-	int rc=3D0;
+	int rc =3D 0;
=20
-	if(!id || (nr_areas <=3D 0) || (pages_per_area < 0))
+	if (!id || (nr_areas <=3D 0) || (pages_per_area < 0))
 		return -EINVAL;
-	if(pages_per_area > 0){
+	if (pages_per_area > 0) {
 		new_areas =3D debug_areas_alloc(pages_per_area, nr_areas);
 		if(!new_areas) {
 			pr_info("Allocating memory for %i pages failed\n",
@@ -769,16 +774,16 @@ debug_set_size(debug_info_t* id, int nr_areas, int pa=
ges_per_area)
 	} else {
 		new_areas =3D NULL;
 	}
-	spin_lock_irqsave(&id->lock,flags);
+	spin_lock_irqsave(&id->lock, flags);
 	debug_areas_free(id);
 	id->areas =3D new_areas;
 	id->nr_areas =3D nr_areas;
 	id->pages_per_area =3D pages_per_area;
 	id->active_area =3D 0;
-	memset(id->active_entries,0,sizeof(int)*id->nr_areas);
-	memset(id->active_pages, 0, sizeof(int)*id->nr_areas);
-	spin_unlock_irqrestore(&id->lock,flags);
-	pr_info("%s: set new size (%i pages)\n" ,id->name, pages_per_area);
+	memset(id->active_entries, 0, sizeof(int) * id->nr_areas);
+	memset(id->active_pages, 0, sizeof(int) * id->nr_areas);
+	spin_unlock_irqrestore(&id->lock, flags);
+	pr_info("%s: set new size (%i pages)\n", id->name, pages_per_area);
 out:
 	return rc;
 }
@@ -794,17 +799,17 @@ debug_set_level(debug_info_t* id, int new_level)
 	unsigned long flags;
 	if(!id)
 		return;=09
-	spin_lock_irqsave(&id->lock,flags);
-        if(new_level =3D DEBUG_OFF_LEVEL){
+	spin_lock_irqsave(&id->lock, flags);
+	if (new_level =3D DEBUG_OFF_LEVEL) {
                 id->level =3D DEBUG_OFF_LEVEL;
-		pr_info("%s: switched off\n",id->name);
+		pr_info("%s: switched off\n", id->name);
         } else if ((new_level > DEBUG_MAX_LEVEL) || (new_level < 0)) {
 		pr_info("%s: level %i is out of range (%i - %i)\n",
                         id->name, new_level, 0, DEBUG_MAX_LEVEL);
         } else {
                 id->level =3D new_level;
         }
-	spin_unlock_irqrestore(&id->lock,flags);
+	spin_unlock_irqrestore(&id->lock, flags);
 }
 EXPORT_SYMBOL(debug_set_level);
=20
@@ -996,10 +1001,10 @@ EXPORT_SYMBOL(debug_exception_common);
 static inline int
 debug_count_numargs(char *string)
 {
-	int numargs=3D0;
+	int numargs =3D 0;
=20
 	while (*string)
-		if(*string++=3D'%')
+		if (*string++ =3D '%')
 			numargs++;
 	return(numargs);
 }
@@ -1019,7 +1024,7 @@ __debug_sprintf_event(debug_info_t *id, int level, ch=
ar *string, ...)
=20
 	if (!debug_active || !id->areas)
 		return NULL;
-	numargs=DEbug_count_numargs(string);
+	numargs =3D debug_count_numargs(string);
=20
 	if (debug_critical) {
 		if (!spin_trylock_irqsave(&id->lock, flags))
@@ -1027,11 +1032,13 @@ __debug_sprintf_event(debug_info_t *id, int level, =
char *string, ...)
 	} else
 		spin_lock_irqsave(&id->lock, flags);
 	active =3D get_active_entry(id);
-	curr_event=3D(debug_sprintf_entry_t *) DEBUG_DATA(active);
+	curr_event =3D (debug_sprintf_entry_t *) DEBUG_DATA(active);
 	va_start(ap,string);
-	curr_event->string=3Dstring;
-	for(idx=3D0;idx<min(numargs,(int)(id->buf_size / sizeof(long))-1);idx++)
-		curr_event->args[idx]=3Dva_arg(ap,long);
+	curr_event->string =3D string;
+	for (idx =3D 0;
+	     idx < min(numargs, (int)(id->buf_size / sizeof(long)) - 1);
+	     idx++)
+		curr_event->args[idx] =3D va_arg(ap, long);
 	va_end(ap);
 	debug_finish_entry(id, active, level, 0);
 	spin_unlock_irqrestore(&id->lock, flags);
@@ -1056,7 +1063,7 @@ __debug_sprintf_exception(debug_info_t *id, int level=
, char *string, ...)
 	if (!debug_active || !id->areas)
 		return NULL;
=20
-	numargs=DEbug_count_numargs(string);
+	numargs =3D debug_count_numargs(string);
=20
 	if (debug_critical) {
 		if (!spin_trylock_irqsave(&id->lock, flags))
@@ -1064,11 +1071,13 @@ __debug_sprintf_exception(debug_info_t *id, int lev=
el, char *string, ...)
 	} else
 		spin_lock_irqsave(&id->lock, flags);
 	active =3D get_active_entry(id);
-	curr_event=3D(debug_sprintf_entry_t *)DEBUG_DATA(active);
-	va_start(ap,string);
-	curr_event->string=3Dstring;
-	for(idx=3D0;idx<min(numargs,(int)(id->buf_size / sizeof(long))-1);idx++)
-		curr_event->args[idx]=3Dva_arg(ap,long);
+	curr_event =3D (debug_sprintf_entry_t *) DEBUG_DATA(active);
+	va_start(ap, string);
+	curr_event->string =3D string;
+	for (idx =3D 0;
+	     idx < min(numargs, (int)(id->buf_size / sizeof(long)) - 1);
+	     idx++)
+		curr_event->args[idx] =3D va_arg(ap, long);
 	va_end(ap);
 	debug_finish_entry(id, active, level, 1);
 	spin_unlock_irqrestore(&id->lock, flags);
@@ -1214,26 +1223,26 @@ debug_input_pages_fn(debug_info_t * id, struct debu=
g_view *view,
 			size_t user_len, loff_t * offset)
 {
 	char *str;
-	int rc,new_pages;
+	int rc, new_pages;
=20
 	if (user_len > 0x10000)
                 user_len =3D 0x10000;
-	if (*offset !=3D 0){
+	if (*offset !=3D 0) {
 		rc =3D -EPIPE;
 		goto out;
 	}
-	str =3D debug_get_user_string(user_buf,user_len);
-	if(IS_ERR(str)){
+	str =3D debug_get_user_string(user_buf, user_len);
+	if (IS_ERR(str)) {
 		rc =3D PTR_ERR(str);
 		goto out;
 	}
 	new_pages =3D debug_get_uint(str);
-	if(new_pages < 0){
+	if (new_pages < 0) {
 		rc =3D -EINVAL;
 		goto free_str;
 	}
-	rc =3D debug_set_size(id,id->nr_areas, new_pages);
-	if(rc !=3D 0){
+	rc =3D debug_set_size(id, id->nr_areas, new_pages);
+	if (rc !=3D 0) {
 		rc =3D -EINVAL;
 		goto free_str;
 	}
@@ -1271,27 +1280,27 @@ debug_input_level_fn(debug_info_t * id, struct debu=
g_view *view,
 			size_t user_len, loff_t * offset)
 {
 	char *str;
-	int rc,new_level;
+	int rc, new_level;
=20
 	if (user_len > 0x10000)
                 user_len =3D 0x10000;
-	if (*offset !=3D 0){
+	if (*offset !=3D 0) {
 		rc =3D -EPIPE;
 		goto out;
 	}
-	str =3D debug_get_user_string(user_buf,user_len);
-	if(IS_ERR(str)){
+	str =3D debug_get_user_string(user_buf, user_len);
+	if (IS_ERR(str)) {
 		rc =3D PTR_ERR(str);
 		goto out;
 	}
-	if(str[0] =3D '-'){
+	if (str[0] =3D '-') {
 		debug_set_level(id, DEBUG_OFF_LEVEL);
 		rc =3D user_len;
 		goto free_str;
 	} else {
 		new_level =3D debug_get_uint(str);
 	}
-	if(new_level < 0) {
+	if (new_level < 0) {
 		pr_warn("%s is not a valid level for a debug feature\n", str);
 		rc =3D -EINVAL;
 	} else {
@@ -1313,12 +1322,12 @@ out:
 static void debug_flush(debug_info_t* id, int area)
 {
         unsigned long flags;
-        int i,j;
+	int i, j;
=20
-        if(!id || !id->areas)
+	if (!id || !id->areas)
                 return;
-        spin_lock_irqsave(&id->lock,flags);
-        if(area =3D DEBUG_FLUSH_ALL){
+	spin_lock_irqsave(&id->lock, flags);
+	if (area =3D DEBUG_FLUSH_ALL) {
                 id->active_area =3D 0;
                 memset(id->active_entries, 0, id->nr_areas * sizeof(int));
                 for (i =3D 0; i < id->nr_areas; i++) {
@@ -1326,13 +1335,13 @@ static void debug_flush(debug_info_t* id, int area)
 			for (j =3D 0; j < id->pages_per_area; j++)
                         	memset(id->areas[i][j], 0, PAGE_SIZE);
 		}
-        } else if(area >=3D 0 && area < id->nr_areas) {
+	} else if (area >=3D 0 && area < id->nr_areas) {
                 id->active_entries[area] =3D 0;
 		id->active_pages[area] =3D 0;
 		for (i =3D 0; i < id->pages_per_area; i++)
-                	memset(id->areas[area][i],0,PAGE_SIZE);
+			memset(id->areas[area][i], 0, PAGE_SIZE);
         }
-        spin_unlock_irqrestore(&id->lock,flags);
+	spin_unlock_irqrestore(&id->lock, flags);
 }
=20
 /*
@@ -1349,15 +1358,15 @@ debug_input_flush_fn(debug_info_t * id, struct debu=
g_view *view,
=20
 	if (user_len > 0x10000)
                 user_len =3D 0x10000;
-        if (*offset !=3D 0){
+	if (*offset !=3D 0) {
 		rc =3D -EPIPE;
                 goto out;
 	}
-        if (copy_from_user(input_buf, user_buf, 1)){
+	if (copy_from_user(input_buf, user_buf, 1)) {
                 rc =3D -EFAULT;
                 goto out;
         }
-        if(input_buf[0] =3D '-') {=20
+	if (input_buf[0] =3D '-') {
                 debug_flush(id, DEBUG_FLUSH_ALL);
                 goto out;
         }
@@ -1386,7 +1395,7 @@ debug_raw_header_fn(debug_info_t * id, struct debug_v=
iew *view,
         int rc;
=20
 	rc =3D sizeof(debug_entry_t);
-	memcpy(out_buf,entry,sizeof(debug_entry_t));
+	memcpy(out_buf, entry, sizeof(debug_entry_t));
         return rc;
 }
=20
@@ -1477,9 +1486,9 @@ debug_sprintf_format_fn(debug_info_t * id, struct deb=
ug_view *view,
 	/* count of longs fit into one entry */
 	num_longs =3D id->buf_size /  sizeof(long);=20
=20
-	if(num_longs < 1)
+	if (num_longs < 1)
 		goto out; /* bufsize of entry too small */
-	if(num_longs =3D 1) {
+	if (num_longs =3D 1) {
 		/* no args, we use only the string */
 		strcpy(out_buf, curr_event->string);
 		rc =3D strlen(curr_event->string);
@@ -1489,9 +1498,9 @@ debug_sprintf_format_fn(debug_info_t * id, struct deb=
ug_view *view,
 	/* number of arguments used for sprintf (without the format string) */
 	num_used_args   =3D min(DEBUG_SPRINTF_MAX_ARGS, (num_longs - 1));
=20
-	memset(index,0, DEBUG_SPRINTF_MAX_ARGS * sizeof(int));
+	memset(index, 0, DEBUG_SPRINTF_MAX_ARGS * sizeof(int));
=20
-	for(i =3D 0; i < num_used_args; i++)
+	for (i =3D 0; i < num_used_args; i++)
 		index[i] =3D i;
=20
 	rc =3D  sprintf(out_buf, curr_event->string, curr_event->args[index[0]],
--=20
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
