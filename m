From: Alasdair G Kergon <agk@redhat.com>
Date: Thu, 10 Jan 2008 00:00:43 +0000
Subject: Re: [JANITOR PROPOSAL] Switch ioctl functions to ->unlocked_ioctl
Message-Id: <20080110000043.GI3510@agk.fab.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080108164015.GC31504@one.firstfloor.org> <478551A6.9050803@nortel.com> <20080109230545.GG3510@agk.fab.redhat.com> <200801091531.00483.vlobanov@speakeasy.net>
In-Reply-To: <200801091531.00483.vlobanov@speakeasy.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vadim Lobanov <vlobanov@speakeasy.net>
Cc: Chris Friesen <cfriesen@nortel.com>, Andi Kleen <andi@firstfloor.org>, Matt Mackall <mpm@selenic.com>, Paolo Ciarrocchi <paolo.ciarrocchi@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, gorcunov@gmail.com

On Wed, Jan 09, 2008 at 03:31:00PM -0800, Vadim Lobanov wrote:
> From 2.6.23's fs/ioctl.c - do_ioctl():
 
Ah - you're talking about struct file_operations of course;
I was talking about struct block_device_operations.

Alasdair
-- 
agk@redhat.com
