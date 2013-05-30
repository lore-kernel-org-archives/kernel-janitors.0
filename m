From: Pavel Machek <pavel@ucw.cz>
Date: Thu, 30 May 2013 09:40:21 +0000
Subject: Re: [Patch] Staging: winbond: Made local functions static
Message-Id: <20130530094021.GB11173@amd.pavel.ucw.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <51A6E81C.2000303@gmail.com>
In-Reply-To: <51A6E81C.2000303@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu 2013-05-30 11:18:12, Harsh Kumar wrote:
> Few functions are used only in one file. They are not included in any 
> other .h or .c files (I used grep to check). They seem to be local functions.
> So, I have made them static.
> I have also inlined one function as it is a one line function.
> 
> Signed-off-by: Harsh Kumar <harsh1kumar@gmail.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

Thanks for the changes!

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
