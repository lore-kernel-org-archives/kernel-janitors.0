From: Colin King <colin.king@canonical.com>
Date: Wed, 10 May 2017 11:05:21 +0000
Subject: [PATCH] exec: ensure file system accounting in check_unsafe_exec is correct
Message-Id: <20170510110521.19668-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two very race windows that need to be taken into consideration
when check_unsafe_exec  performs the file system accounting comparing the
number of fs->users against the number threads that share the same fs.

The first race can occur when a pthread creates a new pthread and the
the fs->users count is incremented before the new pthread is associated
with the pthread performing the exec. When this occurs, the pthread
performing the exec has flags with bit PF_FORKNOEXEC set.

The second race can occur when a pthread is terminating and the fs->users
count has been decremented by the pthread is still associated with the
pthread that is performing the exec. When this occurs, the pthread
peforming the exec has flags with bit PF_EXITING set.

This fix keeps track of any pthreads that may be in the race window
(when PF_FORKNOEXEC or PF_EXITING) are set and if the fs count does
not match the expected count we retry the count as we may have hit
this small race windows.  Tests on an 8 thread server with the
reproducer (see below) show that this retry occurs rarely, so the
overhead of the retry is very small.

Below is a reproducer of the race condition.

The bug manifests itself because the current check_unsafe_exec
hits this race and indicates it is not a safe exec, and the
exec'd suid program fails to setuid.

$ cat Makefile
ALL=a b
all: $(ALL)

a: LDFLAGS=-pthread

b: b.c
	$(CC) b.c -o b
	sudo chown root:root b
	sudo chmod u+s b

test:
	for I in $$(seq 1000); do echo $I; ./a ; done

clean:
	rm -vf $(ALL)

$ cat a.c

void *nothing(void *p)
{
	return NULL;
}

void *target(void *p) {
	for (;;) {
		pthread_t t;
		if (pthread_create(&t, NULL, nothing, NULL) = 0)
			pthread_join(t, NULL);
    	}
	return NULL;
}

int main(void)
{
	struct timespec tv;
	int i;

	for (i = 0; i < 10; i++) {
		pthread_t t;
		pthread_create(&t, NULL, target, NULL);
	}
	tv.tv_sec = 0;
	tv.tv_nsec = 100000;
	nanosleep(&tv, NULL);
	if (execl("./b", "./b", NULL) < 0)
		perror("execl");
	return 0;
}

$ cat b.c

int main(void)
{
	const uid_t euid = geteuid();
	if (euid != 0) {
		printf("Failed, got euid %d (expecting 0)\n", euid);
        	return 1;
	}
	return 0;
}

$ make
make
cc   -pthread  a.c   -o a
cc b.c -o b
sudo chown root:root b
sudo chmod u+s b
$ for i in $(seq 1000); do ./a; done

Without the fix, one will see 'Failed, got euid xxxx (expecting 0)'
messages where xxxx is one's uid.

BugLink: http://bugs.launchpad.net/bugs/1672819
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/exec.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/exec.c b/fs/exec.c
index 72934df..5117dc4 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1431,6 +1431,7 @@ static void check_unsafe_exec(struct linux_binprm *bprm)
 {
 	struct task_struct *p = current, *t;
 	unsigned n_fs;
+	bool fs_recheck;
 
 	if (p->ptrace)
 		bprm->unsafe |= LSM_UNSAFE_PTRACE;
@@ -1442,6 +1443,8 @@ static void check_unsafe_exec(struct linux_binprm *bprm)
 	if (task_no_new_privs(current))
 		bprm->unsafe |= LSM_UNSAFE_NO_NEW_PRIVS;
 
+recheck:
+	fs_recheck = false;
 	t = p;
 	n_fs = 1;
 	spin_lock(&p->fs->lock);
@@ -1449,12 +1452,18 @@ static void check_unsafe_exec(struct linux_binprm *bprm)
 	while_each_thread(p, t) {
 		if (t->fs = p->fs)
 			n_fs++;
+		if (t->flags & (PF_EXITING | PF_FORKNOEXEC))
+			fs_recheck  = true;
 	}
 	rcu_read_unlock();
 
-	if (p->fs->users > n_fs)
+	if (p->fs->users > n_fs) {
+		if (fs_recheck) {
+			spin_unlock(&p->fs->lock);
+			goto recheck;
+		}
 		bprm->unsafe |= LSM_UNSAFE_SHARE;
-	else
+	} else
 		p->fs->in_exec = 1;
 	spin_unlock(&p->fs->lock);
 }
-- 
2.7.4

