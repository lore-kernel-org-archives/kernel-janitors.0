From: Vadim Lobanov <vlobanov@speakeasy.net>
Date: Thu, 10 Jan 2008 04:59:46 +0000
Subject: Re: [JANITOR PROPOSAL] Switch ioctl functions to ->unlocked_ioctl
Message-Id: <200801092059.46884.vlobanov@speakeasy.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080108164015.GC31504@one.firstfloor.org> <200801091531.00483.vlobanov@speakeasy.net> <20080110000043.GI3510@agk.fab.redhat.com>
In-Reply-To: <20080110000043.GI3510@agk.fab.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alasdair G Kergon <agk@redhat.com>
Cc: Chris Friesen <cfriesen@nortel.com>, Andi Kleen <andi@firstfloor.org>, Matt Mackall <mpm@selenic.com>, Paolo Ciarrocchi <paolo.ciarrocchi@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, gorcunov@gmail.com

On Wednesday 09 January 2008 04:00:43 pm Alasdair G Kergon wrote:
> On Wed, Jan 09, 2008 at 03:31:00PM -0800, Vadim Lobanov wrote:
> > From 2.6.23's fs/ioctl.c - do_ioctl():
>
> Ah - you're talking about struct file_operations of course;
> I was talking about struct block_device_operations.
>
> Alasdair

Good point. :-)

-- Vadim Lobanov
