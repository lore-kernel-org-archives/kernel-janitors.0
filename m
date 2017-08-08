From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Tue, 08 Aug 2017 12:37:03 +0000
Subject: Re: [PATCH 5/6] [media] exynos4-is: constify video_subdev structures
Message-Id: <5c673a72-98f6-1501-845e-7d83fabfa659@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1502189912-28794-1-git-send-email-Julia.Lawall@lip6.fr>
 <1502189912-28794-6-git-send-email-Julia.Lawall@lip6.fr>
 <CGME20170808123709epcas2p229a31cfa19e3a5bf3986e547162e2613@epcas2p2.samsung.com>
In-Reply-To: <1502189912-28794-6-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On 08/08/2017 12:58 PM, Julia Lawall wrote:
> The v4l2_subdev_ops structures are only passed as the second
> argument of v4l2_subdev_init, which is const, so the
> v4l2_subdev_ops structures can be const as well.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall<Julia.Lawall@lip6.fr>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
