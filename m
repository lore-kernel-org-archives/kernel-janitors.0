From: "Namjae Jeon" <namjae.jeon@samsung.com>
Date: Thu, 11 Jun 2020 03:41:05 +0000
Subject: RE: [PATCH v2] exfat: add missing brelse() calls on error paths
Message-Id: <00a801d63fa2$230d14c0$69273e40$@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20200610172239epcas1p1facf5f0026208683a593eeb7271c8cce@epcas1p1.samsung.com>
        <20200610172213.GA90634@mwanda>
In-Reply-To: <20200610172213.GA90634@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Dan Carpenter' <dan.carpenter@oracle.com>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 'Sungjong Seo' <sj1557.seo@samsung.com>, =?iso-8859-1?Q?'Pali_Roh=E1r'?= <pali@kernel.org>, 'Markus Elfring' <Markus.Elfring@web.de>, 'Tetsuhiro Kohada' <kohada.t2@gmail.com>, 'Wei Yongjun' <weiyongjun1@huawei.com>

> If the second exfat_get_dentry() call fails then we need to release "old_bh" before returning.  There
> is a similar bug in exfat_move_file().
> 
> Fixes: 5f2aa075070c ("exfat: add inode operations")
> Reported-by: Markus Elfring <Markus.Elfring@web.de>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Applied. Thanks!
