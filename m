From: Szymon Janc <szymon@janc.net.pl>
Date: Fri, 10 Feb 2012 18:58:23 +0000
Subject: Re: [PATCH v2 02/17] Staging: quickstart: Prefix remaining functions names with quickstart_
Message-Id: <201202101958.23311.szymon@janc.net.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326320574-11220-3-git-send-email-szymon@janc.net.pl>
In-Reply-To: <1326320574-11220-3-git-send-email-szymon@janc.net.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

> > I'll take this, but you do know there is no reason for this, as these
> > are static functions.  I'd recommend keeping them as short as possible,
> > but hey, it's not my code...
> > 
> > thanks,
> > 
> > greg k-h
> 
> I agree with Greg on this one. At the time I didn't prefix these
> functions with the module name because I wanted to make them clear they
> were different. The difference lies in the fact that those functions
> are only used to implement the sysfs interface.

Yeah, maybe you are right. I thought it was just an oversight. I can send a 
patch that will get orig names back if you prefer.


-- 
Szymon K. Janc
szymon@janc.net.pl

