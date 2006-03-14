From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 14 Mar 2006 14:38:41 +0000
Subject: Re: [KJ] Re: [PATCH] bug fix to include/linux/cn_proc.h for 2.6.16-rc5
Message-Id: <20060314143841.GA13445@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32359045779270534=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1142312124.24621.82.camel@stark>
In-Reply-To: <1142312124.24621.82.camel@stark>
To: kernel-janitors@vger.kernel.org

--===============32359045779270534==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 13.03.2006 [23:17:04 -0800], Narasimha Sharoff wrote:
> Matt,
> 
> Yes, i compile tested this. See the patch below.
> Note that the test uses the user space header
> /usr/include/linux/cn_proc.h which is the same as the
> one found at /usr/src/linux/include/linux.

This sounds like something is busted in userspace packaging. I would not
expect these files to be identical. That just sounds like a workaround
to the "don't include kernel files in userspace issue".

Thanks,
Nish

--===============32359045779270534==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32359045779270534==--
