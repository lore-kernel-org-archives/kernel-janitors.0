From: Pavel Machek <pavel@ucw.cz>
Date: Tue, 30 Nov 2010 19:15:30 +0000
Subject: Re: [PATCH 3/3 v2] hibernation: constify platform_hibernation_ops
Message-Id: <20101130191530.GA4156@ucw.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <285897.77932.qm@smtp128.mail.ukl.yahoo.com>
In-Reply-To: <285897.77932.qm@smtp128.mail.ukl.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lionel Debroux <lionel_debroux@yahoo.fr>
Cc: kernel-janitors@vger.kernel.org, Kees Cook <kees.cook@canonical.com>, Emese Revfy <re.emese@gmail.com>, linux-kernel@vger.kernel.org

On Tue 2010-11-09 21:48:49, Lionel Debroux wrote:
> Patch against mainline.
> 
> Changes since v1: added one hunk; no longer adding "const" qualifier to
> pointers in platform_hibernation_ops after seeing
> b4144e4f6e3b448d322095ca08af393682a69e33.
> ---
> 
> Subject: [PATCH 3/3] hibernation: constify platform_hibernation_ops
> 
> Derived from the grsecurity patch.
> 
> Signed-off-by: Lionel Debroux <lionel_debroux@yahoo.fr>

ack.

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
