From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 Jul 2013 06:05:46 +0000
Subject: [patch -next] bcache: check for allocation failures
Message-Id: <20130705060307.GB14443@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Kent Overstreet <kmo-PEzghdH756F8UrSeD/g0lQ@public.gmane.org>, Gabriel de Perthuis <g2p.code-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Neil Brown <neilb-l3A5Bk7waGM@public.gmane.org>, linux-bcache-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-raid-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

There is a missing NULL check after the kzalloc().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/md/bcache/sysfs.c b/drivers/md/bcache/sysfs.c
index 48f0353..4fe6ab2 100644
--- a/drivers/md/bcache/sysfs.c
+++ b/drivers/md/bcache/sysfs.c
@@ -232,6 +232,8 @@ STORE(__cached_dev)
 			bch_uuid_write(dc->disk.c);
 		}
 		env =3D kzalloc(sizeof(struct kobj_uevent_env), GFP_KERNEL);
+		if (!env)
+			return -ENOMEM;
 		add_uevent_var(env, "DRIVER=BCache");
 		add_uevent_var(env, "CACHED_UUID=3D%pU", dc->sb.uuid),
 		add_uevent_var(env, "CACHED_LABEL=3D%s", buf);
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
