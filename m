From: Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>
Date: Tue, 03 Sep 2013 10:47:36 +0000
Subject: Re: [patch] caif: add a sanity check to the tty name
Message-Id: <5225BE48.2080302@lockless.no>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130903090232.GA4351@elgon.mountain>
In-Reply-To: <20130903090232.GA4351@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

Agree, thank you!

With best regards,
Dmitry

Den 03. sep. 2013 11:02, skrev Dan Carpenter:
> -	sprintf(name, "cf%s", tty->name);
> +	result = snprintf(name, sizeof(name), "cf%s", tty->name);
> +	if (result >= IFNAMSIZ)
> +		return -EINVAL;

