From: Jarod Wilson <jarod@wilsonet.com>
Date: Thu, 02 Dec 2010 02:47:08 +0000
Subject: Re: [PATCH] media: rc: ir-lirc-codec: fix potential integer overflow
Message-Id: <7965B2E6-E741-4FDB-84C4-8F5FD3A130A6@wilsonet.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1290791197-21403-1-git-send-email-segoon@openwall.com>
In-Reply-To: <1290791197-21403-1-git-send-email-segoon@openwall.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segoon@openwall.com>
Cc: kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>, =?iso-8859-1?Q?David_H=E4rdeman?= <david@hardeman.nu>, Jarod Wilson <jarod@redhat.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

On Nov 26, 2010, at 12:06 PM, Vasiliy Kulikov wrote:

> 'n' may be bigger than MAX_INT*sizeof(int), if so checking of truncated
> (int)(n/sizeof(int)) for LIRCBUF_SIZE overflow and then using nontruncated 'count'
> doesn't make sense.  Also n may be up to sizeof(int)-1 bytes bigger than expected,
> so check value of (n % sizeof(int)) too.
> 
> Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
> ---
> Compile tested only.

Looks sane.

Acked-by: Jarod Wilson <jarod@redhat.com>

-- 
Jarod Wilson
jarod@wilsonet.com



