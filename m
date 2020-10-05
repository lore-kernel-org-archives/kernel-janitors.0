From: Will Deacon <will@kernel.org>
Date: Mon, 05 Oct 2020 08:26:04 +0000
Subject: Re: [PATCH][next] perf: arm-cmn: fix less than zero check on unsigned dtc->irq
Message-Id: <20201005082603.GA23480@willie-the-truck>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201002154800.92607-1-colin.king@canonical.com>
In-Reply-To: <20201002154800.92607-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: Mark Rutland <mark.rutland@arm.com>, kernel-janitors@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Fri, Oct 02, 2020 at 04:48:00PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Currently the failure check on dtc->irq is always false because
> dtc->irq is an unsigned int. Fix this by using a temporary signed
> int for the less than zero error check.
>=20
> Addresses-Coverity: ("Unsigned compared against 0")
> Fixes: 0ba64770a2f2 ("perf: Add Arm CMN-600 PMU driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/perf/arm-cmn.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Cheers, but Gustavo beat you to it and I had a crack at a different fix
which should now be in -next:

https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/?h=
=3Dfor-next/core&id=D9ef632fab9ba81b708763bcbcfdbea9a55c95d2

Will
