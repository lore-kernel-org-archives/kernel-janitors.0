From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Mon, 07 Aug 2017 10:23:36 +0000
Subject: Re: [PATCH 03/12] [media] s5p-g2d: constify v4l2_m2m_ops structures
Message-Id: <bc93fea6-89fb-25c3-ce97-9e8c17d13ac8@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1502007921-22968-1-git-send-email-Julia.Lawall@lip6.fr>
 <1502007921-22968-4-git-send-email-Julia.Lawall@lip6.fr>
 <CGME20170807102341epcas2p2da8478bd73ca0678071912323830e456@epcas2p2.samsung.com>
In-Reply-To: <1502007921-22968-4-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On 08/06/2017 10:25 AM, Julia Lawall wrote:
> The v4l2_m2m_ops structures are only passed as the only
> argument to v4l2_m2m_init, which is declared as const.
> Thus the v4l2_m2m_ops structures themselves can be const.
> 
> Done with the help of Coccinelle.

> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
