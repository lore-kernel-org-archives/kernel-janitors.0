From: Bjorn Helgaas <bhelgaas@google.com>
Date: Wed, 04 Apr 2018 13:44:43 +0000
Subject: Re: [bug report] lib: Add generic PIO mapping method
Message-Id: <CAErSpo5mK891nhsGgabLS5c4YjPD-sUhs7Y_fiYrTwBmMsVRZg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180404124152.GA3567@mwanda>
In-Reply-To: <20180404124152.GA3567@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Apr 4, 2018 at 7:42 AM Dan Carpenter <dan.carpenter@oracle.com>
wrote:

> Hello Zhichang Yuan,

> This is a semi-automatic email about new static checker warnings.

> The patch 07a1cb330513: "lib: Add generic PIO mapping method" from
> Mar 15, 2018, leads to the following Smatch complaint:

>      lib/logic_pio.c:42 logic_pio_register_range()
>      warn: variable dereferenced before check 'new_range' (see line 36)

Thanks, I folded in Gustavo A. R. Silva's fix for this.

> lib/logic_pio.c
>      35          struct logic_pio_hwaddr *range;
>      36          resource_size_t start = new_range->hw_start;
>                                          ^^^^^^^^^^^^^^^^^^^^
>      37          resource_size_t end = new_range->hw_start +
new_range->size;
>                                        ^^^^^^^^^^^^^^^^^^^
^^^^^^^^^^^^^^^
> Dereference.

>      38          resource_size_t mmio_sz = 0;
>      39          resource_size_t iio_sz = MMIO_UPPER_LIMIT;
>      40          int ret = 0;
>      41
>      42          if (!new_range || !new_range->fwnode || !new_range->size)
>                       ^^^^^^^^^
> Check for NULL.

>      43                  return -EINVAL;
>      44

> regards,
> dan carpenter
