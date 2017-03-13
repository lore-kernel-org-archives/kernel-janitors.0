From: Alan Cox <alan@linux.intel.com>
Date: Mon, 13 Mar 2017 17:52:36 +0000
Subject: Re: [PATCH] staging: atomisp: potential underflow in atomisp_get_metadata_by_type()
Message-Id: <1489427556.24765.8.camel@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170313123414.GB9287@mwanda>
In-Reply-To: <20170313123414.GB9287@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org

On Mon, 2017-03-13 at 15:34 +0300, Dan Carpenter wrote:
> md_type is an enum.  On my tests, GCC treats it as unsigned but
> according to the C standard it's an implementation dependant thing so
> we
> should check for negatives.

Can do but the kernel assumes GNU C everywhere else.

Acked-by: Alan Cox <alan@linux.intel.com>

Alan

