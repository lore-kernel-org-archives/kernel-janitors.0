From: Christoph Hellwig <hch@infradead.org>
Date: Wed, 09 Jan 2008 12:20:28 +0000
Subject: Re: [PATCH] Change paride driver to use unlocked_ioctl instead of
Message-Id: <20080109122027.GA13254@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4785B7BC.5040106@suse.de> <20080109080620.GE32560@infradead.org> <1199955347.6203.6.camel@nikanth-laptop.blr.novell.com> <Pine.LNX.4.64.0801091313231.29244@fbirervta.pbzchgretzou.qr>
In-Reply-To: <Pine.LNX.4.64.0801091313231.29244@fbirervta.pbzchgretzou.qr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: Nikanth Karthikesan <knikanth@suse.de>, grant@torque.net, tim@cyberelk.net, Christoph Hellwig <hch@infradead.org>, Valdis.Kletnieks@vt.edu, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jan 09, 2008 at 01:14:25PM +0100, Jan Engelhardt wrote:
> I wonder why a simple copy_from_user() requires the BKL.. if pt
> does need locking, then probably some mutex inside pt.

Given this is a janitorial project where the people don't even have
the hardware to test it's best to do a 1:1 conversion instead of making
it more complex.

