From: Alan Cox <alan@linux.intel.com>
Date: Fri, 06 Aug 2010 11:20:58 +0000
Subject: Re: [patch] input: cy8ctmg100_ts: signedness bug
Message-Id: <20100806122058.67945233@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100806063006.GM9031@bicker>
In-Reply-To: <20100806063006.GM9031@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 6 Aug 2010 08:30:06 +0200
Dan Carpenter <error27@gmail.com> wrote:

> "ret" should be signed here or the error handling doesn't work.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Alan Cox <alan@linux.intel.com>

Well spotted
