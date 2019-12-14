From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 14 Dec 2019 18:10:55 +0000
Subject: Re: [PATCH v2] mm/gup: Fix memory leak in __gup_benchmark_ioctl
Message-Id: <b167e207-f919-be9a-08cb-1d1a56e25e37@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191213223751.4089-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191213223751.4089-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, Ira Weiny <ira.weiny@intel.com>, John Hubbard <jhubbard@nvidia.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Keith Busch <keith.busch@intel.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Navid Emamdoost <emamd001@umn.edu>

…
> +++ b/mm/gup_benchmark.c
…
> @@ -85,8 +85,9 @@  static int __gup_benchmark_ioctl(unsigned int cmd,
>  	end_time = ktime_get();
>  	gup->put_delta_usec = ktime_us_delta(end_time, start_time);
>
> +done:
>  	kvfree(pages);
> -	return 0;
> +	return ret;
>  }
>
>  static long gup_benchmark_ioctl(struct file *filep, unsigned int cmd,

Can the addition of a label like “free_pages” be more appropriate here?

Regards,
Markus
