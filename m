From: Alan Cox <alan@linux.intel.com>
Date: Mon, 07 Jun 2010 08:59:51 +0000
Subject: Re: [patch] Staging: mrst-touchscreen: dereferencing free memory
Message-Id: <20100607095951.00c6c496@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100605171642.GM5483@bicker>
In-Reply-To: <20100605171642.GM5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 5 Jun 2010 19:16:42 +0200
Dan Carpenter <error27@gmail.com> wrote:

> I moved the kfree() down a couple lines after the dereference.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>


Acked-by: Alan Cox <alan@linux.intel.com>

Thanks
