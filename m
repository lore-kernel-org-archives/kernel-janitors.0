From: wfg@linux.intel.com
Date: Sat, 07 Jul 2012 13:26:27 +0000
Subject: [staging:staging-next 54/100] WARNING: drivers/iio/dac/ad5064.o(.init.text+0x72): Section mismatch i
Message-Id: <20120707132627.GA23706@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Lars-Peter,

There are new compile warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-next
head:   0932966b1ca03217c6e0c18375867b1a99ee5af0
commit: 6a17a0768f77626046aa441843b318a00bac3800 [54/100] iio:dac:ad5064: Add support for the ad5629r and ad5669r

All warnings:

WARNING: drivers/iio/dac/ad5064.o(.init.text+0x72): Section mismatch in reference from the function init_module() to the function .exit.text:ad5064_spi_unregister_driver()
The function __init init_module() references
a function __exit ad5064_spi_unregister_driver().
This is often seen when error handling in the init function
uses functionality in the exit path.
The fix is often to remove the __exit annotation of

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
