Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F35ECAAD3
	for <kernel-janitors@archiver.kernel.org>; Wed, 31 Aug 2022 09:00:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbiHaJAr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 31 Aug 2022 05:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231299AbiHaJAq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 31 Aug 2022 05:00:46 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A470696E4
        for <kernel-janitors@vger.kernel.org>; Wed, 31 Aug 2022 02:00:44 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 8C8061FAC9;
        Wed, 31 Aug 2022 09:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1661936443; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=p/oVIA+02ZNLgcIWGlKLNnrUvPgmeyUP7fJfXRQ5fGM=;
        b=WQ7AtWjHyt0od3QrJi0n4uOGN3PvCOyc8ptCWv3586TsH6LTAb6X6DMfDxWhN6P8Tssit1
        rE+wm+aWwhhvtROaXorCCq950pyFzTiis9Qu4K5BZNJ0rproEsEdK3t2bJ1mq6FoepB4sb
        wE8td7qcQ5sY4i+v655J6Dy1RDPezzE=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 703CE1332D;
        Wed, 31 Aug 2022 09:00:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 4VU1GjsjD2M4OQAAMHmgww
        (envelope-from <mkoutny@suse.com>); Wed, 31 Aug 2022 09:00:43 +0000
Date:   Wed, 31 Aug 2022 11:00:42 +0200
From:   Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Tejun Heo <tj@kernel.org>, kernel-janitors@vger.kernel.org
Subject: Re: [bug report] cgroup: Honor caller's cgroup NS when resolving path
Message-ID: <20220831090042.GB1845@blackbody.suse.cz>
References: <Yw8I2ef6OvlMaGEF@kili>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="v9Ux+11Zm5mwPlX6"
Content-Disposition: inline
In-Reply-To: <Yw8I2ef6OvlMaGEF@kili>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--v9Ux+11Zm5mwPlX6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Dan Carpenter.

On Wed, Aug 31, 2022 at 10:08:09AM +0300, Dan Carpenter <dan.carpenter@orac=
le.com> wrote:
> The kernfs_walk_and_get() function calls down_read() (a semaphore) so
> it can't be called while holding a spinlock.

Thanks for the report (I should have looked deeper into
kernfs_walk_and_get).

I'd propose a patch like bellow.

Are you OK with adding=20
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
as I'll send the proposed patch to public mailing lists.

Thanks,
Michal

----8<----
=46rom e2de5c76969e5ac4c7fe5e00a54229cbe59bd86a Mon Sep 17 00:00:00 2001
=46rom: =3D?UTF-8?q?Michal=3D20Koutn=3DC3=3DBD?=3D <mkoutny@suse.com>
Date: Wed, 31 Aug 2022 10:36:19 +0200
Subject: [PATCH] cgroup: Reorganize css_set_lock and kernfs path processing
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The commit 74e4b956eb1c incorrectly wrapped kernfs_walk_and_get under
css_set_lock. That lock is needed by __cset_cgroup_from_root to ensure
stable cset->cgrp_links. The returned cgroup object is pinned by the
css_set. Kernfs code that traverses paths to this cgroup does not need
css_set_lock (lowest cgroup pins its ancestry and cgroup pins its
cgroup->kn).

TODO root(s) of named v1 hierarchies

Fixes: 74e4b956eb1c: ("cgroup: Honor caller's cgroup NS when resolving path=
")
Reported-by: FIXME
Signed-off-by: Michal Koutn=FD <mkoutny@suse.com>
---
 kernel/cgroup/cgroup.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index 0005de2e2ed9..0f91dc6d16cc 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -1391,11 +1391,16 @@ static void cgroup_destroy_root(struct cgroup_root =
*root)
 	cgroup_free_root(root);
 }
=20
+/*
+ * Returned cgroup is without refcount but it's valid as long as cset pins=
 it.
+ */
 static inline struct cgroup *__cset_cgroup_from_root(struct css_set *cset,
 					    struct cgroup_root *root)
 {
 	struct cgroup *res_cgroup =3D NULL;
=20
+	lockdep_assert_held(&css_set_lock);
+
 	if (cset =3D=3D &init_css_set) {
 		res_cgroup =3D &root->cgrp;
 	} else if (root =3D=3D &cgrp_dfl_root) {
@@ -1426,8 +1431,6 @@ current_cgns_cgroup_from_root(struct cgroup_root *roo=
t)
 	struct cgroup *res =3D NULL;
 	struct css_set *cset;
=20
-	lockdep_assert_held(&css_set_lock);
-
 	rcu_read_lock();
=20
 	cset =3D current->nsproxy->cgroup_ns->root_cset;
@@ -1446,7 +1449,6 @@ static struct cgroup *cset_cgroup_from_root(struct cs=
s_set *cset,
 	struct cgroup *res =3D NULL;
=20
 	lockdep_assert_held(&cgroup_mutex);
-	lockdep_assert_held(&css_set_lock);
=20
 	res =3D __cset_cgroup_from_root(cset, root);
=20
@@ -1861,8 +1863,8 @@ int cgroup_show_path(struct seq_file *sf, struct kern=
fs_node *kf_node,
=20
 	spin_lock_irq(&css_set_lock);
 	ns_cgroup =3D current_cgns_cgroup_from_root(kf_cgroot);
-	len =3D kernfs_path_from_node(kf_node, ns_cgroup->kn, buf, PATH_MAX);
 	spin_unlock_irq(&css_set_lock);
+	len =3D kernfs_path_from_node(kf_node, ns_cgroup->kn, buf, PATH_MAX);
=20
 	if (len >=3D PATH_MAX)
 		len =3D -ERANGE;
@@ -6649,8 +6651,8 @@ struct cgroup *cgroup_get_from_path(const char *path)
=20
 	spin_lock_irq(&css_set_lock);
 	root_cgrp =3D current_cgns_cgroup_from_root(&cgrp_dfl_root);
-	kn =3D kernfs_walk_and_get(root_cgrp->kn, path);
 	spin_unlock_irq(&css_set_lock);
+	kn =3D kernfs_walk_and_get(root_cgrp->kn, path);
 	if (!kn)
 		goto out;
=20

base-commit: c0f2df49cf2471289d5aabf16f50ac26eb268f7d
--=20
2.37.0


--v9Ux+11Zm5mwPlX6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQTrXXag4J0QvXXBmkMkDQmsBEOquQUCYw8jIgAKCRAkDQmsBEOq
uXdYAP9B/FIwud7nyt24240WtElIjDJF+liU4mZIPb9kLtlCCwD/S194UKJQoXDc
89mLfM+g5k9gzhXhaF0xWLq2x8oxdQw=
=q0Qf
-----END PGP SIGNATURE-----

--v9Ux+11Zm5mwPlX6--
