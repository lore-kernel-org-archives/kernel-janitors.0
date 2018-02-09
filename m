From: Kevin Hilman <khilman@baylibre.com>
Date: Fri, 09 Feb 2018 00:49:15 +0000
Subject: Re: [PATCH -next] meson-mx-socinfo: Make local function meson_mx_socinfo_init() static
Message-Id: <CAOi56cXBqOrABbwwaf-S9_vvYFSRg4855QH4ZvE_ZPZ=nnsphg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1515593980-78559-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1515593980-78559-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linus-amlogic@lists.infradead.org

On Wed, Jan 10, 2018 at 6:19 AM, Wei Yongjun <weiyongjun1@huawei.com> wrote:
> Fixes the following sparse warnings:
>
> drivers/soc/amlogic/meson-mx-socinfo.c:107:12: warning:
>  symbol 'meson_mx_socinfo_init' was not declared. Should it be static?
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied for v4.17,

Kevin
