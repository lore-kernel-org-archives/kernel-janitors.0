From: YanBo <dreamfly281@gmail.com>
Date: Mon, 22 Dec 2008 02:10:17 +0000
Subject: Re: [PATCH 2/3] drivers/staging/agnx: Move a dereference below a NULL test
Message-Id: <1197ff4c0812211810s796a367m7b5dc6b43724c0e0@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812191810240.11217@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812191810240.11217@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: gregkh@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Dec 20, 2008 at 1:11 AM, Julia Lawall <julia@diku.dk> wrote:
> From: Julia Lawall <julia@diku.dk>
>
> If the NULL test is necessary, then the dereference should be moved below
> the NULL test.
>
> The semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
>
> // <smpl>
> @@
> type T;
> expression E;
> identifier i,fld;
> statement S;
> @@
>
> - T i = E->fld;
> + T i;
>  ... when != E
>      when != i
>  if (E = NULL) S
> + i = E->fld;
> // </smpl>
>
> Signed-off-by: Julia Lawall <julia@diku.dk>
>
> ---
>  drivers/staging/agnx/pci.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff -u -p a/drivers/staging/agnx/pci.c b/drivers/staging/agnx/pci.c
> --- a/drivers/staging/agnx/pci.c
> +++ b/drivers/staging/agnx/pci.c
> @@ -440,11 +440,12 @@ static struct ieee80211_ops agnx_ops = {
>  static void __devexit agnx_pci_remove(struct pci_dev *pdev)
>  {
>        struct ieee80211_hw *dev = pci_get_drvdata(pdev);
> -       struct agnx_priv *priv = dev->priv;
> +       struct agnx_priv *priv;
>        AGNX_TRACE;
>
>        if (!dev)
>                return;
> +       priv = dev->priv;
>        ieee80211_unregister_hw(dev);
>        pci_iounmap(pdev, priv->ctl);
>        pci_iounmap(pdev, priv->data);
>

Thanks! Will pulled to the AGNX git tree.

BR
Yanbo
