From: Julia Lawall <julia@diku.dk>
Date: Fri, 18 Sep 2009 21:39:34 +0000
Subject: exported symbols
Message-Id: <Pine.LNX.4.64.0909182336590.4238@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Functions that are exported using EXPORT_SYMBOL, and thus are presumably 
freely available for use in dynamically loaded modules, do not seem to 
very often check the validity of their inputs.  For a simple example, 
the following code from arch/arm/mach-realview/clock.c does not even check 
that clk is not NULL:

 unsigned long clk_get_rate(struct clk *clk)
 {
        return clk->rate;
 }
 EXPORT_SYMBOL(clk_get_rate);

Is this a problem?

julia
