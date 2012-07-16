From: Eric Sandeen <sandeen@redhat.com>
Date: Mon, 16 Jul 2012 15:44:03 +0000
Subject: Re: [vfs:for-next 97/99] fs/ext3/dir.c:306:14: error: too few arguments to function 'generic_file_ll
Message-Id: <500436C3.8080207@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120716095850.GB18633@localhost>
In-Reply-To: <20120716095850.GB18633@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 7/16/12 4:58 AM, Fengguang Wu wrote:
> Hi Eric,
>=20
> Kernel build failed on
>=20
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git for-ne=
xt
> head:   1073e38331024417f5b0c1fcf7af59b92fb92689
> commit: a98bd44aa0f1ffa5091f69ec5938757b1d28f580 [97/99] vfs: allow custo=
m EOF in generic_file_llseek code
> config: i386-randconfig-b002 (attached as .config)
>=20
> All related error/warning messages:
>=20
> fs/ext3/dir.c:306:14: error: too few arguments to function 'generic_file_=
llseek_size'
> include/linux/fs.h:2452:15: note: declared here
> fs/ext4/file.c:228:2: error: too few arguments to function 'generic_file_=
llseek_size'
> include/linux/fs.h:2452:15: note: declared here
>=20
> vim +306 fs/ext3/dir.c
>    303=09
>    304		if (likely(dx_dir))
>    305			return generic_file_llseek_size(file, offset, origin,
>  > 306						        ext3_get_htree_eof(file));
>    307		else
>    308			return generic_file_llseek(file, offset, origin);
>    309	}

Thanks -=20

I had sent "[PATCH 3/3] ext3: pass custom EOF to generic_file_llseek_size()=
" which I think should have fixed this up, along with "vfs: allow custom EO=
F in generic_file_llseek code"

And, it is in Al's tree:

http://git.kernel.org/?p=3Dlinux/kernel/git/viro/vfs.git;a=3Dcommitdiff;h=
=1073e38331024417f5b0c1fcf7af59b92fb92689

as is the commit to make ext4 happy:

http://git.kernel.org/?p=3Dlinux/kernel/git/viro/vfs.git;a=3Dcommitdiff;h=
=AC5d776ddd7933c7aa9bb8fe2f9b3104dff659ca

-Eric

> ---
> 0-DAY kernel build testing backend         Open Source Technology Centre
> Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
>=20


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
