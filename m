From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 01 Oct 2016 19:46:20 +0000
Subject: [PATCH 03/15] fscrypto: improve function-level documentation
Message-Id: <1475351192-27079-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1475351192-27079-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1475351192-27079-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Cc: kernel-janitors@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org

Correct spelling mistakes in the documentation associated with two
functions in fs/crypto/crypto.c.

Use actual function names in the documentation associated with two
functions in fs/crypto/fname.c.

Issue detected using Coccinelle (http://coccinelle.lip6.fr/)

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 fs/crypto/crypto.c |    4 ++--
 fs/crypto/fname.c  |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 61057b7d..9d6ec61 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -211,7 +211,7 @@ static struct page *alloc_bounce_page(struct fscrypt_ctx *ctx, gfp_t gfp_flags)
 }
 
 /**
- * fscypt_encrypt_page() - Encrypts a page
+ * fscrypt_encrypt_page() - Encrypts a page
  * @inode:          The inode for which the encryption should take place
  * @plaintext_page: The page to encrypt. Must be locked.
  * @gfp_flags:      The gfp flag for memory allocation
@@ -264,7 +264,7 @@ struct page *fscrypt_encrypt_page(struct inode *inode,
 EXPORT_SYMBOL(fscrypt_encrypt_page);
 
 /**
- * f2crypt_decrypt_page() - Decrypts a page in-place
+ * fscrypt_decrypt_page() - Decrypts a page in-place
  * @page: The page to decrypt. Must be locked.
  *
  * Decrypts page in-place using the ctx encryption context.
diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index 90697c7..4b0de94 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -240,7 +240,7 @@ u32 fscrypt_fname_encrypted_size(struct inode *inode, u32 ilen)
 EXPORT_SYMBOL(fscrypt_fname_encrypted_size);
 
 /**
- * fscrypt_fname_crypto_alloc_obuff() -
+ * fscrypt_fname_alloc_buffer() -
  *
  * Allocates an output buffer that is sufficient for the crypto operation
  * specified by the context and the direction.
@@ -265,7 +265,7 @@ int fscrypt_fname_alloc_buffer(struct inode *inode,
 EXPORT_SYMBOL(fscrypt_fname_alloc_buffer);
 
 /**
- * fscrypt_fname_crypto_free_buffer() -
+ * fscrypt_fname_free_buffer() -
  *
  * Frees the buffer allocated for crypto operation.
  */

