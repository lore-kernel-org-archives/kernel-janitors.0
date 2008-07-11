From: Pavel Machek <pavel@suse.cz>
Date: Fri, 11 Jul 2008 19:50:02 +0000
Subject: Re: [PATCH] vicam: use request_firmware()
Message-Id: <20080711195002.GA7190@elf.ucw.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1214583311.29137.4.camel@jaswinder.satnam>
In-Reply-To: <1214583311.29137.4.camel@jaswinder.satnam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaswinder Singh <jaswinder@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>, kernelnewbies <kernelnewbies@nl.linux.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, "Joe Burks (jburks"@wavicle.org, "Christopher L Cheney (ccheney"@cheney.cx, "Pavel Machek (pavel"@suse.cz, "John Tyner (jtyner"@cs.ucr.edu, "Monroe Williams (monroe"@pobox.com

On Fri 2008-06-27 21:45:11, Jaswinder Singh wrote:
> ???We use the Intel HEX record format for this firmware, because it's split
> into separate chunks and that's the simplest way to handle them in a
> single firmware file -- the alternative would be loading each part as
> a separate file.
> 
> Signed-off-by: Jaswinder Singh <jaswinder@infradead.org>
> Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

Actually, this is going to make suspend/resume support for vicam hard
:-(. 

								Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
