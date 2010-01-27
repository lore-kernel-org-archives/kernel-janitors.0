From: Bernd Petrovitsch <bernd@petrovitsch.priv.at>
Date: Wed, 27 Jan 2010 11:09:46 +0000
Subject: Re: bug list: assigning negative values to unsigned variables
Message-Id: <1264590586.9749.2.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100127104011.GA24796@bicker>
	 <Pine.LNX.4.64.1001271155430.20256@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1001271155430.20256@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Dan Carpenter <error27@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mit, 2010-01-27 at 11:57 +0100, Julia Lawall wrote:
> On Wed, 27 Jan 2010, Dan Carpenter wrote:
> 
> > Fixing the places which assign negative values to unsigned variables is a good janitor task.
> 
> I had the impression that assignment to -1 was done sometimes as a 
> portable way to initialize the variable to 0xffff (for any number of f's).  
> So perhaps it is not so trivial to fix.
Any particular reason that ~0U, ~0UL, and ~0ULL shouldn't do the same
(without relying on conversion from signed to unsigned)?

	Bernd
-- 
Bernd Petrovitsch                  Email : bernd@petrovitsch.priv.at
                     LUGA : http://www.luga.at

