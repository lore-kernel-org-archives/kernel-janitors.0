From: Petr Machata <petrm@mellanox.com>
Date: Tue, 30 Jul 2019 12:19:38 +0000
Subject: Re: [PATCH][net-next][V2] mlxsw: spectrum_ptp: fix duplicated check on orig_egr_types
Message-Id: <87h873zpd3.fsf@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190730114752.24133-1-colin.king@canonical.com>
In-Reply-To: <20190730114752.24133-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, "David S . Miller" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>


Colin King <colin.king@canonical.com> writes:

> From: Colin Ian King <colin.king@canonical.com>
>
> Currently are duplicated checks on orig_egr_types which are
> redundant, I believe this is a typo and should actually be
> orig_ing_types || orig_egr_types instead of the expression
> orig_egr_types || orig_egr_types.  Fix these.
>
> Addresses-Coverity: ("Same on both sides")
> Fixes: c6b36bdd04b5 ("mlxsw: spectrum_ptp: Increase parsing depth when PTP is enabled")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thank you, it looks good. But can you please direct this to "net", not
"net-next"?
