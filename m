From: Jarod Wilson <jarod@redhat.com>
Date: Wed, 08 Dec 2010 16:15:56 +0000
Subject: Re: [PATCH v2] media: rc: ir-lirc-codec: fix integer overflow
Message-Id: <20101208161556.GB6586@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101202045126.GA1784@bicker>
 <20101204210522.GA5244@albatros>
In-Reply-To: <20101204210522.GA5244@albatros>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segoon@openwall.com>
Cc: Dan Carpenter <error27@gmail.com>, kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>, David =?iso-8859-1?Q?H=E4rdeman?= <david@hardeman.nu>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Dec 05, 2010 at 12:05:22AM +0300, Vasiliy Kulikov wrote:
> 'n' may be bigger than MAX_INT*sizeof(int), if so checking of truncated
> (int)(n/sizeof(int)) for LIRCBUF_SIZE overflows and then using nontruncated 'count'
> doesn't make sense.  This is not a security issue as too big 'n' is catched in
> kmalloc() in memdup_user() call.  However, it's better to prevent WARN() in kmalloc().
> 
> Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>

Now that I have my head out of my arse wrt the actual issue here, the
redundancy issue from v1 is resolved, and I've managed a full night's
sleep... ;)

Acked-by: Jarod Wilson <jarod@redhat.com>

-- 
Jarod Wilson
jarod@redhat.com

