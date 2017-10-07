From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 07 Oct 2017 14:03:41 +0000
Subject: Re: [PATCH] platform/x86: mlx-platform: make a couple of structures static
Message-Id: <CAHp75Vf8k-hmk4n86foSfSPZxVUQJmGNFkf8ExUKbF2nXaSy8A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171005104211.30440-1-colin.king@canonical.com>
In-Reply-To: <20171005104211.30440-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Vadim Pasternak <vadimp@mellanox.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Oct 5, 2017 at 1:42 PM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The structures mlxplat_dev and mlxplat_hotplug are local to the source
> and do not need to be in global scope, so make them static.
>
> Cleans up sparse warnings:
> symbol 'mlxplat_dev' was not declared. Should it be static?
> symbol 'mlxplat_hotplug' was not declared. Should it be static?

Thanks for the patch.
Since Vadim did some rather big driver changes I would like to hear
from him how to proceed with this one: either I apply it now, or after
we get Vadim's series in.

-- 
With Best Regards,
Andy Shevchenko
