From: Mao Wenan <maowenan@huawei.com>
Date: Tue, 28 May 2019 07:54:23 +0000
Subject: [PATCH -next v3 0/2] cleanup for kpc2000_spi.c
Message-Id: <20190528080214.18382-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190525081321.121294-1-maowenan@huawei.com>
In-Reply-To: <20190525081321.121294-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, jeremy@azazel.net
Cc: thesven73@gmail.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, matt.sickler@daktronics.com, Mao Wenan <maowenan@huawei.com>

The error status should resotre to m->status in kp_spi_transfer_one_message(),
and many white spaces in kpc2000_spi.c. patch 1 is to fix the error path, and
patch 2 is to cleanup kpc2000_spi.c.

v1: remove set but not used variable 'status'.

v2: fix the subject tile.

v3: add another patch to fix the error condition path and do some clean work for kpc2000_spi.c.

Mao Wenan (2):
  staging: kpc2000: report error status to spi core
  staging: kpc2000: replace white spaces with tabs for kpc2000_spi.c

 drivers/staging/kpc2000/kpc2000_spi.c | 718 +++++++++++++-------------
 1 file changed, 361 insertions(+), 357 deletions(-)

-- 
2.20.1
