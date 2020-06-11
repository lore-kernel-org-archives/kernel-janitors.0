From: Greg KH <gregkh@linuxfoundation.org>
Date: Thu, 11 Jun 2020 14:19:43 +0000
Subject: Re: [PATCH v2] btrfs: Remove error messages for failed memory allocations
Message-Id: <20200611141943.GA1245098@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <59c4741e-5749-4782-33f8-cc3a30ecf5e5@web.de>
In-Reply-To: <59c4741e-5749-4782-33f8-cc3a30ecf5e5@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Liao Pingfang <liao.pingfang@zte.com.cn>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, Josef Bacik <josef@toxicpanda.com>, Wang Liang <wang.liang82@zte.com.cn>, Xue Zhihong <xue.zhihong@zte.com.cn>, Yi Wang <wang.yi59@zte.com.cn>

On Thu, Jun 11, 2020 at 04:00:21PM +0200, Markus Elfring wrote:
> > As there is a dump_stack() done on memory allocation
> > failures, these messages might as well be deleted instead.
>=20
> * I imagine that an other wording variant can become clearer
>   for the change description.
>=20
> * I suggest to reconsider the patch subject.
>=20
>=20
> =E2=80=A6
> > +++ b/fs/btrfs/check-integrity.c
> > @@ -632,7 +632,6 @@  static int btrfsic_process_superblock(struct btrfs=
ic_state *state,
> >
> >  	selected_super =3D kzalloc(sizeof(*selected_super), GFP_NOFS);
> >  	if (NULL =3D selected_super) {
> > -		pr_info("btrfsic: error, kmalloc failed!\n");
> >  		return -ENOMEM;
> >  	}
>=20
>=20
> How do you think about to use the following error handling instead?
>=20
> 	if (!selected_super)
> 		return -ENOMEM;
>=20


Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot
