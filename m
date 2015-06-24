From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 Jun 2015 13:20:47 +0000
Subject: [PATCH] keys: Delete an unnecessary check before the function call "key_put"
Message-Id: <558AAEAF.7040606@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <546BB427.2050101@users.sourceforge.net>
In-Reply-To: <546BB427.2050101@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>, James Morris <james.l.morris@oracle.com>, "Serge E. Hallyn" <serge@hallyn.com>, keyrings@linux-nfs.org, linux-security-module@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 Jun 2015 15:16:35 +0200

The key_put() function tests whether its argument is NULL and then
returns immediately. Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 security/keys/process_keys.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/security/keys/process_keys.c b/security/keys/process_keys.c
index bd536cb..225dd08 100644
--- a/security/keys/process_keys.c
+++ b/security/keys/process_keys.c
@@ -242,9 +242,7 @@ int install_session_keyring_to_cred(struct cred *cred, struct key *keyring)
 	old = cred->session_keyring;
 	rcu_assign_pointer(cred->session_keyring, keyring);
 
-	if (old)
-		key_put(old);
-
+	key_put(old);
 	return 0;
 }
 
-- 
2.4.4

