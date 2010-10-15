From: Belisko Marek <marek.belisko@gmail.com>
Date: Fri, 15 Oct 2010 06:19:07 +0000
Subject: Re: [patch 1/2] Staging: ft1000-usb: use the correct list head
Message-Id: <AANLkTim9UBjJ9AN2MPjBtru6r8fpofwpK+ccELpg9i5x@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101015034042.GF6614@bicker>
In-Reply-To: <20101015034042.GF6614@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Fri, Oct 15, 2010 at 5:40 AM, Dan Carpenter <error27@gmail.com> wrote:
> Using pdpram_blk here would cause an oops.  We intended to use
> &freercvpool.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
>
> diff --git a/drivers/staging/ft1000/ft1000-usb/ft1000_hw.c b/drivers/staging/ft1000/ft1000-usb/ft1000_hw.c
> index d0637c3..076ba75 100644
> --- a/drivers/staging/ft1000/ft1000-usb/ft1000_hw.c
> +++ b/drivers/staging/ft1000/ft1000-usb/ft1000_hw.c
> @@ -1115,7 +1115,7 @@ u16 init_ft1000_netdev(struct ft1000_device *ft1000dev)
>
>
>  err_free:
> -       list_for_each_safe(cur, tmp, &pdpram_blk->list) {
> +       list_for_each_safe(cur, tmp, &freercvpool) {
>                pdpram_blk = list_entry(cur, DPRAM_BLK, list);
>                list_del(&pdpram_blk->list);
>                kfree(pdpram_blk->pbuffer);
>

Greg, you can add my Tested by: Marek Belisko <marek.belisko@gmail.com>

@Dan, good catch. Thanks.

Marek


-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
icq: 290551086
web: http://open-nandra.com
