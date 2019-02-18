From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 18 Feb 2019 08:40:57 +0000
Subject: Re: [PATCH][V3] regulator: axp20x: remove a redundant null check on rdev
Message-Id: <CAGb2v65JsDOMoUy8E1NbM8ccob7B110hZLbO18+3oS-i6m9w+A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190215094554.28593-1-colin.king@canonical.com>
In-Reply-To: <20190215094554.28593-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

On Fri, Feb 15, 2019 at 5:46 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently rdev is dereferenced when assigning desc before rdev is null
> checked, this is leading to static analysis warnings.  However, rdev
> can never be null, so the null check is redundant and can be removed.
>
> Detected by CoverityScan, CID#1476031 ("Dereference before null check")
>
> Fixes: 77e3e3b165db ("regulator: axp20x: add software based soft_start for AXP209 LDO3")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
