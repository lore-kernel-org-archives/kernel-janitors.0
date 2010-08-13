From: Dan Carpenter <error27@gmail.com>
Date: Fri, 13 Aug 2010 13:38:40 +0000
Subject: Re: [patch] Staging: lirc: remove unneeded variable
Message-Id: <20100813133840.GR645@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100810061120.GB18431@bicker>
In-Reply-To: <20100810061120.GB18431@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Wed, Aug 11, 2010 at 10:46:47PM -0400, Jarod Wilson wrote:
> On Tue, Aug 10, 2010 at 08:11:20AM +0200, Dan Carpenter wrote:
> > We never use control_req so I removed it.
> > 
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> Leftover cruft from when lirc_imon also supported the devices now covered
> by the ir-core imon driver.
> 

Speak of left over stuff, it's weird that I didn't notice this before
but gcc complains about an unitialized variable in
imon_incoming_packet().

drivers/staging/lirc/lirc_imon.c: In function ‘imon_incoming_packet’:
drivers/staging/lirc/lirc_imon.c:661: warning: ‘chunk_num’ may be used
	uninitialized in this function

I don't know how to fix that, but it looks important.

regards,
dan carpenter

> Acked-by: Jarod Wilson <jarod@redhat.com>
> 
> 
> -- 
> Jarod Wilson
> jarod@redhat.com
