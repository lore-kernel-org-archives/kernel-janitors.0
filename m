From: Julia Lawall <julia@diku.dk>
Date: Sun, 09 Aug 2009 12:28:18 +0000
Subject: Re: [PATCH 1/3] drivers/isdn/hisax: Correct use of
Message-Id: <Pine.LNX.4.64.0908091427590.16252@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0908090942560.13271@ask.diku.dk>
 <Pine.LNX.4.64.0908091150310.13271@ask.diku.dk> <200908091420.33935.isdn@linux-pingi.de>
In-Reply-To: <200908091420.33935.isdn@linux-pingi.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karsten Keil <isdn@linux-pingi.de>
Cc: isdn4linux@listserv.isdn4linux.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 9 Aug 2009, Karsten Keil wrote:

> On Sonntag, 9. August 2009 11:51:14 you wrote:
> > Or perhaps it is the request_region that is incorrect, since the same
> > value is later used with ioremap?
> 
> Yes this is the real error, these cards have one IO port (hw.isurf.reset) and 
> one memory mapped IO area (
> hw.isurf.phymem).

OK, I will send a corrected patch shortly.

julia
