From: Jarod Wilson <jarod@redhat.com>
Date: Fri, 23 Jul 2010 13:16:04 +0000
Subject: Re: [patch -next] V4L: media/IR: testing the wrong variable
Message-Id: <20100723131604.GA20916@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100723100826.GB26313@bicker>
In-Reply-To: <20100723100826.GB26313@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jul 23, 2010 at 12:08:26PM +0200, Dan Carpenter wrote:
> There is a typo here.  We meant to test "rbuf" instead of "drv".  We
> already tested "drv" earlier.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Gah. I swear that got fixed once already... Thanks!

Acked-by: Jarod Wilson <jarod@redhat.com>


-- 
Jarod Wilson
jarod@redhat.com

