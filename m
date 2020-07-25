From: Richard Weinberger <richard@nod.at>
Date: Sat, 25 Jul 2020 08:13:12 +0000
Subject: Re: [PATCH -next] mtd: fix missing unlock on error in mtdchar_compat_ioctl()
Message-Id: <265316380.171213.1595664792652.JavaMail.zimbra@nod.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200725063416.172037-1-weiyongjun1@huawei.com>
 <20200725063701.GA1058480@kroah.com>
In-Reply-To: <20200725063701.GA1058480@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, kernel-janitors <kernel-janitors@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>, linux-mtd <linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Wei Yongjun <weiyongjun1@huawei.com>

----- Urspr=C3=BCngliche Mail -----
> Von: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
> An: "Wei Yongjun" <weiyongjun1@huawei.com>
> CC: "Miquel Raynal" <miquel.raynal@bootlin.com>, "richard" <richard@nod.a=
t>, "Vignesh Raghavendra" <vigneshr@ti.com>,
> "linux-mtd" <linux-mtd@lists.infradead.org>, "linux-kernel" <linux-kernel=
@vger.kernel.org>, "kernel-janitors"
> <kernel-janitors@vger.kernel.org>, "Hulk Robot" <hulkci@huawei.com>
> Gesendet: Samstag, 25. Juli 2020 08:37:01
> Betreff: Re: [PATCH -next] mtd: fix missing unlock on error in mtdchar_co=
mpat_ioctl()
> I think Richard already resolved this in his tree, but I could be wrong.

Yes, fixed in git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git m=
td/fixes
and should be visible in linux-next very soon.
=20
> And nice detection by your bot, that's good to see.

Yeah, good to see that such issues are being detected automatically.

Thanks,
//richard
