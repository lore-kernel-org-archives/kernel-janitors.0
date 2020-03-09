From: Walter Harms <wharms@bfs.de>
Date: Mon, 09 Mar 2020 08:40:28 +0000
Subject: AW: [PATCH] bfs: prevent underflow in bfs_find_entry()
Message-Id: <ba294b1d861142ca8f7b204356009dd0@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200307060808.6nfyqnp2woq7d3cv@kili.mountain>
In-Reply-To: <20200307060808.6nfyqnp2woq7d3cv@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, "Tigran A. Aivazian" <aivazian.tigran@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>


________________________________________
Von: kernel-janitors-owner@vger.kernel.org <kernel-janitors-owner@vger.kern=
el.org> im Auftrag von Dan Carpenter <dan.carpenter@oracle.com>
Gesendet: Samstag, 7. M=E4rz 2020 07:08
An: Tigran A. Aivazian
Cc: linux-kernel@vger.kernel.org; kernel-janitors@vger.kernel.org
Betreff: [PATCH] bfs: prevent underflow in bfs_find_entry()

We check if "namelen" is larger than BFS_NAMELEN but we don't check
if it's less than zero so it causes a static checker.

    fs/bfs/dir.c:346 bfs_find_entry() warn: no lower bound on 'namelen'

It's nicer to make it unsigned anyway.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/bfs/dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/bfs/dir.c b/fs/bfs/dir.c
index d8dfe3a0cb39..46a2663e5eb2 100644
--- a/fs/bfs/dir.c
+++ b/fs/bfs/dir.c
@@ -326,7 +326,7 @@ static struct buffer_head *bfs_find_entry(struct inode =
*dir,
        struct buffer_head *bh =3D NULL;
        struct bfs_dirent *de;
        const unsigned char *name =3D child->name;
-       int namelen =3D child->len;
+       unsigned int namelen =3D child->len;

        *res_dir =3D NULL;
        if (namelen > BFS_NAMELEN)

hi Dan,
the namelen usage is fishy. It goes into bfs_namecmp()
where it is checked for namelen < BFS_NAMELEN, leaving
only the case =3D=3D.
bfs_namecmp() expects an int, so i would expect a warning.
Perhaps in this case it is better to change the if() into

if ( namelen <=3D 0 ||  namelen >=3D BFS_NAMELEN)
 return NULL;

note:  bfs_add_entry has the same "issue"

jm2c,
re,
 wh

--
2.11.0
