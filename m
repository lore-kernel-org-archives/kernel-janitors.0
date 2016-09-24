From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 24 Sep 2016 06:22:43 +0000
Subject: [PATCH 0/7] iio: Fine-tuning for several function implementations
Message-Id: <c11fbb47-1fd3-4e9e-042e-0f271cfef814@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-iio@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 24 Sep 2016 08:10:08 +0200

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (7):
  Use kmalloc_array() in iio_scan_mask_set()
  Rename a jump label in iio_buffer_store_watermark()
  Rename a jump label in iio_buffer_store_enable()
  Rename a jump label in iio_buffer_write_length()
  Rename a jump label in iio_scan_el_ts_store()
  Rename a jump label in iio_scan_el_store()
  Adjust checks for null pointers in six functions

 drivers/iio/industrialio-buffer.c | 55 ++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 29 deletions(-)

-- 
2.10.0

