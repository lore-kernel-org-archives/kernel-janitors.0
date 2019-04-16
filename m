From: Colin King <colin.king@canonical.com>
Date: Tue, 16 Apr 2019 14:42:18 +0000
Subject: [PATCH] apparmor: fix spelling mistake "immutible" -> "immutable"
Message-Id: <20190416144218.1842-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Johansen <john.johansen@canonical.com>, James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, linux-security-module@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in an information message string, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 security/apparmor/policy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
index 71a3e6291478..04f2480e8374 100644
--- a/security/apparmor/policy.c
+++ b/security/apparmor/policy.c
@@ -587,7 +587,7 @@ static int replacement_allowed(struct aa_profile *profile, int noreplace,
 {
 	if (profile) {
 		if (profile->label.flags & FLAG_IMMUTIBLE) {
-			*info = "cannot replace immutible profile";
+			*info = "cannot replace immutable profile";
 			return -EPERM;
 		} else if (noreplace) {
 			*info = "profile already exists";
-- 
2.20.1
