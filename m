From: Joe Perches <joe@perches.com>
Date: Thu, 06 Oct 2016 17:36:43 +0000
Subject: Re: [PATCH 37/54] md/raid5: Replace a seq_printf() call by seq_puts() in raid5_status()
Message-Id: <1475775403.1914.13.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
         <786843ef-4b6f-eb04-7326-2f6f5b408826@users.sourceforge.net>
         <92c52f1d-d151-cea6-e9ac-31378e6862d0@users.sourceforge.net>
         <1475771699.1914.10.camel@perches.com>
         <d896b697-6735-e50d-00b0-2b3d9f371c99@users.sourceforge.net>
In-Reply-To: <d896b697-6735-e50d-00b0-2b3d9f371c99@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-raid@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Guoqing Jiang <gqjiang@suse.com>, Jens Axboe <axboe@fb.com>, Mike Christie <mchristi@redhat.com>, Neil Brown <neilb@suse.com>, Shaohua Li <shli@kernel.org>, Tomasz Majchrzak <tomasz.majchrzak@intel.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Thu, 2016-10-06 at 19:09 +0200, SF Markus Elfring wrote:
> > > diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
> > []
> > > @@ -7044,7 +7044,7 @@ static void raid5_status(struct seq_file *seq, =
struct mddev *mddev)
> > > =A0			   rdev && test_bit(In_sync, &rdev->flags) ? "U" : "_");
> > > =A0	}
> > > =A0	rcu_read_unlock();
> > > -	seq_printf (seq, "]");
> > > +	seq_puts(seq, "]");
> > seq_putc
> How do you think about the possibility that the script "checkpatch.pl" ca=
n also point
> such a source code transformation out directly?

Why don't _you_ try to implement that in checkpatch instead?

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
