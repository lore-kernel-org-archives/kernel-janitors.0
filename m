From: Zach Brown <zab@zabbo.net>
Date: Mon, 07 Jun 2004 16:48:29 +0000
Subject: Re: [Kernel-janitors] [PATCH] linux-2.6.7-rc2/fs/cifs/cifsfs.c
Message-Id: <40C49C5D.9070907@zabbo.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76986595560255555=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0406060258100.19187@mustang.cs.nmsu.edu>
In-Reply-To: <Pine.LNX.4.58.0406060258100.19187@mustang.cs.nmsu.edu>
To: kernel-janitors@vger.kernel.org

--===============76986595560255555==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


> +	rc = register_filesystem(&cifs_fs_type);
> +	if (!rc) {
> +		printk(KERN_ERR "Couldn't register cifs.\n");

If you're going to go to the trouble of printing anything you should
include the return code.  It would drive my batty if I had chased that
error down into the source and found that it missed the opportunity to
give me a hint as to why things failed.

>  #ifdef CONFIG_PROC_FS
>  	cifs_proc_clean();
>  #endif

(in other news, there might be an opportunity to lose this ifdef by
defining a no-op cifs_proc_clean in a header)

--===============76986595560255555==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76986595560255555==--
