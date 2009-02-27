From: Hannes Eder <hannes@hanneseder.net>
Date: Fri, 27 Feb 2009 01:02:25 +0000
Subject: Re: [PATCH 06/16] MTD: tests: fix sparse warnings: Using plain
Message-Id: <154e089b0902261702r52432481q6a0561de9576ed71@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
	 <20090222000216.17557.92413.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090222000216.17557.92413.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: trivial@kernel.org, Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

[Added To]

On Sun, Feb 22, 2009 at 1:02 AM, Hannes Eder <hannes@hanneseder.net> wrote:
> Fix this sparse warnings:
> =A0drivers/mtd/tests/mtd_oobtest.c:139:33: warning: Using plain integer a=
s NULL pointer
> =A0drivers/mtd/tests/mtd_oobtest.c:192:33: warning: Using plain integer a=
s NULL pointer
> =A0drivers/mtd/tests/mtd_oobtest.c:219:41: warning: Using plain integer a=
s NULL pointer
> =A0drivers/mtd/tests/mtd_oobtest.c:284:25: warning: Using plain integer a=
s NULL pointer
> =A0drivers/mtd/tests/mtd_oobtest.c:525:25: warning: Using plain integer a=
s NULL pointer
> =A0drivers/mtd/tests/mtd_oobtest.c:545:25: warning: Using plain integer a=
s NULL pointer
> =A0drivers/mtd/tests/mtd_oobtest.c:569:33: warning: Using plain integer a=
s NULL pointer
> =A0drivers/mtd/tests/mtd_oobtest.c:589:33: warning: Using plain integer a=
s NULL pointer
> =A0drivers/mtd/tests/mtd_oobtest.c:613:33: warning: Using plain integer a=
s NULL pointer
> =A0drivers/mtd/tests/mtd_oobtest.c:633:33: warning: Using plain integer a=
s NULL pointer
> =A0drivers/mtd/tests/mtd_oobtest.c:673:41: warning: Using plain integer a=
s NULL pointer
> =A0drivers/mtd/tests/mtd_oobtest.c:701:33: warning: Using plain integer a=
s NULL pointer
> =A0drivers/mtd/tests/mtd_readtest.c:74:41: warning: Using plain integer a=
s NULL pointer
>
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> ---
> =A0drivers/mtd/tests/mtd_oobtest.c =A0| =A0 24 ++++++++++++------------
> =A0drivers/mtd/tests/mtd_readtest.c | =A0 =A02 +-
> =A02 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/mtd/tests/mtd_oobtest.c b/drivers/mtd/tests/mtd_oobt=
est.c
> index afbc3f8..a18e8d2 100644
> --- a/drivers/mtd/tests/mtd_oobtest.c
> +++ b/drivers/mtd/tests/mtd_oobtest.c
> @@ -136,7 +136,7 @@ static int write_eraseblock(int ebnum)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.ooblen =A0 =A0=3D use_len;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.oobretlen =3D 0;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.ooboffs =A0 =3D use_offset;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.datbuf =A0 =A0=3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.datbuf =A0 =A0=3D NULL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.oobbuf =A0 =A0=3D writebuf;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0err =3D mtd->write_oob(mtd, addr, &ops);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (err || ops.oobretlen !=3D use_len) {
> @@ -189,7 +189,7 @@ static int verify_eraseblock(int ebnum)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.ooblen =A0 =A0=3D use_len;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.oobretlen =3D 0;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.ooboffs =A0 =3D use_offset;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.datbuf =A0 =A0=3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.datbuf =A0 =A0=3D NULL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.oobbuf =A0 =A0=3D readbuf;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0err =3D mtd->read_oob(mtd, addr, &ops);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (err || ops.oobretlen !=3D use_len) {
> @@ -216,7 +216,7 @@ static int verify_eraseblock(int ebnum)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.ooblen =A0 =A0=3D mtd-=
>ecclayout->oobavail;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.oobretlen =3D 0;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.ooboffs =A0 =3D 0;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.datbuf =A0 =A0=3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.datbuf =A0 =A0=3D NULL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.oobbuf =A0 =A0=3D read=
buf;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0err =3D mtd->read_oob(mtd,=
 addr, &ops);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (err || ops.oobretlen !=
=3D mtd->ecclayout->oobavail) {
> @@ -281,7 +281,7 @@ static int verify_eraseblock_in_one_go(int ebnum)
> =A0 =A0 =A0 =A0ops.ooblen =A0 =A0=3D len;
> =A0 =A0 =A0 =A0ops.oobretlen =3D 0;
> =A0 =A0 =A0 =A0ops.ooboffs =A0 =3D 0;
> - =A0 =A0 =A0 ops.datbuf =A0 =A0=3D 0;
> + =A0 =A0 =A0 ops.datbuf =A0 =A0=3D NULL;
> =A0 =A0 =A0 =A0ops.oobbuf =A0 =A0=3D readbuf;
> =A0 =A0 =A0 =A0err =3D mtd->read_oob(mtd, addr, &ops);
> =A0 =A0 =A0 =A0if (err || ops.oobretlen !=3D len) {
> @@ -522,7 +522,7 @@ static int __init mtd_oobtest_init(void)
> =A0 =A0 =A0 =A0ops.ooblen =A0 =A0=3D 1;
> =A0 =A0 =A0 =A0ops.oobretlen =3D 0;
> =A0 =A0 =A0 =A0ops.ooboffs =A0 =3D mtd->ecclayout->oobavail;
> - =A0 =A0 =A0 ops.datbuf =A0 =A0=3D 0;
> + =A0 =A0 =A0 ops.datbuf =A0 =A0=3D NULL;
> =A0 =A0 =A0 =A0ops.oobbuf =A0 =A0=3D writebuf;
> =A0 =A0 =A0 =A0printk(PRINT_PREF "attempting to start write past end of O=
OB\n");
> =A0 =A0 =A0 =A0printk(PRINT_PREF "an error is expected...\n");
> @@ -542,7 +542,7 @@ static int __init mtd_oobtest_init(void)
> =A0 =A0 =A0 =A0ops.ooblen =A0 =A0=3D 1;
> =A0 =A0 =A0 =A0ops.oobretlen =3D 0;
> =A0 =A0 =A0 =A0ops.ooboffs =A0 =3D mtd->ecclayout->oobavail;
> - =A0 =A0 =A0 ops.datbuf =A0 =A0=3D 0;
> + =A0 =A0 =A0 ops.datbuf =A0 =A0=3D NULL;
> =A0 =A0 =A0 =A0ops.oobbuf =A0 =A0=3D readbuf;
> =A0 =A0 =A0 =A0printk(PRINT_PREF "attempting to start read past end of OO=
B\n");
> =A0 =A0 =A0 =A0printk(PRINT_PREF "an error is expected...\n");
> @@ -566,7 +566,7 @@ static int __init mtd_oobtest_init(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.ooblen =A0 =A0=3D mtd->ecclayout->ooba=
vail + 1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.oobretlen =3D 0;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.ooboffs =A0 =3D 0;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.datbuf =A0 =A0=3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.datbuf =A0 =A0=3D NULL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.oobbuf =A0 =A0=3D writebuf;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(PRINT_PREF "attempting to write pas=
t end of device\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(PRINT_PREF "an error is expected...=
\n");
> @@ -586,7 +586,7 @@ static int __init mtd_oobtest_init(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.ooblen =A0 =A0=3D mtd->ecclayout->ooba=
vail + 1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.oobretlen =3D 0;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.ooboffs =A0 =3D 0;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.datbuf =A0 =A0=3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.datbuf =A0 =A0=3D NULL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.oobbuf =A0 =A0=3D readbuf;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(PRINT_PREF "attempting to read past=
 end of device\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(PRINT_PREF "an error is expected...=
\n");
> @@ -610,7 +610,7 @@ static int __init mtd_oobtest_init(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.ooblen =A0 =A0=3D mtd->ecclayout->ooba=
vail;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.oobretlen =3D 0;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.ooboffs =A0 =3D 1;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.datbuf =A0 =A0=3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.datbuf =A0 =A0=3D NULL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.oobbuf =A0 =A0=3D writebuf;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(PRINT_PREF "attempting to write pas=
t end of device\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(PRINT_PREF "an error is expected...=
\n");
> @@ -630,7 +630,7 @@ static int __init mtd_oobtest_init(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.ooblen =A0 =A0=3D mtd->ecclayout->ooba=
vail;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.oobretlen =3D 0;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.ooboffs =A0 =3D 1;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.datbuf =A0 =A0=3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.datbuf =A0 =A0=3D NULL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.oobbuf =A0 =A0=3D readbuf;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(PRINT_PREF "attempting to read past=
 end of device\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(PRINT_PREF "an error is expected...=
\n");
> @@ -670,7 +670,7 @@ static int __init mtd_oobtest_init(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.ooblen =A0 =A0=3D sz;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.oobretlen =3D 0;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.ooboffs =A0 =3D 0;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.datbuf =A0 =A0=3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.datbuf =A0 =A0=3D NULL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.oobbuf =A0 =A0=3D writ=
ebuf;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0err =3D mtd->write_oob(mtd=
, addr, &ops);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (err)
> @@ -698,7 +698,7 @@ static int __init mtd_oobtest_init(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.ooblen =A0 =A0=3D mtd->ecclayout->ooba=
vail * 2;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.oobretlen =3D 0;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.ooboffs =A0 =3D 0;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.datbuf =A0 =A0=3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.datbuf =A0 =A0=3D NULL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.oobbuf =A0 =A0=3D readbuf;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0err =3D mtd->read_oob(mtd, addr, &ops);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (err)
> diff --git a/drivers/mtd/tests/mtd_readtest.c b/drivers/mtd/tests/mtd_rea=
dtest.c
> index 645e77f..79fc453 100644
> --- a/drivers/mtd/tests/mtd_readtest.c
> +++ b/drivers/mtd/tests/mtd_readtest.c
> @@ -71,7 +71,7 @@ static int read_eraseblock_by_page(int ebnum)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.ooblen =A0 =A0=3D mtd-=
>oobsize;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.oobretlen =3D 0;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.ooboffs =A0 =3D 0;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.datbuf =A0 =A0=3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.datbuf =A0 =A0=3D NULL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.oobbuf =A0 =A0=3D oobb=
uf;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D mtd->read_oob(mtd,=
 addr, &ops);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret || ops.oobretlen !=
=3D mtd->oobsize) {
>
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
