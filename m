From: Mark Hollomon <markhollomon@comcast.net>
Date: Sun, 25 Jul 2004 01:10:27 +0000
Subject: Re: [Kernel-janitors] [PATCH] saa7146_i2c: replace schedule_timeout()
Message-Id: <41030883.7050202@comcast.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============80435747150876491=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040723220936.GQ2675@us.ibm.com>
In-Reply-To: <20040723220936.GQ2675@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============80435747150876491==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Nish Aravamudan wrote:

> 
> Ok, thanks, I wasn't sure about this - I had posted a while ago about
> the weird conversion because I couldn't quite decipher what it was
> intended to achieve. Looking over the math, I think I agree with you.
> I will re-submit this patch soon. BTW, doesn't that seem kind of
> confusing? - The delays are in terms of 1, 5 and 10 tenths of a
> millisecond? If that's the case, then this patch is pretty much
> useless (it makes sense to use msleep() with long delays, things
> countable in msecs). I suppose I could re-patch so that the value of
> SAA7146_I2C_DELAY is in msecs and then use msecs_to_jiffies() in
> my_wait(). Thanks again!

Very confusing. Also, a millisecond is added to the delay. So, if you 
pass in 10, the expression will partially evaluate to 2 * HZ / 1000 
which is effectively 2 milliseconds.


But I suspect the +10 in the original code was simply to ensure that the 
delay was never zero. I don't remember if gcc does all the constant 
folding in float and truncate at the end or if it truncates as it goes. 
But if it truncates partial results then ms/10 will be zero if  ms < 10.

Alright, a simple compile test proves that the evaluation is done 
completely as an integer. [ eg ((5/10)*10) == 0 ].

So passing either 1 or 5 to my_wait will get you a millisecond delay. 
Passing 10 in will get you a 2 millisecond delay.

If you wanted to be cheap, you could make the guts of my_wait be simply
	msleep((ms+10)/10)
and let somebody else figure out what was really meant.






-- 
--------------------------
Mark Hollomon

--===============80435747150876491==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============80435747150876491==--
