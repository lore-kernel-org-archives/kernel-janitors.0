From: Adir Kuhn <adirkuhn@gmail.com>
Date: Tue, 05 May 2015 00:05:06 +0000
Subject: [PATCH] fs: ext4: Added a blank line after declaration
Message-Id: <1430784306-2034-1-git-send-email-adirkuhn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Added a blank line after declaration

Signed-off-by: Adir Kuhn <adirkuhn@gmail.com>
---
 fs/ext4/acl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ext4/acl.c b/fs/ext4/acl.c
index 69b1e73..d9a9739 100644
--- a/fs/ext4/acl.c
+++ b/fs/ext4/acl.c
@@ -102,6 +102,7 @@ ext4_acl_to_disk(const struct posix_acl *acl, size_t *size)
 	for (n = 0; n < acl->a_count; n++) {
 		const struct posix_acl_entry *acl_e = &acl->a_entries[n];
 		ext4_acl_entry *entry = (ext4_acl_entry *)e;
+
 		entry->e_tag  = cpu_to_le16(acl_e->e_tag);
 		entry->e_perm = cpu_to_le16(acl_e->e_perm);
 		switch (acl_e->e_tag) {
--
2.1.4

