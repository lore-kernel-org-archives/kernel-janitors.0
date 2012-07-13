From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 13 Jul 2012 06:14:35 +0000
Subject: [staging:staging-next 98/99] drivers/iio/light/adjd_s311.c:188:12: warning: cast from pointer to int
Message-Id: <20120713061435.GB16932@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Peter,

There are new compile warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-next
head:   bd972ff3176caf91a49d1d754848c3f6c5435328
commit: bbdb822c4c3f8dbefd8f6dc84f6d98c33af6e051 [98/99] iio: add adjd_s311 I2C digital color sensor driver

All warnings:

drivers/iio/light/adjd_s311.c: In function 'adjd_s311_trigger_handler':
drivers/iio/light/adjd_s311.c:188:12: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/iio/light/adjd_s311.c:188:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]

vim +188 drivers/iio/light/adjd_s311.c
   185		}
   186	
   187		if (indio_dev->scan_timestamp)
 > 188			*(s64 *)((phys_addr_t)data->buffer + ALIGN(len, sizeof(s64)))
   189				= time_ns;
   190		iio_push_to_buffer(buffer, (u8 *)data->buffer, time_ns);
   191	

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
