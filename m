From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 06 Aug 2019 12:45:30 +0000
Subject: Re: [PATCH] dm raid1: Use struct_size() in kzalloc()
Message-Id: <a6b3127e-11cb-4dc8-7db8-e526521d11d9@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190806001825.GA6854@embeddedor>
In-Reply-To: <20190806001825.GA6854@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Colin Ian King <colin.king@canonical.com>

> +++ b/drivers/md/dm-raid1.c
> @@ -878,12 +878,9 @@ static struct mirror_set *alloc_context(unsigned int nr_mirrors,
>  					struct dm_target *ti,
>  					struct dm_dirty_log *dl)
>  {
> -	size_t len;
>  	struct mirror_set *ms = NULL;
…

How do you think about to replace the initialisation “NULL” by the desired function call?

Regards,
Markus
