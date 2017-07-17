From: Richard Weinberger <richard@nod.at>
Date: Mon, 17 Jul 2017 16:03:28 +0000
Subject: Re: [PATCH][next] ubifs: fix uninitialized error variable err
Message-Id: <07004331-e62a-7c02-97db-bc69f8256c9b@nod.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170717160001.20285-1-colin.king@canonical.com>
In-Reply-To: <20170717160001.20285-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Artem Bityutskiy <dedekind1@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, hyc.lee@gmail.com, Geert Uytterhoeven <geert@linux-m68k.org>

Colin,

Am 17.07.2017 um 18:00 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable err is not initialized and so the check to see if it is
> non-zero is basically checking a random garbage value. Fix this
> by initializing err to zero.
> 
> Detected by CoverityScan, CID#1451370 ("Uninitialized variable")
> 
> Fixes: 781f675e2d7e ("ubifs: Fix unlink code wrt. double hash lookups")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, geert already pointed out that I've merged a bad patch.
I managed to merge the patch without the issues fixed that Hyunchul Lee
identified. ;-(

Thanks,
//richard
