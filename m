From: =?UTF-8?B?TWFoZXNoIEJhbmRld2FyICjgpK7gpLngpYfgpLYg4KSs4KSC4KSh4KWH4KS14KS+4KSwKQ
Date: Wed, 03 Jan 2018 07:00:25 +0000
Subject: Re: [PATCH] bonding: Delete an error message for a failed memory allocation in bond_update_slave_arr
Message-Id: <CAF2d9jhjL7pbcsEzwXRxLVzyMid5s2OY96AwSyRTuuqho-w_EQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6cdc726b-82bc-85b6-393b-0e2002c19341@users.sourceforge.net>
In-Reply-To: <6cdc726b-82bc-85b6-393b-0e2002c19341@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-netdev <netdev@vger.kernel.org>, Andy Gospodarek <andy@greyhouse.net>, Jay Vosburgh <j.vosburgh@gmail.com>, Veaceslav Falico <vfalico@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Jan 1, 2018 at 8:07 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 1 Jan 2018 17:00:04 +0100
>
> Omit an extra message for a memory allocation failure in this function.
>
> This issue was detected by using the Coccinelle software.
>
What is the issue with this message?

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/net/bonding/bond_main.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
> index c669554d70bb..a96e0c9cc4bf 100644
> --- a/drivers/net/bonding/bond_main.c
> +++ b/drivers/net/bonding/bond_main.c
> @@ -3910,7 +3910,6 @@ int bond_update_slave_arr(struct bonding *bond, struct slave *skipslave)
>                           GFP_KERNEL);
>         if (!new_arr) {
>                 ret = -ENOMEM;
> -               pr_err("Failed to build slave-array.\n");
>                 goto out;
>         }
>         if (BOND_MODE(bond) = BOND_MODE_8023AD) {
> --
> 2.15.1
>
