From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 27 Jun 2019 07:18:08 +0000
Subject: Re: [bug report] lib/vdso: Provide generic VDSO implementation
Message-Id: <20190627071743.GC5715@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190627071521.GA22903@mwanda>
In-Reply-To: <20190627071521.GA22903@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

See also __cvdso_clock_getres_time32().

lib/vdso/gettimeofday.c:226 __cvdso_clock_getres_time32() error: we previously assumed 'res' could be null (see line 213)

regards,
dan carpenter
