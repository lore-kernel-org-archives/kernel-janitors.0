From: Matthew Wilcox <willy@debian.org>
Date: Tue, 18 May 2004 15:55:35 +0000
Subject: Re: Re: [Kernel-janitors] [PATCH] - fs/namespace.c::copy_namesp
Message-Id: <20040518155535.GG6484@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============16501113241092824=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040517232335.GD6248@lorien.prodam>
In-Reply-To: <20040517232335.GD6248@lorien.prodam>
To: kernel-janitors@vger.kernel.org

--===============16501113241092824==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 18, 2004 at 04:54:32PM +0200, Walter Harms wrote:
> Hi Willy,
> first i would do 
>           if (!capable(CAP_SYS_ADMIN)) 
> 
> So its harder to leak any information 
> (if later programmers fail somewhere)	
> 
> there i would change. any reason not to do ?

Because copy_namespace doesn't need CAP_SYS_ADMIN if CLONE_NEWNS is clear.
Anyway, what information is leaked?  Here's the beginning of the function:

int copy_namespace(int flags, struct task_struct *tsk)
{
        struct namespace *namespace = tsk->namespace;
        struct namespace *new_ns;
        struct vfsmount *rootmnt = NULL, *pwdmnt = NULL, *altrootmnt = NULL;
        struct fs_struct *fs = tsk->fs;

        if (!namespace)
                return 0;

        get_namespace(namespace);

        if (!(flags & CLONE_NEWNS))
                return 0;

        if (!capable(CAP_SYS_ADMIN)) {
                put_namespace(namespace);
                return -EPERM;
        }

get_namespace and put_namespace handle refcounting.  Without refcounting,
this is what it looks like:

        if (!namespace) 
                return 0;
        if (!(flags & CLONE_NEWNS))
                return 0;
        if (!capable(CAP_SYS_ADMIN))
		return -EPERM;

Perhaps the conceptual problem here is that copy_namespace does different
things depending on the flags.  Maybe this should be:

Index: fs/namespace.c
===================================================================
RCS file: /var/cvs/linux-2.6/fs/namespace.c,v
retrieving revision 1.8
diff -u -p -r1.8 namespace.c
--- a/fs/namespace.c    28 Apr 2004 19:12:44 -0000      1.8
+++ b/fs/namespace.c    18 May 2004 15:43:51 -0000
@@ -803,25 +803,13 @@ dput_out:
        return retval;
 }
 
-int copy_namespace(int flags, struct task_struct *tsk)
+static int new_namespace(int flags, struct task_struct *tsk)
 {
        struct namespace *namespace = tsk->namespace;
        struct namespace *new_ns;
        struct vfsmount *rootmnt = NULL, *pwdmnt = NULL, *altrootmnt = NULL;
        struct fs_struct *fs = tsk->fs;
-
-       if (!namespace)
-               return 0;
-
-       get_namespace(namespace);
-
-       if (!(flags & CLONE_NEWNS))
-               return 0;
-
-       if (!capable(CAP_SYS_ADMIN)) {
-               put_namespace(namespace);
-               return -EPERM;
-       }
+       int result = -ENOMEM;
 
        new_ns = kmalloc(sizeof(struct namespace), GFP_KERNEL);
        if (!new_ns)
@@ -879,12 +867,32 @@ int copy_namespace(int flags, struct tas
        if (altrootmnt)
                mntput(altrootmnt);
 
-       put_namespace(namespace);
-       return 0;
+       result = 0;
 
-out:
+ out:
        put_namespace(namespace);
-       return -ENOMEM;
+       return result;
+}
+
+int copy_namespace(int flags, struct task_struct *tsk)
+{
+       struct namespace *namespace = tsk->namespace;
+       int result;
+
+       if (!namespace)
+               return 0;
+
+       get_namespace(namespace);
+
+       if (!(flags & CLONE_NEWNS))
+               return 0;
+
+       if (!capable(CAP_SYS_ADMIN)) {
+               put_namespace(namespace);
+               return -EPERM;
+       }
+
+       return new_namespace(flags, tsk);
 }
 
 asmlinkage long sys_mount(char __user * dev_name, char __user * dir_name,


Untested, but should hopefully convey better that copy_namespace does
two different things, and to do the second one (create a new namespace),
you have to be root.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============16501113241092824==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============16501113241092824==--
