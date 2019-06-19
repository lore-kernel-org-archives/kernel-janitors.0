From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 Jun 2019 05:30:12 +0000
Subject: Re: [PATCH][next] platform/chrome: wilco_ec: fix null pointer dereference on failed kzalloc
Message-Id: <20190619053012.GM28859@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190618153924.19491-1-colin.king@canonical.com>
In-Reply-To: <20190618153924.19491-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Benson Leung <bleung@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Nick Crews <ncrews@chromium.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jun 18, 2019 at 04:39:24PM +0100, Colin King wrote:
> diff --git a/drivers/platform/chrome/wilco_ec/event.c b/drivers/platform/chrome/wilco_ec/event.c
> index c975b76e6255..e251a989b152 100644
> --- a/drivers/platform/chrome/wilco_ec/event.c
> +++ b/drivers/platform/chrome/wilco_ec/event.c
> @@ -112,8 +112,11 @@ module_param(queue_size, int, 0644);
>  static struct ec_event_queue *event_queue_new(int capacity)
>  {
>  	size_t entries_size = sizeof(struct ec_event *) * capacity;
> -	struct ec_event_queue *q = kzalloc(sizeof(*q) + entries_size,
> -					   GFP_KERNEL);
> +	struct ec_event_queue *q;
> +
> +	q = kzalloc(sizeof(*q) + entries_size, GFP_KERNEL);
> +	if (!q)
> +		return NULL;

We have a new struct_size() macro designed for these allocations.

	q = kzalloc(struct_size(q, entries, capacity), GFP_KERNEL);

The advantage is that it checks for integer overflows.

regards,
dan carpenter
