From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Sat, 04 Mar 2006 19:09:45 +0000
Subject: [KJ] [Patch] kzalloc() conversion in drivers/block
Message-Id: <1141499385.30193.16.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============036948241250825742=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140815848.26064.4.camel@alice>
In-Reply-To: <1140815848.26064.4.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============036948241250825742==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch converts drivers/block to kzalloc usage.
Compile tested with allyesconfig.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/block/ll_rw_blk.c.orig	2006-03-04 19:20:21.000000000 +0100
+++ linux-2.6.16-rc5-mm1/block/ll_rw_blk.c	2006-03-04 19:21:02.000000000 +0100
@@ -903,17 +903,15 @@ init_tag_map(request_queue_t *q, struct 
 				__FUNCTION__, depth);
 	}
 
-	tag_index = kmalloc(depth * sizeof(struct request *), GFP_ATOMIC);
+	tag_index = kcalloc(depth, sizeof(struct request *), GFP_ATOMIC);
 	if (!tag_index)
 		goto fail;
 
 	nr_ulongs = ALIGN(depth, BITS_PER_LONG) / BITS_PER_LONG;
-	tag_map = kmalloc(nr_ulongs * sizeof(unsigned long), GFP_ATOMIC);
+	tag_map = kcalloc(nr_ulongs, sizeof(unsigned long), GFP_ATOMIC);
 	if (!tag_map)
 		goto fail;
 
-	memset(tag_index, 0, depth * sizeof(struct request *));
-	memset(tag_map, 0, nr_ulongs * sizeof(unsigned long));
 	tags->real_max_depth = depth;
 	tags->max_depth = depth;
 	tags->tag_index = tag_index;
--- linux-2.6.16-rc5-mm1/block/scsi_ioctl.c.orig	2006-03-04 19:21:09.000000000 +0100
+++ linux-2.6.16-rc5-mm1/block/scsi_ioctl.c	2006-03-04 19:21:52.000000000 +0100
@@ -378,11 +378,9 @@ static int sg_scsi_ioctl(struct file *fi
 
 	bytes = max(in_len, out_len);
 	if (bytes) {
-		buffer = kmalloc(bytes, q->bounce_gfp | GFP_USER| __GFP_NOWARN);
+		buffer = kzalloc(bytes, q->bounce_gfp | GFP_USER| __GFP_NOWARN);
 		if (!buffer)
 			return -ENOMEM;
-
-		memset(buffer, 0, bytes);
 	}
 
 	rq = blk_get_request(q, in_len ? WRITE : READ, __GFP_WAIT);
--- linux-2.6.16-rc5-mm1/block/cfq-iosched.c.orig	2006-03-04 19:22:27.000000000 +0100
+++ linux-2.6.16-rc5-mm1/block/cfq-iosched.c	2006-03-04 19:22:39.000000000 +0100
@@ -2158,12 +2158,10 @@ static int cfq_init_queue(request_queue_
 	struct cfq_data *cfqd;
 	int i;
 
-	cfqd = kmalloc(sizeof(*cfqd), GFP_KERNEL);
+	cfqd = kzalloc(sizeof(*cfqd), GFP_KERNEL);
 	if (!cfqd)
 		return -ENOMEM;
 
-	memset(cfqd, 0, sizeof(*cfqd));
-
 	for (i = 0; i < CFQ_PRIO_LISTS; i++)
 		INIT_LIST_HEAD(&cfqd->rr_list[i]);
 



--===============036948241250825742==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============036948241250825742==--
