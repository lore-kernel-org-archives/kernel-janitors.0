From: Jarod Wilson <jarod@redhat.com>
Date: Thu, 26 May 2011 14:49:16 +0000
Subject: Re: [patch] [media] rc: double unlock in rc_register_device()
Message-Id: <4DDE686C.6000900@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110526085201.GF14591@shale.localdomain>
In-Reply-To: <20110526085201.GF14591@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, =?ISO-8859-1?Q?David_?= =?ISO-8859-1?Q?H=E4rdeman?= <david@hardeman.nu>, Dmitry Torokhov <dtor@mail.ru>, "open list:MEDIA INPUT INFRA..." <linux-media@vger.kernel.org>, kernel-janitors@vger.kernel.org

Dan Carpenter wrote:
> If change_protocol() fails and we goto out_raw, then it calls unlock
> twice.

Gah, good catch, I gotta quit adding new bugs... ;)


> I noticed that the other time we called change_protocol() we
> held the &dev->lock, so I changed it to hold it here too.
>
> Signed-off-by: Dan Carpenter<error27@gmail.com>
> ---
> Compile tested only.


I've sanity-checked the code, and yeah, calling change_protocol() 
function pointers with the lock held should be perfectly fine here too. 
The change_protocol functions are device-driver-specific, and don't 
touch the core rc device lock.

Reviewed-by: Jarod Wilson <jarod@redhat.com>
Acked-by: Jarod Wilson <jarod@redhat.com>

-- 
Jarod Wilson
jarod@redhat.com


