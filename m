From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Date: Thu, 22 Apr 2010 11:58:55 +0000
Subject: Re: [patch] logfs: testing the wrong variable
Message-Id: <20100422115855.GF27309@logfs.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100421103354.GF29647@bicker>
In-Reply-To: <20100421103354.GF29647@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Thu, 22 April 2010 11:22:42 +0200, Dan Carpenter wrote:
> On Wed, Apr 21, 2010 at 03:15:22PM +0200, Jörn Engel wrote:
> 
> > Did you use a tool to find this?  And if yes, where would I find it? ;)
> > 
> 
> This is smatch stuff (http://smatch.sf.net).
> 
> The problem is that it's a private modification where I made it print 
> errors if we pass an ERR_PTR to a function.  After I send out 10 patches 
> today that modification will only print false positives... Normally the 
> false positives are cases where the function accepts ERR_PTRs as a 
> paramater.  I need to kill most of the false positives before I can push 
> the change.
> 
> The good thing about Smatch is that it's easy to compile, but the bad
> thing is that it's false positive heavy.

:)

I'll need to take a closer look sometime.  Years back I wrote a
callgraph generator based on smatch.  Goal was to calculate the max
stack consumption across the complete kernel, but it can be used for
other purposes as well.  I remember having to patch gcc 3.1 as part of
the exercise, so obviously the code has bitrotted since and needs some
care.

Jörn

-- 
Never argue with idiots - first they drag you down to their level,
then they beat you with experience.
-- unknown
