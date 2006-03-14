From: Matt Helsley <matthltc@us.ibm.com>
Date: Tue, 14 Mar 2006 19:19:42 +0000
Subject: Re: [KJ] Re: [PATCH] bug fix to include/linux/cn_proc.h for 2.6.16-rc5
Message-Id: <1142363982.24621.128.camel@stark>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76224432111264662=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1142312124.24621.82.camel@stark>
In-Reply-To: <1142312124.24621.82.camel@stark>
To: kernel-janitors@vger.kernel.org

--===============76224432111264662==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2006-03-14 at 06:38 -0800, Nishanth Aravamudan wrote:
> On 13.03.2006 [23:17:04 -0800], Narasimha Sharoff wrote:
> > Matt,
> > 
> > Yes, i compile tested this. See the patch below.
> > Note that the test uses the user space header
> > /usr/include/linux/cn_proc.h which is the same as the
> > one found at /usr/src/linux/include/linux.
> 
> This sounds like something is busted in userspace packaging. I would not
> expect these files to be identical. That just sounds like a workaround
> to the "don't include kernel files in userspace issue".
> 
> Thanks,
> Nish

Narasimha,

	Who packaged the headers? Is it a distro package? If so it may be
appropriate to contact them and point out the problem. I'd appreciate
being cc'd just so I can track this.

	Thanks for submitting a report.

Cheers,
	-Matt Helsley


--===============76224432111264662==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76224432111264662==--
