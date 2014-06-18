From: Valentina Manea <valentina.manea.m@gmail.com>
Date: Wed, 18 Jun 2014 18:33:18 +0000
Subject: Re: [PATCH] Staging: rtl8192e prohibit deferencing of NULL pointer
Message-Id: <CABdoFFe7Zb0tD6C+VqmAB3nDG7nRWCrE5dgQACeBD+kvVXTkTw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <53A1D769.7090301@ict.tuwien.ac.at>
In-Reply-To: <53A1D769.7090301@ict.tuwien.ac.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jun 18, 2014 at 11:16 AM, Andreas Platschek
<platschek@ict.tuwien.ac.at> wrote:
>
>   rx_dropped:
> -    ieee->stats.rx_dropped++;
> +    if (ieee != NULL) {
> +        ieee->stats.rx_dropped++;
> +    }
>      return 0;

Style nit: don't use braces around a single statement.

Tina
