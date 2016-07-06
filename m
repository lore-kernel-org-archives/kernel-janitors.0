From: Alexandre Courbot <gnurou@gmail.com>
Date: Wed, 06 Jul 2016 14:17:30 +0000
Subject: Re: [patch] drm/tegra: sor: Double free on error
Message-Id: <CAAVeFuJhsGjGyK4Fk5qAk3jp9L5LnnuVCg8srwibg1hjWfvpEg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160704074501.GA4849@mwanda>
In-Reply-To: <20160704074501.GA4849@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>

On Mon, Jul 4, 2016 at 4:45 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> "brick" is allocated with devm_kzalloc() so freeing it with kfree()
> leads to a double free.  We can just delete it.

That makes perfect sense.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
