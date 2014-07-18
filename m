From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Fri, 18 Jul 2014 15:31:57 +0000
Subject: [PATCH 2/5] net/rxrpc/ar-key.c: drop negativity check on unsigned value
Message-Id: <1405697517-23673-1-git-send-email-andrey.krieger.utkin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org
Cc: dcb314@hotmail.com, nwf@cs.jhu.edu, dhowells@redhat.com, davem@davemloft.net, Andrey Utkin <andrey.krieger.utkin@gmail.com>

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80611
Reported-by: David Binderman <dcb314@hotmail.com>
Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
---
 net/rxrpc/ar-key.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/rxrpc/ar-key.c b/net/rxrpc/ar-key.c
index 0ad0807..eec998e 100644
--- a/net/rxrpc/ar-key.c
+++ b/net/rxrpc/ar-key.c
@@ -346,7 +346,7 @@ static int rxrpc_krb5_decode_tagged_array(struct krb5_t=
agged_data **_td,
=20
 	n_elem =3D ntohl(*xdr++);
 	toklen -=3D 4;
-	if (n_elem < 0 || n_elem > max_n_elem)
+	if (n_elem > max_n_elem)
 		return -EINVAL;
 	*_n_elem =3D n_elem;
 	if (n_elem > 0) {
--=20
1.8.5.5

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
