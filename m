From: Pavel Machek <pavel@ucw.cz>
Date: Fri, 28 Sep 2012 21:14:54 +0000
Subject: Re: [Patch 5/5] Staging: winbond: usb_free_urb(NULL) is safe
Message-Id: <20120928211453.GA30718@elf.ucw.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <50634417.6000109@gmail.com>
In-Reply-To: <50634417.6000109@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed 2012-09-26 23:36:15, Harsh Kumar wrote:
> usb_free_urb(NULL) is safe. So, the check was removed.
> 
> Signed-off-by: Harsh Kumar <harsh1kumar@gmail.com>

ACK.

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
