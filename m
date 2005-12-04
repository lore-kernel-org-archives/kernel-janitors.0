From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Sun, 04 Dec 2005 20:18:28 +0000
Subject: Re: [KJ] [PATCH 1/21] polling loops: change exit condition to
Message-Id: <20051204201828.GB8197@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============16431738599892576=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <43923469.3090808@gmail.com>
In-Reply-To: <43923469.3090808@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============16431738599892576==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 04.12.2005 [20:57:52 +0100], Arnd Bergmann wrote:
> Am Sonntag 04 Dezember 2005 01:12 schrieb Marcin Slusarz:
> > hello everyone
> > here is the first part of patch which changes many polling loops to use
> > jiffies and time_after / time_before instead of counters
> > most of the changes are in drivers directory (except first patch)
> > as it is my first patch for linux kernel, feel free to point out any
> > mistake you'll find
> 
> Hmm, what happened to the poll_event API that Nish had suggested
> some time ago for this problem? Was there an actual reason against
> merging it or did the patch just get lost?

A good question. I'll try to dig up my patch from my old machine and
take a look if it can be used instead of all these changes.

Thanks,
Nish

--===============16431738599892576==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============16431738599892576==--
