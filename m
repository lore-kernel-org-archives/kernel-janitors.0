From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 20 Apr 2005 18:42:59 +0000
Subject: Re: [KJ] Re: Audit return codes (Question about getting started)
Message-Id: <20050420184259.GC3444@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53305850244282271=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42669D23.9010501@gmail.com>
In-Reply-To: <42669D23.9010501@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============53305850244282271==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Jesse Millan <jesse.millan@gmail.com> [2005-0420 11:19:15 -0700]:

> 
> I just want to make sure that I understand the process correctly:
> 
> For example, take kalloc(). If I find instances that that the return
> value is not checked (and I have) i.e. they call kalloc() and
> automatically assume success and dereference the allocated memory
> without checking for NULL. I would insert to proper error checking,
> create the patch and mail the patch to kernel-janitors@lists.osdl.org?
> 
> Is this the process?

Generally, yes. You probably should verify the patch doesn't wrap in
your mail & applies cleanly by mailing to yourself.

Otherwise, send patches to the KJML and wait for replies.

Thanks,
Nish

--===============53305850244282271==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53305850244282271==--
