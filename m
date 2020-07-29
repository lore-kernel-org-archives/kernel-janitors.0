From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 29 Jul 2020 17:16:58 +0000
Subject: Re: [PATCH] atm: Fix atm_dev reference count leaks in atmtcp_remove_persistent()
Message-Id: <444f9cec-db06-c3b1-eadc-14b11260a4ec@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Xin Xiong <xiongx18@fudan.edu.cn>, Xiyu Yang <xiyuyang19@fudan.edu.cn>, Xin Tan <tanxin.ctf@gmail.com>, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Chas Williams <3chas3@gmail.com>, Yuan Zhang <yuanxzhang@fudan.edu.cn>

…
> The refcount leaks issues occur in two error handling paths.

Can it be nicer to use the term “reference count” for the commit message?


> Fix the issue by …

I suggest to replace this wording by the tag “Fixes”.


…
> +++ b/drivers/atm/atmtcp.c
> @@ -433,9 +433,15 @@  static int atmtcp_remove_persistent(int itf)
>  		return -EMEDIUMTYPE;
>  	}
>  	dev_data = PRIV(dev);
> -	if (!dev_data->persist) return 0;
> +	if (!dev_data->persist) {
> +		atm_dev_put(dev);
> +		return 0;
> +	}
…

I propose to add a jump target for the desired exception handling
in this function implementation.

+	if (!dev_data->persist)
+		goto put_device;


Regards,
Markus
