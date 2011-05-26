From: Jarod Wilson <jarod@redhat.com>
Date: Thu, 26 May 2011 14:51:34 +0000
Subject: Re: [patch] [media] rc/redrat3: dereferencing null pointer
Message-Id: <4DDE68F6.8080901@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110526085508.GG14591@shale.localdomain>
In-Reply-To: <20110526085508.GG14591@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, "open list:MEDIA INPUT INFRA..." <linux-media@vger.kernel.org>, kernel-janitors@vger.kernel.org

Dan Carpenter wrote:
> In the original code, if the allocation failed we dereference "rr3"
> when it was NULL.

D'oh, yeah, thanks for the fix.

Acked-by: Jarod Wilson <jarod@redhat.com>

-- 
Jarod Wilson
jarod@redhat.com


