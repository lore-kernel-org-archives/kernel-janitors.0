From: Matthew Wilcox <willy@debian.org>
Date: Tue, 18 May 2004 13:03:30 +0000
Subject: Re: [Kernel-janitors] [PATCH] - fs/namespace.c::copy_namespace()
Message-Id: <20040518130330.GF6484@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============81935060237472102=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040517232335.GD6248@lorien.prodam>
In-Reply-To: <20040517232335.GD6248@lorien.prodam>
To: kernel-janitors@vger.kernel.org

--===============81935060237472102==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 17, 2004 at 08:23:35PM -0300, Luiz Fernando N. Capitulino wrote:

Might work a bit better like this:

> diff -X dontdiff -Nparu a/fs/namespace.c a~/fs/namespace.c
> --- a/fs/namespace.c	2004-05-10 13:36:46.000000000 -0300
> +++ a~/fs/namespace.c	2004-05-12 16:13:22.000000000 -0300
> @@ -868,23 +868,26 @@ int copy_namespace(int flags, struct tas
>  	struct namespace *new_ns;
>  	struct vfsmount *rootmnt = NULL, *pwdmnt = NULL, *altrootmnt = NULL;
>  	struct fs_struct *fs = tsk->fs;
> +	int rc = 0;

	int rc;

>  
>  	if (!namespace)
> -		return 0;
> +		return rc;

Don't change.

>  
>  	get_namespace(namespace);
>  
>  	if (!(flags & CLONE_NEWNS))
> -		return 0;
> +		return rc;

Don't change.

>  	if (!capable(CAP_SYS_ADMIN)) {
> -		put_namespace(namespace);
> -		return -EPERM;
> +		rc = -EPERM;
> +		goto out;
>  	}

	rc = -EPERM;
	if (!capable(CAP_SYS_ADMIN))
		goto out;

>  	new_ns = kmalloc(sizeof(struct namespace), GFP_KERNEL);
> -	if (!new_ns)
> +	if (!new_ns) {
> +		rc = -ENOMEM;
>  		goto out;
> +	}

	new_ns = kmalloc(sizeof(struct namespace), GFP_KERNEL);
	rc = -ENOMEM;
	if (!new_ns)
		goto out;


>  	atomic_set(&new_ns->count, 1);
>  	init_rwsem(&new_ns->sem);
> @@ -896,6 +899,7 @@ int copy_namespace(int flags, struct tas
>  	if (!new_ns->root) {
>  		up_write(&tsk->namespace->sem);
>  		kfree(new_ns);
> +		rc = -ENOMEM;

... can delete.

>  		goto out;
>  	}
>  	spin_lock(&vfsmount_lock);
> @@ -938,12 +942,9 @@ int copy_namespace(int flags, struct tas
>  	if (altrootmnt)
>  		mntput(altrootmnt);
>  
> -	put_namespace(namespace);
> -	return 0;
> -
>  out:
>  	put_namespace(namespace);
> -	return -ENOMEM;
> +	return rc;
>  }

To be honest, this doesn't really need to be touched, it's pretty
readable as-is.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============81935060237472102==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============81935060237472102==--
