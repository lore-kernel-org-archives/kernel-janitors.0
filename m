From: Jarod Wilson <jwilson@redhat.com>
Date: Thu, 12 Aug 2010 19:36:59 +0000
Subject: Re: [patch] IR: ir-raw-event: null pointer dereference
Message-Id: <598856820.2275731281641819461.JavaMail.root@zmail04.collab.prod.int.phx2.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20100812074707.GJ645@bicker>
References: <20100812074707.GJ645@bicker>
In-Reply-To: <20100812074707.GJ645@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, =?utf-8?Q?David_H=C3=A4rdeman?= <david@hardeman.nu>, Maxim Levitsky <maximlevitsky@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

----- Dan Carpenter <error27@gmail.com> wrote:
> The original code dereferenced ir->raw after freeing it and setting it
> to NULL.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>


Acked-by: Jarod Wilson <jarod@redhat.com>


-- 
Jarod Wilson
jarod@redhat.com
