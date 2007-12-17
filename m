From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Mon, 17 Dec 2007 02:35:55 +0000
Subject: [PATCH 1/3] ipc: Convert handmade 'max' to max().
Message-Id: <20071217023555.24944.62155.sendpatchset@thinktank.campus.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Richard Knutsson <ricknu-0@student.ltu.se>

Convert handmade 'max' to max().

Signed-off-by: Richard Knutsson <ricknu-0@student.ltu.se>
---

 msg.c |    2 +-
 sem.c |    2 +-
 shm.c |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)


diff --git a/ipc/msg.c b/ipc/msg.c
index fdf3db5..74d0709 100644
--- a/ipc/msg.c
+++ b/ipc/msg.c
@@ -473,7 +473,7 @@ asmlinkage long sys_msgctl(int msqid, int cmd, struct msqid_ds __user *buf)
 		up_read(&msg_ids(ns).rw_mutex);
 		if (copy_to_user(buf, &msginfo, sizeof(struct msginfo)))
 			return -EFAULT;
-		return (max_id < 0) ? 0 : max_id;
+		return max(max_id, 0);
 	}
 	case MSG_STAT:	/* msqid is an index rather than a msg queue id */
 	case IPC_STAT:
diff --git a/ipc/sem.c b/ipc/sem.c
index 35952c0..9ac00ac 100644
--- a/ipc/sem.c
+++ b/ipc/sem.c
@@ -641,7 +641,7 @@ static int semctl_nolock(struct ipc_namespace *ns, int semid, int semnum,
 		up_read(&sem_ids(ns).rw_mutex);
 		if (copy_to_user (arg.__buf, &seminfo, sizeof(struct seminfo))) 
 			return -EFAULT;
-		return (max_id < 0) ? 0: max_id;
+		return max(max_id, 0);
 	}
 	case SEM_STAT:
 	{
diff --git a/ipc/shm.c b/ipc/shm.c
index 3818fae..45e154a 100644
--- a/ipc/shm.c
+++ b/ipc/shm.c
@@ -704,7 +704,7 @@ asmlinkage long sys_shmctl (int shmid, int cmd, struct shmid_ds __user *buf)
 			goto out;
 		}
 
-		err = err < 0 ? 0 : err;
+		err = max(err, 0);
 		goto out;
 	}
 	case SHM_STAT:
