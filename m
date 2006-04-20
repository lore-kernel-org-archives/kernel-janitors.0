From: "Claudio Scordino" <cloud.of.andor@gmail.com>
Date: Thu, 20 Apr 2006 15:21:16 +0000
Subject: [KJ] [PATCH] Extending getrusage
Message-Id: <d0191dad0604200821l3fa0ed70ga2faabe79d7718ec@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@myrealbox.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, torvalds@osdl.org, Andrew Morton <akpm@osdl.org>, kernel-janitors@lists.osdl.org

For the people who missed the beginning of the discussion, the
following patch is an extension of the existing getrusage syscall()
and it applies to the 2.6.16.9 kernel.

It allows a task to read usage information about another task. The argument
who can be equal to RUSAGE_SELF, to RUSAGE_CHILDREN or to a valid pid.

The permissions are checked through security_ptrace() as suggested by Andy.

Any other comment ?

Thanks,

           Claudio


Signed-off-by: Claudio Scordino <cloud.of.andor@gmail.com>
--- sys.old.c	2006-04-19 02:10:14.000000000 -0400
+++ sys.c	2006-04-20 10:53:16.000000000 -0400
@@ -1765,11 +1765,30 @@ int getrusage(struct task_struct *p, int
 	return copy_to_user(ru, &r, sizeof(r)) ? -EFAULT : 0;
 }

+/* who can be RUSAGE_SELF, RUSAGE_CHILDREN or a valid pid */
 asmlinkage long sys_getrusage(int who, struct rusage __user *ru)
 {
-	if (who != RUSAGE_SELF && who != RUSAGE_CHILDREN)
-		return -EINVAL;
-	return getrusage(current, who, ru);
+	struct rusage r;
+	struct task_struct* tsk = current;
+	read_lock(&tasklist_lock);
+	if ((who != RUSAGE_SELF) && (who != RUSAGE_CHILDREN)) {
+		if (who <= 0)
+			goto bad;
+		tsk = find_task_by_pid(who);
+		if (tsk = NULL)
+			goto bad;
+		if ((tsk != current) && security_ptrace(current, tsk))
+			goto bad;
+		/* current can get info about tsk */
+		who = RUSAGE_SELF;
+	}
+	k_getrusage(tsk, who, &r);
+	read_unlock(&tasklist_lock);
+	return copy_to_user(ru, &r, sizeof(r)) ? -EFAULT : 0;
+
+bad:
+	read_unlock(&tasklist_lock);
+	return tsk ? -EPERM : -EINVAL;
 }

 asmlinkage long sys_umask(int mask)

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
