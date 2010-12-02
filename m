From: Jarod Wilson <jarod@wilsonet.com>
Date: Thu, 02 Dec 2010 02:45:39 +0000
Subject: Re: [PATCH] media: rc: lirc_dev: check kobject_set_name() result
Message-Id: <3F92DE6F-9421-4AE3-B5DB-C69567A95D09@wilsonet.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1290791203-21448-1-git-send-email-segoon@openwall.com>
In-Reply-To: <1290791203-21448-1-git-send-email-segoon@openwall.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segoon@openwall.com>
Cc: kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

On Nov 26, 2010, at 12:06 PM, Vasiliy Kulikov wrote:

> kobject_set_name() may fail with -ENOMEM, check for it.
> 
> Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
> ---
> Compile tested only.

Works for me.

Acked-by: Jarod Wilson <jarod@redhat.com>

-- 
Jarod Wilson
jarod@wilsonet.com



