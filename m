From: Nish Aravamudan <nish.aravamudan@gmail.com>
Date: Sat, 24 Jul 2004 01:41:28 +0000
Subject: Re: Re: [Kernel-janitors] [PATCH] saa7146_i2c: replace
Message-Id: <29495f1d04072318412d8d74d9@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============18544582468881798=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040723220936.GQ2675@us.ibm.com>
In-Reply-To: <20040723220936.GQ2675@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============18544582468881798==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 23 Jul 2004 21:12:25 -0400, Mark Hollomon
<markhollomon@comcast.net> wrote:
> I think this patch will result in delays 10 times too long.
> 
> 
> Nishanth Aravamudan wrote:
> >
<snip> 
>
> ms seems to be a number that expresses an interval in units of 1/10 of a
> millisecond.
> 
<snip>
> 
> But this would use it as a delay in milliseconds.

Ok, thanks, I wasn't sure about this - I had posted a while ago about
the weird conversion because I couldn't quite decipher what it was
intended to achieve. Looking over the math, I think I agree with you.
I will re-submit this patch soon. BTW, doesn't that seem kind of
confusing? - The delays are in terms of 1, 5 and 10 tenths of a
millisecond? If that's the case, then this patch is pretty much
useless (it makes sense to use msleep() with long delays, things
countable in msecs). I suppose I could re-patch so that the value of
SAA7146_I2C_DELAY is in msecs and then use msecs_to_jiffies() in
my_wait(). Thanks again!

-Nish

--===============18544582468881798==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============18544582468881798==--
