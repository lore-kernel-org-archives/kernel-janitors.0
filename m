From: Matthew Wilcox <willy@debian.org>
Date: Tue, 08 Jun 2004 14:11:20 +0000
Subject: Re: [Kernel-janitors] [REDIFF] new.linux-2.6.7-rc2/fs/cifs/cifsfs.c
Message-Id: <20040608141120.GB31749@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============63089501056280373=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0406080152230.31755@mustang.cs.nmsu.edu>
In-Reply-To: <Pine.LNX.4.58.0406080152230.31755@mustang.cs.nmsu.edu>
To: kernel-janitors@vger.kernel.org

--===============63089501056280373==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 08, 2004 at 01:54:13AM -0600, MJK wrote:
> Description  : Audits kernel_thread() and does a cosmetic change to the
> way errors are handled with (hopefully) helpfull error messages.

But you didn't actually test it, did you?

>  	rc = cifs_init_inodecache();
>  	if (!rc) {
> -		rc = cifs_init_mids();
> -		if (!rc) {
> -			rc = cifs_init_request_bufs();
[...]
> +		printk(KERN_ERR "cifs_init_inodecache, error code = %d.\n", rc);
> +		goto error_init;
>  	}
> +
> +	rc = cifs_init_mids();
> +	if (!rc) {
> +		printk(KERN_ERR "cifs_init_mids, error code = %d\n.", rc);
> +		goto error_init_mids;
> +	}

Your conditions are inverted.  !rc means rc == 0, so you're erroring
out on success.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============63089501056280373==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============63089501056280373==--
