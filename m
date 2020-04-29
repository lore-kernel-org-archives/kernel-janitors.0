From: Matthew Wilcox <willy@infradead.org>
Date: Wed, 29 Apr 2020 13:08:35 +0000
Subject: Re: [PATCH -next] ipc: use GFP_ATOMIC under spin lock
Message-Id: <20200429130835.GS29705@bombadil.infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200428034736.27850-1-weiyongjun1@huawei.com>
 <20200428111403.GJ29705@bombadil.infradead.org>
 <a0f82756-3e51-d960-d901-e4cc3c7c4c19@colorfullife.com>
In-Reply-To: <a0f82756-3e51-d960-d901-e4cc3c7c4c19@colorfullife.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Manfred Spraul <manfred@colorfullife.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Waiman Long <longman@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Alexey Dobriyan <adobriyan@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Apr 29, 2020 at 07:22:13AM +0200, Manfred Spraul wrote:
> Hello together,
>=20
> On 4/28/20 1:14 PM, Matthew Wilcox wrote:
> > On Tue, Apr 28, 2020 at 03:47:36AM +0000, Wei Yongjun wrote:
> > > The function ipc_id_alloc() is called from ipc_addid(), in which
> > > a spin lock is held, so we should use GFP_ATOMIC instead.
> > >=20
> > > Fixes: de5738d1c364 ("ipc: convert ipcs_idr to XArray")
> > > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > I see why you think that, but it's not true.  Yes, we hold a spinlock, =
but
> > the spinlock is in an object which is not reachable from any other CPU.
>=20
> Is it really allowed that spin_lock()/spin_unlock may happen on different
> cpus?
>=20
> CPU1: spin_lock()
>=20
> CPU1: schedule() -> sleeps
>=20
> CPU2: -> schedule() returns
>=20
> CPU2: spin_unlock().

I think that is allowed, but I'm not an expert in the implementations.

> > Converting to GFP_ATOMIC is completely wrong.
>=20
> What is your solution proposal?
>=20
> xa_store() also gets a gfp_ flag. Thus even splitting _alloc() and _store=
()
> won't help
>=20
> =A0=A0=A0 xa_alloc(,entry=3DNULL,)
> =A0=A0=A0 new->seq =3D ...
> =A0=A0=A0 spin_lock();
> =A0=A0=A0 xa_store(,entry=3Dnew,GFP_KERNEL);

While it takes GFP flags, it won't do any allocation if it's overwriting
an allocated entry.

diff --git a/ipc/util.c b/ipc/util.c
index 0f6b0e0aa17e..b929ab0072a5 100644
--- a/ipc/util.c
+++ b/ipc/util.c
@@ -19,8 +19,8 @@
  *
  * General sysv ipc locking scheme:
  *	rcu_read_lock()
- *          obtain the ipc object (kern_ipc_perm) by looking up the id in =
an idr
- *	    tree.
+ *          obtain the ipc object (kern_ipc_perm) by looking up the id in =
an
+ *	    xarray.
  *	    - perform initial checks (capabilities, auditing and permission,
  *	      etc).
  *	    - perform read-only operations, such as INFO command, that
@@ -209,14 +209,14 @@ static inline int ipc_id_alloc(struct ipc_ids *ids, s=
truct kern_ipc_perm *new)
 	u32 idx;
 	int err;
=20
+	xa_lock(&ids->ipcs);
+
 	if (get_restore_id(ids) < 0) {
 		int max_idx;
=20
 		max_idx =3D max(ids->in_use*3/2, ipc_min_cycle);
 		max_idx =3D min(max_idx, ipc_mni) - 1;
=20
-		xa_lock(&ids->ipcs);
-
 		err =3D __xa_alloc_cyclic(&ids->ipcs, &idx, NULL,
 				XA_LIMIT(0, max_idx), &ids->next_idx,
 				GFP_KERNEL);
@@ -224,24 +224,31 @@ static inline int ipc_id_alloc(struct ipc_ids *ids, s=
truct kern_ipc_perm *new)
 			ids->seq++;
 			if (ids->seq >=3D ipcid_seq_max())
 				ids->seq =3D 0;
+			err =3D 0;
 		}
=20
-		if (err >=3D 0) {
+		if (!err) {
 			new->seq =3D ids->seq;
 			new->id =3D (new->seq << ipcmni_seq_shift()) + idx;
-			/* xa_store contains a write barrier */
-			__xa_store(&ids->ipcs, idx, new, GFP_KERNEL);
 		}
-
-		xa_unlock(&ids->ipcs);
 	} else {
 		new->id =3D get_restore_id(ids);
 		new->seq =3D ipcid_to_seqx(new->id);
 		idx =3D ipcid_to_idx(new->id);
-		err =3D xa_insert(&ids->ipcs, idx, new, GFP_KERNEL);
+		err =3D __xa_insert(&ids->ipcs, idx, NULL, GFP_KERNEL);
 		set_restore_id(ids, -1);
 	}
=20
+	/*
+	 * Hold the spinlock so that nobody else can access the object
+	 * once they can find it.  xa_store contains a write barrier so
+	 * all previous stores to 'new' will be visible.
+	 */
+	spin_lock(&new->lock);
+	if (!err)
+		__xa_store(&ids->ipcs, idx, new, GFP_NOWAIT);
+	xa_unlock(&ids->ipcs);
+
 	if (err =3D -EBUSY)
 		return -ENOSPC;
 	if (err < 0)
@@ -255,7 +262,7 @@ static inline int ipc_id_alloc(struct ipc_ids *ids, str=
uct kern_ipc_perm *new)
  * @new: new ipc permission set
  * @limit: limit for the number of used ids
  *
- * Add an entry 'new' to the ipc ids idr. The permissions object is
+ * Add an entry 'new' to the ipc ids. The permissions object is
  * initialised and the first free entry is set up and the index assigned
  * is returned. The 'new' entry is returned in a locked state on success.
  *
@@ -270,7 +277,7 @@ int ipc_addid(struct ipc_ids *ids, struct kern_ipc_perm=
 *new, int limit)
 	kgid_t egid;
 	int idx;
=20
-	/* 1) Initialize the refcount so that ipc_rcu_putref works */
+	/* Initialize the refcount so that ipc_rcu_putref works */
 	refcount_set(&new->refcount, 1);
=20
 	if (limit > ipc_mni)
@@ -279,12 +286,7 @@ int ipc_addid(struct ipc_ids *ids, struct kern_ipc_per=
m *new, int limit)
 	if (ids->in_use >=3D limit)
 		return -ENOSPC;
=20
-	/*
-	 * 2) Hold the spinlock so that nobody else can access the object
-	 * once they can find it
-	 */
 	spin_lock_init(&new->lock);
-	spin_lock(&new->lock);
 	current_euid_egid(&euid, &egid);
 	new->cuid =3D new->uid =3D euid;
 	new->gid =3D new->cgid =3D egid;
@@ -588,7 +590,7 @@ void ipc64_perm_to_ipc_perm(struct ipc64_perm *in, stru=
ct ipc_perm *out)
  * @ids: ipc identifier set
  * @id: ipc id to look for
  *
- * Look for an id in the ipc ids idr and return associated ipc object.
+ * Look for an id in the ipc ids and return associated ipc object.
  *
  * Call inside the RCU critical section.
  * The ipc object is *not* locked on exit.
