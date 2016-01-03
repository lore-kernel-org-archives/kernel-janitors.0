From: Joe Perches <joe@perches.com>
Date: Sun, 03 Jan 2016 03:47:49 +0000
Subject: Re: [RFC PATCH v0] Add tw5864 driver
Message-Id: <1451792869.4334.33.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1451785302-3173-1-git-send-email-andrey.utkin@corp.bluecherry.net>
In-Reply-To: <1451785302-3173-1-git-send-email-andrey.utkin@corp.bluecherry.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Andrey Utkin <andrey.utkin@corp.bluecherry.net>, Linux Media <linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-mentors@selenic.com" <kernel-mentors@selenic.com>, devel@driverdev.osuosl.org, kernel-janitors <kernel-janitors@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrey Utkin <andrey.od.utkin@gmail.com>

On Sun, 2016-01-03 at 03:41 +0200, Andrey Utkin wrote:
> (Disclaimer up to scissors mark)
>=20
> Please be so kind to take a look at a new driver.

trivial comments only:
> diff --git a/drivers/staging/media/tw5864/tw5864-bs.h b/drivers/staging/m=
edia/tw5864/tw5864-bs.h
[]
> +static inline int bs_pos(struct bs *s)
> +{
> +	return (8 * (s->p - s->p_start) + 8 - s->i_left);
> +}

several of these have unnecessary parentheses

> +static inline int bs_eof(struct bs *s)
> +{
> +	return (s->p >=3D s->p_end ? 1 : 0);
> +}

Maybe use bool a bit more
> +/* golomb functions */
> +static inline void bs_write_ue(struct bs *s, u32 val)
> +{
> +	int i_size =3D 0;
> +	static const int i_size0_255[256] =3D {

Maybe use s8 instead of int to reduce object size

> +		1, 1, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5,
> +		5, 5,
> +		5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,
> +		6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,

Perhaps it'd be clearer to use gcc's ranged initializer syntax

	[ =A00 ... =A0 1] =3D 1,
	[ =A02 ... =A0 3] =3D 2,
	[ =A04 ... =A0 7] =3D 3,
	[ =A08 ... =A015] =3D 4,
	[ 16 ... =A031] =3D 5,
	[ 32 ... =A063] =3D 6,
etc...

or maybe just use fls

> +static inline int bs_size_ue(unsigned int val)
> +{
> +	int i_size =3D 0;
> +	static const int i_size0_254[255] =3D {

Same sort of thing

> diff --git a/drivers/staging/media/tw5864/tw5864-config.c b/drivers/stagi=
ng/media/tw5864/tw5864-config.c
[]
> +u8 tw_indir_readb(struct tw5864_dev *dev, u16 addr)
> +{
> +	int timeout =3D 30000;

misleading name, retries would be more proper,
or maybe use real timed loops.

> +	u32 data =3D 0;
> +
> +	addr <<=3D 2;
> +
> +	while ((tw_readl(TW5864_IND_CTL) >> 31) && (timeout--))
> +		;
> +	if (!timeout)
> +		dev_err(&dev->pci->dev,
> +			"tw_indir_writel() timeout before reading\n");
> +
> +	tw_writel(TW5864_IND_CTL, addr | TW5864_ENABLE);
> +
> +	timeout =3D 30000;
> +	while ((tw_readl(TW5864_IND_CTL) >> 31) && (timeout--))
> +		;
> +	if (!timeout)
> +		dev_err(&dev->pci->dev,
> +			"tw_indir_writel() timeout at reading\n");
> +
> +	data =3D tw_readl(TW5864_IND_DATA);
> +	return data & 0xff;
> +}
[]
> +static size_t regs_dump(struct tw5864_dev *dev, char *buf, size_t size)
> +{
> +	size_t count =3D 0;
> +
> +	u32 reg_addr;
> +	u32 value;
> +
> +	for (reg_addr =3D 0x0000; (count < size) && (reg_addr <=3D 0x2FFC);
> +	=A0=A0=A0=A0=A0reg_addr +=3D 4) {
> +		value =3D tw_readl(reg_addr);
> +		count +=3D scnprintf(buf + count, size - count,
> +				=A0=A0=A0"[0x%05x] =3D 0x%08x\n", reg_addr, value);
> +	}
> +
> +	for (reg_addr =3D 0x4000; (count < size) && (reg_addr <=3D 0x4FFC);
> +	=A0=A0=A0=A0=A0reg_addr +=3D 4) {
> +		value =3D tw_readl(reg_addr);
> +		count +=3D scnprintf(buf + count, size - count,
> +				=A0=A0=A0"[0x%05x] =3D 0x%08x\n", reg_addr, value);
> +	}
> +
> +	for (reg_addr =3D 0x8000; (count < size) && (reg_addr <=3D 0x180DC);
> +	=A0=A0=A0=A0=A0reg_addr +=3D 4) {
> +		value =3D tw_readl(reg_addr);
> +		count +=3D scnprintf(buf + count, size - count,
> +				=A0=A0=A0"[0x%05x] =3D 0x%08x\n", reg_addr, value);
> +	}
> +
> +	for (reg_addr =3D 0x18100; (count < size) && (reg_addr <=3D 0x1817C);
> +	=A0=A0=A0=A0=A0reg_addr +=3D 4) {
> +		value =3D tw_readl(reg_addr);
> +		count +=3D scnprintf(buf + count, size - count,
> +				=A0=A0=A0"[0x%05x] =3D 0x%08x\n", reg_addr, value);
> +	}
> +
> +	for (reg_addr =3D 0x80000; (count < size) && (reg_addr <=3D 0x87FFF);
> +	=A0=A0=A0=A0=A0reg_addr +=3D 4) {
> +		value =3D tw_readl(reg_addr);
> +		count +=3D scnprintf(buf + count, size - count,
> +				=A0=A0=A0"[0x%05x] =3D 0x%08x\n", reg_addr, value);
> +	}

This seems a little repetitive.

> diff --git a/drivers/staging/media/tw5864/tw5864-tables.h b/drivers/stagi=
ng/media/tw5864/tw5864-tables.h
[]
> +static const u32 forward_quantization_table[QUANTIZATION_TABLE_LEN] =3D {

u16?


> +		static const struct v4l2_ctrl_config tw5864_md_thresholds =3D {
> +			.ops =3D &tw5864_ctrl_ops,
> +			.id =3D V4L2_CID_DETECT_MD_THRESHOLD_GRID,
> +			.dims =3D {MD_CELLS_HOR, MD_CELLS_VERT},
> +			.def =3D 14,
> +			/* See tw5864_md_metric_from_mvd() */
> +			.max =3D 2 * 0x0f,
> +			.step =3D 1,
> +		};

odd indentation

> +#ifdef DEBUG
> +	dev_dbg(&input->root->pci->dev,
> +		"input %d, frame md stats: min %u, max %u, avg %u, cells above thresho=
ld: %u\n",
> +		input->input_number, min, max, sum / md_cells,
> +		cnt_above_thresh);
> +#endif

unnecessary #ifdef

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
