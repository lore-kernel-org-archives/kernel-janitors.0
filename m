From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 11 Jun 2020 14:00:21 +0000
Subject: Re: [PATCH v2] btrfs: Remove error messages for failed memory allocations
Message-Id: <59c4741e-5749-4782-33f8-cc3a30ecf5e5@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Liao Pingfang <liao.pingfang@zte.com.cn>, linux-btrfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, Josef Bacik <josef@toxicpanda.com>, Wang Liang <wang.liang82@zte.com.cn>, Xue Zhihong <xue.zhihong@zte.com.cn>, Yi Wang <wang.yi59@zte.com.cn>

> As there is a dump_stack() done on memory allocation
> failures, these messages might as well be deleted instead.

* I imagine that an other wording variant can become clearer
  for the change description.

* I suggest to reconsider the patch subject.


=E2=80=A6
> +++ b/fs/btrfs/check-integrity.c
> @@ -632,7 +632,6 @@  static int btrfsic_process_superblock(struct btrfsic=
_state *state,
>
>  	selected_super =3D kzalloc(sizeof(*selected_super), GFP_NOFS);
>  	if (NULL =3D=3D selected_super) {
> -		pr_info("btrfsic: error, kmalloc failed!\n");
>  		return -ENOMEM;
>  	}


How do you think about to use the following error handling instead?

	if (!selected_super)
		return -ENOMEM;


Regards,
Markus
