From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2020 14:36:19 +0000
Subject: Re: [PATCH -next] drm/rcar-du: Fix return value check in rcar_du_cmm_init()
Message-Id: <CAMuHMdU0Chy6vmHBc6xqKZ3uQ=3NxZeZ7gt7FvCOLWh--Gcxdg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200428141716.87958-1-weiyongjun1@huawei.com>
In-Reply-To: <20200428141716.87958-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, DRI Development <dri-devel@lists.freedesktop.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

On Tue, Apr 28, 2020 at 4:16 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:
> In case of error, the function of_parse_phandle()/of_find_device_by_node()
> returns NULL pointer not ERR_PTR(). The IS_ERR() test in the return value
> check should be replaced with NULL test
>
> Fixes: 8de707aeb452 ("drm: rcar-du: kms: Initialize CMM instances")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
