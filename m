From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Tue, 09 Aug 2016 12:17:53 +0000
Subject: Re: [rtc-linux] Re: [PATCH] rtc: pcf2123: Add missing error code assignment before test
Message-Id: <20160809121753.GZ8132@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1470743907-11498-1-git-send-email-christophe.jaillet@wanadoo.fr>
 <alpine.DEB.2.10.1608091403050.2911@hadrien>
In-Reply-To: <alpine.DEB.2.10.1608091403050.2911@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, a.zummo@towertech.it, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 09/08/2016 at 14:03:35 +0200, Julia Lawall wrote :
> 
> 
> On Tue, 9 Aug 2016, Christophe JAILLET wrote:
> 
> > It is likely that checking the result of 'pcf2123_write_reg' is expected
> > here.
> > Also fix a small style issue. The '{' at the beginning of the function
> > is misplaced.
> 
> They shouldn't be in the same patch.  If you are wrong about the ret
> issue, the { should still be moved.
> 

That is true but as it is a really trivial patch, I didn't care that
much.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
