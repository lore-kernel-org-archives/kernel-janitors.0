From: wfg@linux.intel.com
Date: Tue, 10 Jul 2012 00:40:49 +0000
Subject: [staging:staging-next 84/99] drivers/staging/iio/adc/max1363_ring.c:87:7: warning: 'rxbuf' may be us
Message-Id: <20120710004049.GA7404@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Lars-Peter,

There are new compile warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-next
head:   f12db36d3fd7ab75c29015c32a12d49697e11f61
commit: da0f01e1ed88b4ac650d884e4e2ee11c9cd4d83b [84/99] staging:iio:max1363: Do not return error code in interrupt handler

All warnings:

drivers/staging/iio/adc/max1363_ring.c: In function 'max1363_trigger_handler':
drivers/staging/iio/adc/max1363_ring.c:87:7: warning: 'rxbuf' may be used uninitialized in this function [-Wmaybe-uninitialized]

vim +87 drivers/staging/iio/adc/max1363_ring.c
    84	
    85	done:
    86		iio_trigger_notify_done(indio_dev->trig);
  > 87		kfree(rxbuf);
    88	
    89		return IRQ_HANDLED;
    90	}

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
