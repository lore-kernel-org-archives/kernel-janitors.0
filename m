From: Hannes Eder <hannes@hanneseder.net>
Date: Fri, 27 Feb 2009 00:58:57 +0000
Subject: Re: [PATCH 04/16] ide: fix sparse warnings: Using plain integer as
Message-Id: <154e089b0902261658t14c1339dj55e7f4ff4aede372@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
	 <20090222000150.17557.8753.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090222000150.17557.8753.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: trivial@kernel.org, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

[Added To]

On Sun, Feb 22, 2009 at 1:01 AM, Hannes Eder <hannes@hanneseder.net> wrote:
> Fix this sparse warnings:
> =A0drivers/ide/ide-disk_proc.c:130:11: warning: Using plain integer as NU=
LL pointer
> =A0drivers/ide/ide-floppy_proc.c:32:11: warning: Using plain integer as N=
ULL pointer
> =A0drivers/ide/ide-proc.c:234:11: warning: Using plain integer as NULL po=
inter
> =A0drivers/ide/ide-tape.c:2141:11: warning: Using plain integer as NULL p=
ointer
>
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> ---
> =A0drivers/ide/ide-disk_proc.c =A0 | =A0 =A02 +-
> =A0drivers/ide/ide-floppy_proc.c | =A0 =A02 +-
> =A0drivers/ide/ide-proc.c =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0drivers/ide/ide-tape.c =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A04 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/ide/ide-disk_proc.c b/drivers/ide/ide-disk_proc.c
> index 3f2a078..eaea3be 100644
> --- a/drivers/ide/ide-disk_proc.c
> +++ b/drivers/ide/ide-disk_proc.c
> @@ -127,5 +127,5 @@ const struct ide_proc_devset ide_disk_settings[] =3D {
> =A0 =A0 =A0 =A0IDE_PROC_DEVSET(multcount, =A0 =A0 =A00, =A0 =A016),
> =A0 =A0 =A0 =A0IDE_PROC_DEVSET(nowerr, =A0 =A0 =A0 =A0 0, =A0 =A0 1),
> =A0 =A0 =A0 =A0IDE_PROC_DEVSET(wcache, =A0 =A0 =A0 =A0 0, =A0 =A0 1),
> - =A0 =A0 =A0 { 0 },
> + =A0 =A0 =A0 { NULL },
> =A0};
> diff --git a/drivers/ide/ide-floppy_proc.c b/drivers/ide/ide-floppy_proc.c
> index 3ec762c..fcd4d81 100644
> --- a/drivers/ide/ide-floppy_proc.c
> +++ b/drivers/ide/ide-floppy_proc.c
> @@ -29,5 +29,5 @@ const struct ide_proc_devset ide_floppy_settings[] =3D {
> =A0 =A0 =A0 =A0IDE_PROC_DEVSET(bios_head, 0, =A0255),
> =A0 =A0 =A0 =A0IDE_PROC_DEVSET(bios_sect, 0, =A0 63),
> =A0 =A0 =A0 =A0IDE_PROC_DEVSET(ticks, =A0 =A0 0, =A0255),
> - =A0 =A0 =A0 { 0 },
> + =A0 =A0 =A0 { NULL },
> =A0};
> diff --git a/drivers/ide/ide-proc.c b/drivers/ide/ide-proc.c
> index 0ee8887..10a88bf 100644
> --- a/drivers/ide/ide-proc.c
> +++ b/drivers/ide/ide-proc.c
> @@ -231,7 +231,7 @@ static const struct ide_proc_devset ide_generic_setti=
ngs[] =3D {
> =A0 =A0 =A0 =A0IDE_PROC_DEVSET(pio_mode, 0, 255),
> =A0 =A0 =A0 =A0IDE_PROC_DEVSET(unmaskirq, 0, 1),
> =A0 =A0 =A0 =A0IDE_PROC_DEVSET(using_dma, 0, 1),
> - =A0 =A0 =A0 { 0 },
> + =A0 =A0 =A0 { NULL },
> =A0};
>
> =A0static void proc_ide_settings_warn(void)
> diff --git a/drivers/ide/ide-tape.c b/drivers/ide/ide-tape.c
> index 1b97d7a..e9e570f 100644
> --- a/drivers/ide/ide-tape.c
> +++ b/drivers/ide/ide-tape.c
> @@ -2138,7 +2138,7 @@ static const struct ide_proc_devset idetape_setting=
s[] =3D {
> =A0 =A0 =A0 =A0__IDE_PROC_DEVSET(speed, =A0 =A0 =A0 =A00, 0xffff, NULL, N=
ULL),
> =A0 =A0 =A0 =A0__IDE_PROC_DEVSET(tdsc, =A0 =A0 =A0 =A0 IDETAPE_DSC_RW_MIN=
, IDETAPE_DSC_RW_MAX,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0mulf_tdsc, divf_tdsc),
> - =A0 =A0 =A0 { 0 },
> + =A0 =A0 =A0 { NULL },
> =A0};
> =A0#endif
>
>
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
