From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 16 Aug 2005 16:42:37 +0000
Subject: Re: [KJ] Timer code duplication in driver
Message-Id: <20050816164237.GA4144@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86892360104725364=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <4301E1D7.5070707@gmx.de>
In-Reply-To: <4301E1D7.5070707@gmx.de>
To: kernel-janitors@vger.kernel.org

--===============86892360104725364==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 16.08.2005 [14:53:43 +0200], Oliver Korpilla wrote:
> Hello!
> 
> I was just reviewing code about high resolution timers for learning to 
> use their API correctly, and have come to the following code duplication 
> (in 2.6.12.4 kernel.org):

<snip>

> Anyone else thinking this should be fixed?
> 
> Could someone please review this?

Your best bet is to write a patch and send it to Corey Minyard, George
Anzinger and the high-res-timers list, cc-ing KJ again... I think you
are right, but it's Corey's code and George's subsystem.

Thanks,
Nish

--===============86892360104725364==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86892360104725364==--
