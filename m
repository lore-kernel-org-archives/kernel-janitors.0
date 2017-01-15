From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 15 Jan 2017 15:38:12 +0000
Subject: [PATCH 38/46] selinux: One function call less in five functions after null pointer detection
Message-Id: <b71e766c-a9a2-cd9c-8f87-7aaeaaf896f0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ca34123f-ced6-d2bc-363b-690858618827@users.sourceforge.net>
In-Reply-To: <ca34123f-ced6-d2bc-363b-690858618827@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov, Eric Paris <eparis@parisplace.org>, James Morris <james.l.morris@oracle.com>, Paul Moore <paul@paul-moore.com>, "Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <sds@tycho.nsa.gov>, William Roberts <william.c.roberts@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 15 Jan 2017 11:28:02 +0100

Call the function "kfree" at the end only after it was determined
that the passed parameter contained a non-null pointer.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 security/selinux/ss/policydb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
index faa6ecc2450d..88730b372277 100644
--- a/security/selinux/ss/policydb.c
+++ b/security/selinux/ss/policydb.c
@@ -620,8 +620,8 @@ static int common_destroy(void *key, void *datum, void *p)
 		comdatum = datum;
 		hashtab_map(comdatum->permissions.table, perm_destroy, NULL);
 		hashtab_destroy(comdatum->permissions.table);
+		kfree(datum);
 	}
-	kfree(datum);
 	return 0;
 }
 
@@ -675,8 +675,8 @@ static int cls_destroy(void *key, void *datum, void *p)
 			kfree(ctemp);
 		}
 		kfree(cladatum->comkey);
+		kfree(datum);
 	}
-	kfree(datum);
 	return 0;
 }
 
@@ -689,8 +689,8 @@ static int role_destroy(void *key, void *datum, void *p)
 		role = datum;
 		ebitmap_destroy(&role->dominates);
 		ebitmap_destroy(&role->types);
+		kfree(datum);
 	}
-	kfree(datum);
 	return 0;
 }
 
@@ -712,8 +712,8 @@ static int user_destroy(void *key, void *datum, void *p)
 		ebitmap_destroy(&usrdatum->range.level[0].cat);
 		ebitmap_destroy(&usrdatum->range.level[1].cat);
 		ebitmap_destroy(&usrdatum->dfltlevel.cat);
+		kfree(datum);
 	}
-	kfree(datum);
 	return 0;
 }
 
@@ -726,8 +726,8 @@ static int sens_destroy(void *key, void *datum, void *p)
 		levdatum = datum;
 		ebitmap_destroy(&levdatum->level->cat);
 		kfree(levdatum->level);
+		kfree(datum);
 	}
-	kfree(datum);
 	return 0;
 }
 
-- 
2.11.0

