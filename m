From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 26 Oct 2019 18:08:29 +0000
Subject: Re: [PATCH] wimax: i2400: Fix memory leak in i2400m_op_rfkill_sw_toggle
Message-Id: <fa90b9ac-9ff9-7b08-f31f-f349a9fb0a58@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191026045331.1097-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191026045331.1097-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, linux-wimax@intel.com, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>

> Move kfree(cmd) before return to be reached by all execution paths.

I suggest to reconsider this change suggestion once more.


> Fixes: 2507e6ab7a9a ("wimax: i2400: fix memory leak")

I find it interesting that you would like to fix your commit from 2019-09-10.
https://lore.kernel.org/patchwork/patch/1126399/

Will it be helpful to refer also to the commit 024f7f31ed15c471f80408d8b5045497e27e1135
("i2400m: Generic probe/disconnect, reset and message passing" from 2009-01-07)?


> +++ b/drivers/net/wimax/i2400m/op-rfkill.c
> @@ -127,12 +127,12 @@ int i2400m_op_rfkill_sw_toggle(struct wimax_dev *wimax_dev,
>  			"%d\n", result);
>  	result = 0;
>  error_cmd:
> -	kfree(cmd);
>  	kfree_skb(ack_skb);
>  error_msg_to_dev:
>  error_alloc:
>  	d_fnend(4, dev, "(wimax_dev %p state %d) = %d\n",
>  		wimax_dev, state, result);
> +	kfree(cmd);
>  	return result;
>  }


I would prefer to improve the exception handling like the following.
(Would you like to avoid passing a null pointer at the end?)

-error_cmd:
+free_skb:
-	kfree(cmd);
 	kfree_skb(ack_skb);
-error_msg_to_dev:
+free_cmd:
+	kfree(cmd);
-error_alloc:
+exit:


How do you think about this update variant?

Regards,
Markus
