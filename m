From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 16 Dec 2019 08:43:43 +0000
Subject: Re: [PATCH] fore200e: Fix incorrect checks of NULL pointer dereference
Message-Id: <47757327-f6df-9146-03a1-2b32b23a37e6@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191215161451.24221-1-pakki001@umn.edu>
In-Reply-To: <20191215161451.24221-1-pakki001@umn.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Aditya Pakki <pakki001@umn.edu>, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Chas Williams <3chas3@gmail.com>, Kangjie Lu <kjlu@umn.edu>

> The patch fixes these issues by avoiding NULL pointer dereferences.

I suggest to choose a better wording for this change description.

Will the tag “Fixes” become helpful here?


…
> +++ b/drivers/atm/fore200e.c
…
> @@ -1480,9 +1482,18 @@ fore200e_send(struct atm_vcc *vcc, struct sk_buff *skb)
…
> +    fore200e = FORE200E_DEV(vcc->dev);
> +    fore200e_vcc = FORE200E_VCC(vcc);
> +
> +    if (!fore200e)
> +        return -EINVAL;
> +
> +    txq = &fore200e->host_txq;
> +    if (!fore200e_vcc)
> +        return -EINVAL;
>
>      if (!test_bit(ATM_VF_READY, &vcc->flags)) {
…


Can the following adjustment be nicer?

+    fore200e_vcc = FORE200E_VCC(vcc);
+    if (!fore200e_vcc)
+        return -EINVAL;
+
+    fore200e = FORE200E_DEV(vcc->dev);
+    if (!fore200e)
+        return -EINVAL;
+
+    txq = &fore200e->host_txq;


Regards,
Markus
