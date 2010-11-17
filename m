From: Jarod Wilson <jarod@redhat.com>
Date: Wed, 17 Nov 2010 20:21:30 +0000
Subject: Re: [patch 1/3] [media] lirc_dev: stray unlock in lirc_dev_fop_poll()
Message-Id: <20101117202130.GB24814@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101117051223.GD31724@bicker>
In-Reply-To: <20101117051223.GD31724@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, Zimny Lech <napohybelskurwysynom2010@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Nov 17, 2010 at 08:12:23AM +0300, Dan Carpenter wrote:
> We shouldn't unlock here.  I think this was a cut and paste error.

Yeah, looks like it.

Acked-by: Jarod Wilson <jarod@redhat.com>

-- 
Jarod Wilson
jarod@redhat.com

