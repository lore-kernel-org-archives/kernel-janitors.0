From: "=?UTF-8?Q?Rune_V._Sj=C3=B8en?=" <rvsjoen@gmail.com>
Date: Tue, 17 Jul 2007 09:38:19 +0000
Subject: [KJ] [PATCH] Removal of compiler warnings in ipc/msg.c
Message-Id: <efa8e58e0707170238g9eda0e5rfa435afd30a4c3ef@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hello, this is my first patch so please be gentle.
It fixes some compiler warnings in ipc/msg.c

ipc/msg.c: In function 'sys_msgctl':
ipc/msg.c:388: warning: 'setbuf.qbytes' may be used uninitialized in
this function
ipc/msg.c:388: warning: 'setbuf.uid' may be used uninitialized in this func=
tion
ipc/msg.c:388: warning: 'setbuf.gid' may be used uninitialized in this func=
tion
ipc/msg.c:388: warning: 'setbuf.mode' may be used uninitialized in this fun=
ction

Any kind of feedback would be appreciated if i've done something wrong.

--
diff --git a/ipc/msg.c b/ipc/msg.c
index cbd27e5..e5e62ca 100644
--- a/ipc/msg.c
+++ b/ipc/msg.c
@@ -390,6 +390,8 @@ asmlinkage long sys_msgctl(int msqid, int cmd,
struct msqid_ds __user *buf)
       int err, version;
       struct ipc_namespace *ns;

+       memset(&setbuf, '0', sizeof(setbuf));
+
       if (msqid < 0 || cmd < 0)
               return -EINVAL;

--=20
-=3D<X>=3D-
Rune V. Sj=C3=B8en
You always pass failure on the way to success

http://www.opensourcesolutions.no

_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will b=
e discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructio=
ns.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
