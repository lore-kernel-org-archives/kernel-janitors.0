From: Nikolaus Schulz <schulz@macnetix.de>
Date: Mon, 07 Jan 2013 12:04:20 +0000
Subject: Re: [patch] [media] dvb: unlock on error in dvb_ca_en50221_io_do_ioctl()
Message-Id: <20130107120420.GA7875@pcewns01.macnetix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <50e3bfe0.IJT/Tw4ZVUbERlpE%fengguang.wu@intel.com>
 <20130104185602.GB2038@elgon.mountain>
In-Reply-To: <20130104185602.GB2038@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, Michael Krufky <mkrufky@linuxtv.org>, linux-media@vger.kernel.org, kbuild@01.org, kernel-janitors@vger.kernel.org

On Fri, Jan 04, 2013 at 09:56:02PM +0300, Dan Carpenter wrote:
> We recently pushed the locking down into this function, but there was
> an error path where the unlock was missed.

Ugh, indeed. Thanks for catching this!

Nikolaus.
