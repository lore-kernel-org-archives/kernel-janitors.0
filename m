From: Kevin Hilman <khilman@baylibre.com>
Date: Thu, 05 Dec 2019 02:39:06 +0000
Subject: Re: [PATCH] media: meson: add missing allocation failure check on new_buf
Message-Id: <m2a7877ayd.fsf@baylibre.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191204141159.1432387-1-colin.king@canonical.com>
In-Reply-To: <20191204141159.1432387-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Maxime Jourdan <mjourdan@baylibre.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org, devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> writes:

> From: Colin Ian King <colin.king@canonical.com>
>
> Currently if the allocation of new_buf fails then a null pointer
> dereference occurs when assiging new_buf->vb. Avoid this by returning
> early on a memory allocation failure as there is not much more can
> be done at this point.
>
> Addresses-Coverity: ("Dereference null return")
> Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
