From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 25 Oct 2004 16:08:51 +0000
Subject: Re: [KJ] [PATCH] net/ewrk3: replace schedule_timeout() with
Message-Id: <20041025160851.GA2209@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============67241800953327036=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041022232643.GC18906@us.ibm.com>
In-Reply-To: <20041022232643.GC18906@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============67241800953327036==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 23, 2004 at 01:33:33AM +0100, Jon Masters wrote:
> On Fri, 22 Oct 2004 16:40:26 -0700, Nishanth Aravamudan <nacc@us.ibm.com> wrote:
> 
> > The original was:
> > 
> > schedule_timeout(HZ>>2);
> 
> I just wandered whether that was kicking around and assuming some
> smaller value of HZ.

I don't think it should matter, as the intended delay, on any system,
will be one quarter of a second. Now, whether schedule_timeout() really
achieves this for all arch's is a different question :)

-Nish

--===============67241800953327036==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============67241800953327036==--
