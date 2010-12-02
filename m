From: Dan Carpenter <error27@gmail.com>
Date: Thu, 02 Dec 2010 04:51:26 +0000
Subject: Re: [PATCH] media: rc: ir-lirc-codec: fix potential integer
Message-Id: <20101202045126.GA1784@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1290791197-21403-1-git-send-email-segoon@openwall.com>
In-Reply-To: <1290791197-21403-1-git-send-email-segoon@openwall.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segoon@openwall.com>
Cc: kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>, David =?iso-8859-1?Q?H=E4rdeman?= <david@hardeman.nu>, Jarod Wilson <jarod@redhat.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Nov 26, 2010 at 08:06:35PM +0300, Vasiliy Kulikov wrote:
>  	count = n / sizeof(int);
> -	if (count > LIRCBUF_SIZE || count % 2 = 0)
> +	if (count > LIRCBUF_SIZE || count % 2 = 0 || n % sizeof(int) != 0)
                                                      ^^^^^^^^^^^^^^^^^^^^

Wait, what?  We just checked this a couple lines before.

The rest of the patch is right and a clever catch.  It would affect 
x86_64 systems and not i386.  This doesn't have security implications
does it?  You'd just catch the kmalloc() stack trace for insanely large
allocations.

regards,
dan carpenter

