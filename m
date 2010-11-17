From: Jarod Wilson <jarod@redhat.com>
Date: Wed, 17 Nov 2010 20:22:00 +0000
Subject: Re: [patch 2/3] [media] lirc_dev: add some __user annotations
Message-Id: <20101117202200.GC24814@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101117051339.GE31724@bicker>
In-Reply-To: <20101117051339.GE31724@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, Zimny Lech <napohybelskurwysynom2010@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Nov 17, 2010 at 08:13:39AM +0300, Dan Carpenter wrote:
> Sparse complains because there are no __user annotations.
> 
> drivers/media/IR/lirc_dev.c:156:27: warning:
> 	incorrect type in initializer (incompatible argument 2 (different address spaces))
> drivers/media/IR/lirc_dev.c:156:27:    expected int ( *read )( ... )
> drivers/media/IR/lirc_dev.c:156:27:    got int ( extern [toplevel] *<noident> )( ... )
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Jarod Wilson <jarod@redhat.com>

-- 
Jarod Wilson
jarod@redhat.com

