From: Alasdair G Kergon <agk@redhat.com>
Date: Wed, 02 Jul 2008 19:03:06 +0000
Subject: Re: [dm-devel] [PATCH 2/6] drivers/md: remove null pointer dereference
Message-Id: <20080702190306.GG22522@agk.fab.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0805121537100.3694@ask.diku.dk>
	<20080702105434.GF22522@agk.fab.redhat.com>
	<Pine.LNX.4.64.0807021351270.4854@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0807021351270.4854@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: device-mapper development <dm-devel@redhat.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jul 02, 2008 at 01:51:41PM +0200, Julia Lawall wrote:
> In looking at it a little bit, it seems that ps.type is initialized in the
> function stored in the ctr field of the target_type structure and this
> function is called in the function stored in the message field of the same
> structure.  The function in the message structure seems to be only called
> from the function target_message in dm-ioctl.c, but I don't see the
> relation to an invocation of the ctr field.  Is that guaranteed to be
> invoked earlier?
 
ctr is short for constructor (perhaps we should rename these functions one day)
and it has to run first to set up the data structures which a subsequent
target_message may reference.

Alasdair
-- 
agk@redhat.com
