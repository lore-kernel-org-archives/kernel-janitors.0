From: maximilian attems <janitor@sternwelten.at>
Date: Sun, 24 Oct 2004 14:05:16 +0000
Subject: Re: [KJ] Re: [PATCH] w1/dscore: replace schedule_timeout() with
Message-Id: <20041024140516.GB23059@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============18811914066031155=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041023122050.4b018bc5@zanzibar.2ka.mipt.ru>
In-Reply-To: <20041023122050.4b018bc5@zanzibar.2ka.mipt.ru>
To: kernel-janitors@vger.kernel.org

--===============18811914066031155==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, 23 Oct 2004, Evgeniy Polyakov wrote:

> On Fri, 22 Oct 2004 16:24:24 -0700
> Nishanth Aravamudan <nacc@us.ibm.com> wrote:
> 
> > Any comments would be, as always, appreciated.
> > 
> > -Nish
> > 
> > Description: Uses msleep_interruptible() instead of schedule_timeout()
> > to guarantee the task delays as expected.
> 
> I'm Ok with your changes, all 4 patches applied, thank you.
> They will be sent for inlusion through Greg Kroah-Hartman.
> 
great, 
in between applied them to the kjt tree with your signed-off,
just to be shure they get applied and further tested.

thanks maks


--===============18811914066031155==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============18811914066031155==--
