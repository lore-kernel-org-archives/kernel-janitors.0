From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 30 Nov 2014 17:03:45 +0000
Subject: [PATCH 4/8 v2] cifs: replace memset by memzero_explicit
Message-Id: <1417367029-32762-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1417367029-32762-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1417367029-32762-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench@samba.org>
Cc: kernel-janitors@vger.kernel.org, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Memset on a local variable may be removed when it is called just before the
variable goes out of scope.  Using memzero_explicit defeats this
optimization.  A simplified version of the semantic patch that makes this
change is as follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier x;
type T;
@@

{
... when any
T x[...];
... when any
    when exists
- memset
+ memzero_explicit
  (x,
-0,
  ...)
... when != x
    when strict
}
// </smpl>

This change was suggested by Daniel Borkmann <dborkman@redhat.com>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
Daniel Borkmann suggested that these patches could go through Herbert Xu's
cryptodev tree.

v2: fixed email address

 fs/cifs/smbencrypt.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cifs/smbencrypt.c b/fs/cifs/smbencrypt.c
index 6c15663..6512c19 100644
--- a/fs/cifs/smbencrypt.c
+++ b/fs/cifs/smbencrypt.c
@@ -221,7 +221,7 @@ E_md4hash(const unsigned char *passwd, unsigned char *p16,
 	}
 
 	rc = mdfour(p16, (unsigned char *) wpwd, len * sizeof(__le16));
-	memset(wpwd, 0, 129 * sizeof(__le16));
+	memzero_explicit(wpwd, 129 * sizeof(__le16));
 
 	return rc;
 }

