From: "Claudio Scordino" <cloud.of.andor@gmail.com>
Date: Fri, 21 Apr 2006 10:05:13 +0000
Subject: [KJ] Re: [PATCH] Extending getrusage
Message-Id: <d0191dad0604210305n7ce4b59aja5d215d92f95e1f4@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d0191dad0604200821l3fa0ed70ga2faabe79d7718ec@mail.gmail.com>
	 <20060420162140.0a03e227.akpm@osdl.org>
	 <20060421074129.GA31972@outpost.ds9a.nl>
In-Reply-To: <20060421074129.GA31972@outpost.ds9a.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>
Cc: linux-kernel@vger.kernel.org, luto@myrealbox.com, alan@lxorguk.ukuu.org.uk, torvalds@osdl.org, kernel-janitors@lists.osdl.org, bert.hubert@netherlabs.nl

> > I'd be reluctant to support this change without a compelling description of
> > why we actually want it.
>
> It offers nothing that isn't available elsewhere (I think), except more
> cheaply. It also has the potential to be multiplatform one day. Right now to
> get the CPU usage of a random pid, one has to implement the equivalent of
> /proc/ parsing for each platform.
>
> If at least Linux did 'getrusage for foreign pid', that would clean up
> things up somewhat already.
>
> It might even mean a 'portable top', and who knows, more unixes might
> follow.
>
> I for one would save work having a getrusage that does this.
>
>         Bert

Exactly! My modification was meant to add the possibility of having
usage information about another process at user level.

Recently, while writing some code at user level, I needed a fast way
to have such information about another process.
I wanted to use the getrusage syscall, then I found out that the
current implementation does not allow to get information about another
process. Therefore, I proposed my patch.

As Bert said, it offers nothing that isn't available elsewhere, but
more cheaply.

This patch with the changes that you asked me follows.

Thanks,

                Claudio

Signed-off-by: Claudio Scordino <cloud.of.andor@gmail.com>
diff -uprN linux-2.6.16.9/kernel/sys.c linux-2.6.16.9-new/kernel/sys.c
--- linux-2.6.16.9/kernel/sys.c	2006-04-19 02:10:14.000000000 -0400
+++ linux-2.6.16.9-new/kernel/sys.c	2006-04-21 05:53:16.000000000 -0400
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
+	struct task_struct *tsk = current;
+	read_lock(&tasklist_lock);
+	if (who != RUSAGE_SELF && who != RUSAGE_CHILDREN) {
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
