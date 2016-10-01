From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 01 Oct 2016 19:46:28 +0000
Subject: [PATCH 11/15] kobject: improve function-level documentation
Message-Id: <1475351192-27079-12-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1475351192-27079-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1475351192-27079-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

In the first case, rename the second variable to correspond to the name
found in the function parameter list.

In the remaining cases, reorder the variables to correspond to their order
in the parameter list.

Issue detected using Coccinelle (http://coccinelle.lip6.fr/)

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 lib/kobject_uevent.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
index f6c2c1e..9a2b811 100644
--- a/lib/kobject_uevent.c
+++ b/lib/kobject_uevent.c
@@ -56,7 +56,7 @@ struct uevent_sock {
  * kobject_action_type - translate action string to numeric type
  *
  * @buf: buffer containing the action string, newline is ignored
- * @len: length of buffer
+ * @count: length of buffer
  * @type: pointer to the location to store the action type
  *
  * Returns 0 if the action string was recognized.
@@ -154,8 +154,8 @@ static void cleanup_uevent_env(struct subprocess_info *info)
 /**
  * kobject_uevent_env - send an uevent with environmental data
  *
- * @action: action that is happening
  * @kobj: struct kobject that the action is happening to
+ * @action: action that is happening
  * @envp_ext: pointer to environmental data
  *
  * Returns 0 if kobject_uevent_env() is completed with success or the
@@ -363,8 +363,8 @@ int kobject_uevent_env(struct kobject *kobj, enum kobject_action action,
 /**
  * kobject_uevent - notify userspace by sending an uevent
  *
- * @action: action that is happening
  * @kobj: struct kobject that the action is happening to
+ * @action: action that is happening
  *
  * Returns 0 if kobject_uevent() is completed with success or the
  * corresponding error when it fails.

