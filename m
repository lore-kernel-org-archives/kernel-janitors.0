From: NeilBrown <neilb@suse.de>
Date: Mon, 24 Sep 2012 23:34:53 +0000
Subject: Re: [md:for-next 29/29] ERROR: "__tracepoint_block_unplug" [drivers/md/raid456.ko] undefined!
Message-Id: <20120925093453.0fbb2acc@notabene.brown>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Sig_/OuI9twlQaqg4b858H9070/L"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120924081513.GA12612@localhost>
In-Reply-To: <20120924081513.GA12612@localhost>
To: kernel-janitors@vger.kernel.org

--Sig_/OuI9twlQaqg4b858H9070/L
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 24 Sep 2012 16:15:13 +0800 Fengguang Wu <fengguang.wu@intel.com>
wrote:

> Hi NeilBrown,
>=20
> FYI, kernel build failed on
>=20
> tree:   git://neil.brown.name/md for-next/14817e9
> head:   14817e9a6dab027db44783d28429d14f601547a2
> commit: 14817e9a6dab027db44783d28429d14f601547a2 [29/29] md/raid5: add bl=
ktrace calls
> config: sparc64-defconfig
>=20
> ERROR: "__tracepoint_block_unplug" [drivers/md/raid456.ko] undefined!
>=20
> The root cause is, the block trace points are only available when
> block/blk-core.c is compiled in.

Hi,
 thanks for this.
blk-core must be compiled in, else raid456 wouldn't get compiled
CONFIG_MD_RAID456 eventually depends on CONFIG_BLOCK.

The problem is simply that tracepoint_block_unplug hasn't been exported.
This fixes it:

diff --git a/block/blk-core.c b/block/blk-core.c
index 4b4dbdf..ef55ae0 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -40,6 +40,7 @@
 EXPORT_TRACEPOINT_SYMBOL_GPL(block_bio_remap);
 EXPORT_TRACEPOINT_SYMBOL_GPL(block_rq_remap);
 EXPORT_TRACEPOINT_SYMBOL_GPL(block_bio_complete);
+EXPORT_TRACEPOINT_SYMBOL_GPL(block_unplug);
=20
 DEFINE_IDA(blk_queue_ida);
=20

I'll see if Jens will take it.

Thanks,
NeilBrown

--Sig_/OuI9twlQaqg4b858H9070/L
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQIVAwUBUGDuHTnsnt1WYoG5AQLHUw//T8CcCeXYbJf3arOoYEUih/egzGVBLFfW
/dt3Exd8VTtoc27B49bZcfClqm5Z2F0NqFTQx0GOmMuZl7buO606PAjjP7ak0FJ1
InRnvYnxLHPQTTjcjCZB1Yc1j5ZaTlHgf9F472dhBAYNCaGNfdqtsWMHgABuJxIv
QPr8LVZ2AFQMuY0JIeO+qoYrPifR79999/YehG0082uA0PVZhKtipnOXiSRKVAo1
N2H3XTGFajJrBJG/XujcO86kX81xUWCH25UCbrLQAMBMm50/Mh+dqZqjq8fnP5Jn
wQcYotHoUCX2T2zB3U2T5rSw45JTHgtClFJRbdWzqceGcLFtFj2U+3OBmqu+UAgI
cC9ww+O2MWqLDH6Xs9lk/1PF3nW8p5yOxLViHYrSjysNUDrVtYAEwhVxXMkFM1z9
8Os7JzJyD3bAwMUwNGxNPKgtMGmwGHUJWp0CyE+jWn9CqK7zVOuaLgSZOlQZpUhv
AtConHaN1h7aDGWD2cKv/MUFgNC6ghVbavMBjC8m8luOhxp88CkZUx1X5t19wKBz
GUqwjVUw30l0eSCOZIg9Y+HymoPGuoJ5efxI0Gjl4Y9deozspvrhAySj2FB451JU
1bOFeey2vl5WkG13L648viHvj74HIBY7Oc3ohVxIto6PmpUhRZh7fKKtcL2NLYcl
k0XAYj/6drQ=
=TxOn
-----END PGP SIGNATURE-----

--Sig_/OuI9twlQaqg4b858H9070/L--
