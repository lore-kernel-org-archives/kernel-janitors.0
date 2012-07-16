From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Mon, 16 Jul 2012 16:45:45 +0000
Subject: Re: [vfs:for-next 97/99] fs/ext3/dir.c:306:14: error: too few arguments to function 'generic_file_ll
Message-Id: <20120716164545.GM31729@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120716095850.GB18633@localhost>
In-Reply-To: <20120716095850.GB18633@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Mon, Jul 16, 2012 at 10:44:03AM -0500, Eric Sandeen wrote:
> Thanks -=20
>=20
> I had sent "[PATCH 3/3] ext3: pass custom EOF to generic_file_llseek_size=
()" which I think should have fixed this up, along with "vfs: allow custom =
EOF in generic_file_llseek code"
>=20
> And, it is in Al's tree:
>=20
> http://git.kernel.org/?p=3Dlinux/kernel/git/viro/vfs.git;a=3Dcommitdiff;h=
=1073e38331024417f5b0c1fcf7af59b92fb92689
>=20
> as is the commit to make ext4 happy:
>=20
> http://git.kernel.org/?p=3Dlinux/kernel/git/viro/vfs.git;a=3Dcommitdiff;h=
=AC5d776ddd7933c7aa9bb8fe2f9b3104dff659ca

Yes, but it still creates a bisect hazard, so I'm going to fix that sucker =
up, along with
the similar mess in quota series.  Will be in #for-next tomorrow.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
