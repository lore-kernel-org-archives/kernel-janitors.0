From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 27 Dec 2018 08:59:38 +0000
Subject: Re: [PATCH][next] drivers: base: swnode: check if swnode is null before dereferencing it
Message-Id: <CAJZ5v0iNBH3oLsQmMowdsdsK0WToZBk5tNNAhiXxAPSfdXoyLg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181222124333.13561-1-colin.king@canonical.com>
In-Reply-To: <20181222124333.13561-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, Dec 22, 2018 at 1:43 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The macro to_software_mode can potentially return NULL, so also add
> a null check on the swnode before dereferencing it to avoid any null
> pointer dereferences.
>
> Detected by CoverityScan, CID#1476052 ("Explicit null dereferenced")
>
> Fixes: 59abd83672f7 ("drivers: base: Introducing software nodes to the firmware node framework")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/base/swnode.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index 306bb93287af..204aa7d049e0 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -477,7 +477,8 @@ software_node_get_parent(const struct fwnode_handle *fwnode)
>  {
>         struct software_node *swnode = to_software_node(fwnode);
>
> -       return swnode->parent ? &swnode->parent->fwnode : NULL;
> +       return swnode ? (swnode->parent ? &swnode->parent->fwnode : NULL) :
> +                       NULL;
>  }
>
>  struct fwnode_handle *
> --

Applied, thanks!
