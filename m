From: Jarod Wilson <jarod@redhat.com>
Date: Thu, 12 Aug 2010 02:46:47 +0000
Subject: Re: [patch] Staging: lirc: remove unneeded variable
Message-Id: <20100812024647.GC4852@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100810061120.GB18431@bicker>
In-Reply-To: <20100810061120.GB18431@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Aug 10, 2010 at 08:11:20AM +0200, Dan Carpenter wrote:
> We never use control_req so I removed it.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Leftover cruft from when lirc_imon also supported the devices now covered
by the ir-core imon driver.

Acked-by: Jarod Wilson <jarod@redhat.com>


-- 
Jarod Wilson
jarod@redhat.com

