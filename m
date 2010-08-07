From: Dan Carpenter <error27@gmail.com>
Date: Sat, 07 Aug 2010 11:50:38 +0000
Subject: [patch] apparmor: issue with ns name without a following profile
Message-Id: <20100807110639.GY9031@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Johansen <john.johansen@canonical.com>
Cc: James Morris <jmorris@namei.org>, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

If we have a ns name without a following profile then in the original
code it did "*ns_name = &name[1];".  "name" is NULL so "*ns_name" is
0x1.  That isn't useful and could cause an oops when this function is
called from aa_remove_profiles(). 

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
I'm not very familiar with this code and I haven't tested my fix. 
Sorry.  Please review carefully.

diff --git a/security/apparmor/lib.c b/security/apparmor/lib.c
index 6e85cdb..da34011 100644
--- a/security/apparmor/lib.c
+++ b/security/apparmor/lib.c
@@ -44,10 +44,12 @@ char *aa_split_fqname(char *fqname, char **ns_name)
 			/* overwrite ':' with \0 */
 			*split = 0;
 			name = skip_spaces(split + 1);
-		} else
+			*ns_name = &name[1];
+		} else {
 			/* a ns name without a following profile is allowed */
+			*ns_name = &name[1];
 			name = NULL;
-		*ns_name = &name[1];
+		}
 	}
 	if (name && *name = 0)
 		name = NULL;
