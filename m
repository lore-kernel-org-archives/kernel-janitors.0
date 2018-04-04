From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Apr 2018 12:41:52 +0000
Subject: [bug report] lib: Add generic PIO mapping method
Message-Id: <20180404124152.GA3567@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Zhichang Yuan,

This is a semi-automatic email about new static checker warnings.

The patch 07a1cb330513: "lib: Add generic PIO mapping method" from
Mar 15, 2018, leads to the following Smatch complaint:

    lib/logic_pio.c:42 logic_pio_register_range()
    warn: variable dereferenced before check 'new_range' (see line 36)

lib/logic_pio.c
    35		struct logic_pio_hwaddr *range;
    36		resource_size_t start = new_range->hw_start;
                                        ^^^^^^^^^^^^^^^^^^^^
    37		resource_size_t end = new_range->hw_start + new_range->size;
                                      ^^^^^^^^^^^^^^^^^^^   ^^^^^^^^^^^^^^^
Dereference.

    38		resource_size_t mmio_sz = 0;
    39		resource_size_t iio_sz = MMIO_UPPER_LIMIT;
    40		int ret = 0;
    41	
    42		if (!new_range || !new_range->fwnode || !new_range->size)
                     ^^^^^^^^^
Check for NULL.

    43			return -EINVAL;
    44	

regards,
dan carpenter
