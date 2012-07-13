From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 13 Jul 2012 05:10:49 +0000
Subject: [staging:staging-next 86/99] drivers/staging/iio/adc/ad7298_ring.c:97:37: warning: 'time_ns' may be
Message-Id: <20120713051049.GC15846@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Lars-Peter,

There are compile warnings in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-next
head:   bd972ff3176caf91a49d1d754848c3f6c5435328
commit: 3879089ba3421bc8136025837b1a532729643371 [86/99] staging:iio:max1363: Don't free uninitialized variable

All warnings:

drivers/staging/iio/adc/ad7298_ring.c:97:37: warning: 'time_ns' may be used uninitialized in this function [-Wmaybe-uninitialized]

vim +97 drivers/staging/iio/adc/ad7298_ring.c
    94							 indio_dev->masklength); i++)
    95			buf[i] = be16_to_cpu(st->rx_buf[i]);
    96	
  > 97		indio_dev->buffer->access->store_to(ring, (u8 *)buf, time_ns);
    98	
    99	done:
   100		iio_trigger_notify_done(indio_dev->trig);

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
