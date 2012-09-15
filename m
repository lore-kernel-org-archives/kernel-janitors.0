From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 15 Sep 2012 14:35:47 +0000
Subject: [iio:wip] drivers/staging/iio/iio_input.c:189 iio_input_probe() error: don't call input_free_device(
Message-Id: <20120915143547.GB7303@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Jonathan,

There is a smatch warning in tree

git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git wip

+ drivers/staging/iio/iio_input.c:189 iio_input_probe() error: don't call input_free_device() after input_unregister_device()

vim +189 drivers/staging/iio/iio_input.c

   186	error_unregister_input:
   187		input_unregister_device(st->idev);
   188	error_free_idev:
 > 189		input_free_device(st->idev);
   190	error_channels_release_all:
   191		iio_channel_release_all_cb(st->buff);
   192	error_free_state:
   193		kfree(st);
   194		return ret;
   195	}

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
