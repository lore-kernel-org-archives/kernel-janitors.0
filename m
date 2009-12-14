From: Davidlohr Bueso <dave@gnu.org>
Date: Mon, 14 Dec 2009 19:01:26 +0000
Subject: Re: Coding style questions
Message-Id: <20091214190126.GA17084@fencepost.gnu.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4B19C331.3080805@picohost.net>
In-Reply-To: <4B19C331.3080805@picohost.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Dec 04, 2009 at 06:19:29PM -0800, Radu Voicilas wrote:
> 1. When you have a function prototype with a comment following it (which obviously it's a bad thing), like this one
> 
> u32 eprom_read(struct net_device *dev,u32 addr); //reads a 16 bits word
> 
> and want to fix it, how would one do it:
> 
> /* Read a 16 bits word. */
> u32 eprom_read(struct net_device *dev, u32 addr);
> 
> or the comment should go into the implementation file ?
It should go in the implementation file, but common sense is always best.
Be sure to read Documentation/CodingStyle.

   Davidlohr
