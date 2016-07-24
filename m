From: Evgeniy Polyakov <zbr@ioremap.net>
Date: Sun, 24 Jul 2016 08:25:10 +0000
Subject: Re: [PATCH 0/2] drivers: w1: coding style corrections
Message-Id: <66911469348710@web2j.yandex.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1469247089-8093-1-git-send-email-ben.werbowyj@gmail.com>
In-Reply-To: <1469247089-8093-1-git-send-email-ben.werbowyj@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Hi Ben

24.07.2016, 01:46, "Ben Werbowyj" <ben.werbowyj@gmail.com>:
> Coding style corrections for the Dallas 1-wire driver.
> Changes made were reported by the checkpatch.pl script.
>
> Ben Werbowyj (2):
>   driver: w1: fix quoted strings split across lines
>   drivers: w1: fix order of operands in comparisons
>
>  drivers/w1/masters/omap_hdq.c | 31 +++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 14 deletions(-)

Patch looks good to me.

Please combine the whole w1 space-string cleanups into single patch,
it will be much easier to review and ack.
