From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 22 Oct 2004 23:40:26 +0000
Subject: Re: [KJ] [PATCH] net/ewrk3: replace schedule_timeout() with
Message-Id: <20041022234026.GG18906@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============91692816989016157=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041022232643.GC18906@us.ibm.com>
In-Reply-To: <20041022232643.GC18906@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============91692816989016157==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 23, 2004 at 12:34:07AM +0100, Jon Masters wrote:
> On Fri, 22 Oct 2004 16:33:43 -0700, Nishanth Aravamudan <nacc@us.ibm.com> wrote:
> 
> > Do you mean in the original driver or in my conversion?
> 
> Your conversion. Seems an order of magnitude larger than it needs to be.

The original was:

schedule_timeout(HZ>>2);

Which is, if my math is right,

HZ (the number of jiffies in a second) shifted 2 bits right, or divided
by 4. In other words, the number of jiffies in a quarter-second.

250 is the number of milliseconds in a quarter-second.

Thus, I think, the values are equivalent. Please correct and slap
accordingly...

-Nish

--===============91692816989016157==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============91692816989016157==--
