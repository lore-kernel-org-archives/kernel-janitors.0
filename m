From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 03 Jul 2019 02:55:18 +0000
Subject: [PATCH -next] integrity: Remove set but not used variable 'acl'
Message-Id: <20190703025518.6379-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, David Howells <dhowells@redhat.com>, Kairui Song <kasong@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Mimi Zohar <zohar@linux.ibm.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>, Eric Biggers <ebiggers@google.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

security/integrity/digsig.c: In function 'integrity_init_keyring':
security/integrity/digsig.c:99:18: warning:
 variable 'acl' set but not used [-Wunused-but-set-variable]

It seems 'acl' is needed in __integrity_init_keyring

Fixes: 6100ac53909d ("keys: Replace uid/gid/perm permissions checking with an ACL")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 security/integrity/digsig.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/integrity/digsig.c b/security/integrity/digsig.c
index 1f2c43f62047..f9f3c8ffe786 100644
--- a/security/integrity/digsig.c
+++ b/security/integrity/digsig.c
@@ -114,7 +114,7 @@ int __init integrity_init_keyring(const unsigned int id)
 	acl = &internal_writable_keyring_acl;
 
 out:
-	return __integrity_init_keyring(id, &internal_keyring_acl, restriction);
+	return __integrity_init_keyring(id, acl, restriction);
 }
 
 static int __init integrity_add_key(const unsigned int id, const void *data,
